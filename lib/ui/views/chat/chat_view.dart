import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peek/app/locator.dart';
import 'package:peek/helpers/constants/colors.dart';
import 'package:peek/helpers/extensions/build_context/media_query.dart';
import 'package:peek/helpers/extensions/build_context/text_theme.dart';
import 'package:stacked/stacked.dart';

import 'chat_viewmodel.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
        viewModelBuilder: () => ChatViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.deepBlack,
              appBar: AppBar(
                backgroundColor: AppColors.deepBlack,
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    InkWell(
                      onTap: locator<GoRouter>().pop,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.white,
                        size: 17,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 30,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT583_HWz1qEN6hCuKJZ4aqOZQtr5C8lShJk1JiEcLdV2OFi1w0iY3YoN8bqw&s"),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Tyler Swift',
                                    style: context.textTheme.titleSmall
                                        ?.copyWith(color: AppColors.white)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Online",
                                      style: context.textTheme.labelSmall
                                          ?.copyWith(color: AppColors.white),
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.green),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                actions: [
                  Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.buttonColor.withOpacity(0.3),
                    ),
                    child: const Icon(
                      Icons.phone_in_talk_outlined,
                      color: AppColors.textGrey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              body: const ChatBody(),
            ));
  }
}

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Center(
                  child: Text(
                "You started chatting on 24/11/2023",
                style: context.textTheme.labelSmall
                    ?.copyWith(color: AppColors.textGrey),
              )),
              const ChatMessage(isMyMessage: false, text: 'Hello there!'),
              const ChatMessage(
                  isMyMessage: true,
                  text:
                      'This is flutter based flyer_Distrubtion App where we need to change lots of things Like Change DB from mysql lite to mysql'),
              const ChatMessage(
                  isMyMessage: false,
                  text:
                      'Whenever the distributors take on a job they will start a tracker to record their route for flyer distribution.'),
              const ChatMessage(
                  isMyMessage: true,
                  text:
                      'This is flutter based flyer_Distrubtion App where we need to change lots of things Like Change DB from mysql lite to mysql'),
              const ChatMessage(
                  isMyMessage: true,
                  text:
                      'This is flutter based flyer_Distrubtion App where we need to change lots of things Like Change DB from mysql lite to mysql'),
              const ChatMessage(
                  isMyMessage: false,
                  text:
                      'Once you have downloaded the correct Flutter Version, clone the project onto your system.'),
              const ChatMessage(
                  isMyMessage: true,
                  text:
                      'This is flutter based flyer_Distrubtion App where we need to change lots of things Like Change DB from mysql lite to mysql'),
              // Add more messages as needed
            ],
          ),
        ),
        const Divider(height: 1),
        Container(
          color: AppColors.normalBlack,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.attach_file_outlined,
                  color: AppColors.white,
                ),
                onPressed: () {
                  // Add functionality for the link icon here
                  print('Link icon pressed');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.image_outlined,
                  color: AppColors.textGrey,
                ),
                onPressed: () {
                  // Add functionality for the image icon here
                  print('Image icon pressed');
                },
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'Reply Messages...',
                      hintStyle: context.textTheme.labelSmall
                          ?.copyWith(color: AppColors.textGrey)),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.send,
                  color: AppColors.textGrey,
                ),
                onPressed: () {
                  // Add functionality for the send icon here
                  print('Send icon pressed');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isMyMessage;
  final String text;

  const ChatMessage({required this.isMyMessage, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: context.widthPercent(0.7)),
        decoration: BoxDecoration(
          color: isMyMessage ? Colors.blue : Colors.green,
          borderRadius: isMyMessage
              ? const BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(7))
              : const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(7),
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(0)),
        ),
        child: Text(
          text,
          style: context.textTheme.labelLarge,
        ),
      ),
    );
  }
}
