// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageModels {
  String messageId;
  String chatId;
  StringBuffer message;
  Role role;
  List<String> imageUrl;
  DateTime timeSent;

  MessageModels({
    required this.messageId,
    required this.chatId,
    required this.message,
    required this.role,
    required this.imageUrl,
    required this.timeSent,
  });

  // to Map
  Map<String, dynamic> toMap() {
    return {
      "messagrId": messageId,
      "chatId": chatId,
      "message": message.toString(),
      "role": role.index,
      "image": imageUrl,
      "timesent": timeSent.toIso8601String(),
    };
  }

  factory MessageModels.fromMap(Map<String, dynamic> map) {
    return MessageModels(
      messageId: map["messageId"],
      chatId: map["chatId"],
      message: StringBuffer(map["message"]),
      role: Role.values[map["role"]],
      imageUrl: List<String>.from(map["imageUrl"]),
      timeSent: DateTime.parse(map["timeSent"]),
    );
  }
  MessageModels copyWith(
      {String? messageId,
      String? chatId,
      Role? role,
      StringBuffer? message,
      List<String>? imageUrl,
      DateTime? timeSent}) {
    return MessageModels(
      messageId: messageId ?? this.messageId,
      chatId: chatId ?? this.chatId,
      message: message ?? this.message,
      role: role ?? this.role,
      imageUrl: imageUrl ?? this.imageUrl,
      timeSent: timeSent ?? this.timeSent,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageModels && other.messageId == messageId;
  }

  @override
  int get hashCode {
    return messageId.hashCode;
  }
}

enum Role {
  user,
  assistant,
}
