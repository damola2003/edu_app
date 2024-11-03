

import 'dart:developer';

import 'package:education_app/providers/chat_provider.dart';
import 'package:flutter/material.dart';

class BottomChatField extends StatefulWidget {
  const BottomChatField({super.key, required this.chatProvider});
  final ChatProvider chatProvider;
  @override
  State<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends State<BottomChatField> {
  final TextEditingController textController = TextEditingController();
  final FocusNode textFocus = FocusNode();

  @override
  void dispose() {
    textController.dispose();
    textFocus.dispose();
    super.dispose();
  }

  Future<void> sendChatMessage({
    required String message,
    required ChatProvider chatProvider,
    required bool isTextOnly,
  }) async {
    try {
      await chatProvider.sentMessage(message: message, isTextOnly: isTextOnly);
    } catch (e) {
      log("error: $e");
    } finally {
      textController.clear();
      textFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // pick image
            },
            icon: Icon(
              Icons.image,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              focusNode: textFocus,
              controller: textController,
              textInputAction: TextInputAction.send,
              onSubmitted: (String value) {
                if (value.isNotEmpty) {
                  sendChatMessage(
                      message: textController.text,
                      chatProvider: widget.chatProvider,
                      isTextOnly: true);
                }
              },
              decoration: InputDecoration.collapsed(
                  hintText: "Ask a Question....",
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(30),
                  )

                  // border: InputBorder.none,
                  ),
            ),
          ),
          IconButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                sendChatMessage(
                    message: textController.text,
                    chatProvider: widget.chatProvider,
                    isTextOnly: true);
              }
            },
            icon: Icon(
              Icons.send,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          )
        ],
      ),
    );
  }
}
