import 'package:flutter/material.dart';

class Constants {
  static const themeColor = Color.fromARGB(255, 110, 112, 242);
  static const subThemeColor = Color.fromARGB(255, 175, 177, 255);
  static const mediumHeaderStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 17,
  );
  // static final backgroungColor = Theme.of(context).colorScheme.primary;
  static const headerStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );
  static final appLogo = Image.asset("lib/assets/logo.png");

  static String chatHistoryBox = "chat_history";
  static String userBox = "user_history";
  static String settingsBox = "settings";
  static String chatMessagesBox = "chatMessages_";
  static String geminiIdb = "gemini.db";
}
