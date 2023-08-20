// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook_ui_app/config/palette.dart';
import 'package:facebook_ui_app/widgets/profile_avatar.dart';
import 'package:facebook_ui_app/widgets/responsive.dart';
import 'package:flutter/material.dart';

import 'package:facebook_ui_app/models/user_model.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: isDesktop ? 5 : 0,
      ),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
          : null,
      child: Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 10,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          width: 3,
          color: Colors.blueAccent,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {},
      child: Row(
        children: [
          ShaderMask(
            child: const Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
            shaderCallback: (bounds) =>
                Palette.createRoomGradient.createShader(bounds),
          ),
          const SizedBox(width: 4),
          const Text(
            'Create\nRoom',
            style: TextStyle(color: Palette.facebookBlue),
          ),
        ],
      ),
    );
  }
}
