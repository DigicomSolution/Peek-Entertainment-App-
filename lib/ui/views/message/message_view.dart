import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peek/helpers/constants/assets.dart';
import 'package:peek/helpers/constants/colors.dart';
import 'package:peek/helpers/extensions/build_context/build_context.dart';
import 'package:peek/helpers/extensions/build_context/text_theme.dart';
import 'package:peek/ui/views/message/message_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MessageViewModel>.reactive(
        viewModelBuilder: () => MessageViewModel(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: AppColors.deepBlack,
              appBar: AppBar(
                backgroundColor: AppColors.deepBlack,
                automaticallyImplyLeading: false,
                title: Text(
                  "Messages",
                  style: context.textTheme.titleMedium
                      ?.copyWith(color: AppColors.white),
                ),
                actions: [
                  SvgPicture.asset(
                    AppAssets.messageEdit,
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: model.messages.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppAssets.messageEmpty),
                            const Text("No messages yet!")
                          ],
                        ),
                      )
                    : ListView(
                        children: [
                          SizedBox(
                            height: context.heightPercent(0.05),
                            child: TextFormField(
                              controller: model.searchController,
                              keyboardType: TextInputType.text,
                              style: context.textTheme.labelLarge
                                  ?.copyWith(color: AppColors.white),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.normalBlack,
                                  labelText: "Search",
                                  labelStyle: const TextStyle(
                                      color: AppColors.textGrey, fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: AppColors
                                            .buttonColor), // Orange border when focused
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.search_outlined,
                                    color: AppColors.white,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(height: 100, child: ActiveUsersList()),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: model.goToChatView,
                            child: const MessageChatWidget(
                              imageUrl:
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT583_HWz1qEN6hCuKJZ4aqOZQtr5C8lShJk1JiEcLdV2OFi1w0iY3YoN8bqw&s',
                              name: 'Tyler Swift',
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MessageChatWidget(
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzK5S9Oykm8HngtnKj76uClPksD94LIVStmGNki_pBQ&s',
                            name: 'Alex Scott',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MessageChatWidget(
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8z_lT9xmE8tqkdIy65D2XiIfm_KuCQLcEqBKsVf35KOSdq0Kr5xYtbQ1nkQ&s',
                            name: 'Brian James',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MessageChatWidget(
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzK5S9Oykm8HngtnKj76uClPksD94LIVStmGNki_pBQ&s',
                            name: 'Scott Mech',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MessageChatWidget(
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzK5S9Oykm8HngtnKj76uClPksD94LIVStmGNki_pBQ&s',
                            name: 'Woods John',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MessageChatWidget(
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzK5S9Oykm8HngtnKj76uClPksD94LIVStmGNki_pBQ&s',
                            name: 'Tope Simi',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MessageChatWidget(
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzK5S9Oykm8HngtnKj76uClPksD94LIVStmGNki_pBQ&s',
                            name: 'Ahmed Sani',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MessageChatWidget(
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzK5S9Oykm8HngtnKj76uClPksD94LIVStmGNki_pBQ&s',
                            name: 'Salim Umer',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MessageChatWidget(
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzK5S9Oykm8HngtnKj76uClPksD94LIVStmGNki_pBQ&s',
                            name: 'Peter Btuch',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const MessageChatWidget(
                            name: "John Doe",
                            imageUrl:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzK5S9Oykm8HngtnKj76uClPksD94LIVStmGNki_pBQ&s',
                          ),
                        ],
                      ),
              ),
            ));
  }
}

class MessageChatWidget extends StatelessWidget {
  const MessageChatWidget({
    super.key,
    required this.imageUrl,
    required this.name,
  });
  final String imageUrl;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.normalBlack),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(name),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.green),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Hello 😊. I will be pleased to meet you jfjfj",
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "15 min",
            style:
                context.textTheme.titleSmall?.copyWith(color: AppColors.white),
          )
        ],
      ),
    );
  }
}

class ActiveUsersList extends StatelessWidget {
  final List<String> userAvatars = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT583_HWz1qEN6hCuKJZ4aqOZQtr5C8lShJk1JiEcLdV2OFi1w0iY3YoN8bqw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8z_lT9xmE8tqkdIy65D2XiIfm_KuCQLcEqBKsVf35KOSdq0Kr5xYtbQ1nkQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFdjV7B8hn16qTbYPFzZVRiYLXX1k0bpdx6xTGzpIRZm9PxAPrQXLku8kXEw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdzK5S9Oykm8HngtnKj76uClPksD94LIVStmGNki_pBQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYNbWxNyDw0PPEQ88-OFj5ySYbAsNUH9gFIyVLMwy0tA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8z_lT9xmE8tqkdIy65D2XiIfm_KuCQLcEqBKsVf35KOSdq0Kr5xYtbQ1nkQ&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFdjV7B8hn16qTbYPFzZVRiYLXX1k0bpdx6xTGzpIRZm9PxAPrQXLku8kXEw&s',
  ];

  ActiveUsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: userAvatars.length + 1, // Plus one for the "Add" button
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.buttonColor,
              ),
              child: IconButton(
                icon: const Icon(Icons.add, color: AppColors.deepBlack),
                onPressed: () {
                  // Add functionality for adding a user here
                  if (kDebugMode) {
                    print('Add button pressed');
                  }
                },
              ),
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(userAvatars[index - 1]),
                // Placeholder for users without an image
                child: userAvatars[index - 1] != null
                    ? null
                    : Text('User ${index.toString()}'),
              ),
            ),
          );
        }
      },
    );
  }
}
