import 'dart:developer';
import 'dart:typed_data';


import 'package:education_app/hive/chat_history.dart';
import 'package:education_app/hive/setttings_model.dart';
import 'package:education_app/hive/user_model.dart';
import 'package:education_app/models/message_models.dart';
import 'package:education_app/services/api_services.dart';
import 'package:education_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:uuid/uuid.dart';

class ChatProvider extends ChangeNotifier {
  // list of messages
  List<MessageModels> _inChatmessages = [];

  // List image
  List<XFile>? _imagesFilesList = [];

  // current Chat Id = 0
  String _currentChatId = '';

// initialize generative model
  GenerativeModel? _model;

  // initialize text model
  GenerativeModel? _textModel;

  // initialize image model
  GenerativeModel? _visionModel;

//  current model
  String _modelType = "gemini-pro";

  // loading bool
  bool _isLoading = false;

  // getters
  List<MessageModels> get inChatmessages => _inChatmessages;
  List<XFile>? get imageFileList => _imagesFilesList;
  String get currentChatId => _currentChatId;
  GenerativeModel? get model => _model;
  GenerativeModel? get textModel => _textModel;
  GenerativeModel? get visionodel => _visionModel;
  String get modelTyoe => _modelType;
  bool get isLoading => _isLoading;

  //setters
  //set inChat messages
  Future<void> setInChatMessages({required String chatId}) async {
    // get messages from hive database
    final messagesFromDB = await loadMessagesFromDB(chatId: chatId);

    for (var message in messagesFromDB) {
      if (_inChatmessages.contains(message)) {
        log("message already exist");
        continue;
      }
      _inChatmessages.add(message);
    }
    notifyListeners();
  }

  // load messages from database
  Future<List<MessageModels>> loadMessagesFromDB(
      {required String chatId}) async {
    // open the box of these chat id
    await Hive.openBox("${Constants.chatMessagesBox}$chatId");
    final messageBox = Hive.box("${Constants.chatMessagesBox}$chatId");

    final newData = messageBox.keys.map(
      (e) {
        final message = messageBox.get(e);
        final messageData =
            MessageModels.fromMap(Map<String, dynamic>.from(message));

        return messageData;
      },
    ).toList();
    notifyListeners();
    return newData;
  }

  // set file list

  void setImagesFileList({required List<XFile> imagesList}) {
    _imagesFilesList = imagesList;
    notifyListeners();
  }

  // set current model
  String setCurrentModel({required String newmodel}) {
    _modelType = newmodel;
    notifyListeners();
    return newmodel;
  }

  // function to set the model based on bool = text only
  Future<void> setModel({required bool isTextOnly}) async {
    if (isTextOnly) {
      _model = _textModel ??
          GenerativeModel(
              model: setCurrentModel(newmodel: "gemini-pro"),
              apiKey: ApiService.apiKey);
    } else {
      _model = _visionModel ??
          GenerativeModel(
              model: setCurrentModel(newmodel: "gemini-pro-vision"),
              apiKey: ApiService.apiKey);
    }
    notifyListeners();
  }

  // String getApiKey() {
  //   return dotenv.env[ApiService.apiKey].toString;
  // }

  void setCurrentChatId({required String newChatId}) {
    _currentChatId = newChatId;
    notifyListeners();
  }

  void setLoading({required bool value}) {
    _isLoading = value;
    notifyListeners();
  }

  // send message to gemini and get response
  Future<void> sentMessage(
      {required String message, required bool isTextOnly}) async {
    // set the model
    await setModel(isTextOnly: isTextOnly);
    // set loading

    setLoading(value: true);

    // get the chat id
    String chatId = getChatId();

    // list of history messages

    List<Content> history = [];

    // get chat history

    history = await getHistory(chatId: chatId);
    // get images Url
    List<String> imageUrls = getImagesUrl(isTextOnly: isTextOnly);

    // get user message
    final userMessage = MessageModels(
      messageId: '',
      chatId: chatId,
      message: StringBuffer(message),
      role: Role.user,
      imageUrl: imageUrls,
      timeSent: DateTime.now(),
    );

    // add message to in chat message
    _inChatmessages.add(userMessage);
    notifyListeners();

    if (currentChatId.isEmpty) {
      setCurrentChatId(newChatId: chatId);
    }
    // wait for response from a1
    await sentMesaageAndWaitForResponse(
        message: message,
        chatId: chatId,
        isTextOnly: isTextOnly,
        history: history,
        userMessage: userMessage);
  }

  Future<void> sentMesaageAndWaitForResponse({
    required String message,
    required String chatId,
    required bool isTextOnly,
    required List<Content> history,
    required MessageModels userMessage,
  }) async {
    // start the chat section only send history
    final chatSection = _model!.startChat(
      history: history.isEmpty || !isTextOnly ? null : history,
    );
    // get content
    final content = await getContent(message: message, isTextOnly: isTextOnly);

    // assistant message

    final assitantMessage = userMessage.copyWith(
        messageId: '',
        message: StringBuffer(),
        role: Role.assistant,
        timeSent: DateTime.now());
    // add this message to the list on inChat message
    inChatmessages.add(assitantMessage);
    notifyListeners();

// wait for streamed respons
    chatSection.sendMessageStream(content).asyncMap((event) {
      return event;
    }).listen((event) {
      _inChatmessages
          .firstWhere(
            (element) =>
                element.messageId == assitantMessage &&
                element.role == Role.assistant,
          )
          .message
          .write(event.text);
      notifyListeners();
    }, onDone: () {
      // save message to hive db

// set  loading to true
      setLoading(value: false);
    }).onError((error, stackrace) {
      // set  loading
      setLoading(value: false);
    });
  }

  Future<Content> getContent(
      {required message, required bool isTextOnly}) async {
    if (isTextOnly) {
      return Content.text(message);
    } else {
      // generate text from image input
      final imageFuture = _imagesFilesList
          ?.map((imageFile) => imageFile.readAsBytes())
          .toList(growable: false);

      final imageBytes = await Future.wait(imageFuture!);
      final prompt = TextPart(message);
      final imageParts = imageBytes
          .map((bytes) => DataPart("image/jpg", Uint8List.fromList(bytes)))
          .toList();
      return Content.model([prompt, ...imageParts]);
    }
  }

  // get the images url
  List<String> getImagesUrl({required bool isTextOnly}) {
    List<String> imageUrls = [];
    if (isTextOnly && imageFileList != null) {
      for (var image in imageFileList!) {
        imageUrls.add(image.path);
      }
    }
    return imageUrls;
  }

  Future<List<Content>> getHistory({required chatId}) async {
    List<Content> history = [];
    if (currentChatId.isNotEmpty) {
      await setInChatMessages(chatId: chatId);
      for (var message in inChatmessages) {
        if (message.role == Role.user) {
          history.add(
            Content.text(
              message.message.toString(),
            ),
          );
        } else {
          history.add(Content.model([
            TextPart(
              message.message.toString(),
            )
          ]));
        }
      }
    }
    return history;
  }

  String getChatId() {
    if (currentChatId.isEmpty) {
      return const Uuid().v4();
    } else {
      return currentChatId;
    }
  }

  // init Hive box
  static initHive() async {
    final dir = await path.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    await Hive.initFlutter(Constants.geminiIdb);

    // register adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ChatHistoryAdapter());

      // open chat history box
      await Hive.openBox<ChatHistory>(Constants.chatHistoryBox);
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserModelAdapter());

      // open chat history box
      await Hive.openBox<UserModel>(Constants.userBox);
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(SettingsAdapter());

      // open chat history box
      await Hive.openBox<Settings>(Constants.settingsBox);
    }
  }
}
