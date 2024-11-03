
import 'package:education_app/providers/chat_provider.dart';
import 'package:education_app/utils/bottom_chat_field.dart';
import 'package:education_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AiPage extends StatefulWidget {
  const AiPage({super.key});

  @override
  State<AiPage> createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
  //chat controller
  final TextEditingController _messageController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 12, left: 14, right: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back),
                        ),
                        const Text(
                          "Ask Ai a Question",
                          style: Constants.mediumHeaderStyle,
                        ),
                        Constants.appLogo,
                      ],
                    ),
                  ),
                  Expanded(
                    child: chatProvider.inChatmessages.isEmpty
                        ? const Center(
                            child: Text(
                              "Ask Gemini a Question",
                            ),
                          )
                        : ListView.builder(
                            itemCount: chatProvider.inChatmessages.length,
                            itemBuilder: (context, index) {
                              final message =
                                  chatProvider.inChatmessages[index];
                              return ListTile(
                                title: Text(message.message.toString()),
                              );
                            },
                          ),
                  ),
                  BottomChatField(chatProvider: chatProvider),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
