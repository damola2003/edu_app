


import 'package:education_app/hive/chat_history.dart';
import 'package:education_app/hive/setttings_model.dart';
import 'package:education_app/hive/user_model.dart';
import 'package:education_app/utils/constants.dart';
import 'package:hive/hive.dart';

class Boxex {
  // get the chat history box
  static Box<ChatHistory> getChatHistory() =>
      Hive.box<ChatHistory>(Constants.chatHistoryBox);

  // get the users box
  static Box<UserModel> getUserModel() => Hive.box<UserModel>(Constants.userBox);
  static Box<Settings> getSettings() => Hive.box<Settings>(Constants.settingsBox);
}
