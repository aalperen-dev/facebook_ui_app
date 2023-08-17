import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:facebook_ui_app/models/user_model.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                backgroundImage:
                    CachedNetworkImageProvider(currentUser.imageUrl),
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?',
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 10,
            thickness: 0.5,
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                  label: const Text('Live'),
                ),
                const VerticalDivider(
                  width: 8,
                ),
                TextButton.icon(
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  onPressed: () {},
                  label: const Text('Photo'),
                ),
                const VerticalDivider(
                  width: 8,
                ),
                TextButton.icon(
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  onPressed: () {},
                  label: const Text('Live'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
