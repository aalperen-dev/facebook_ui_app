// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook_ui_app/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import 'package:facebook_ui_app/models/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(width: 6),
          Text(
            user.name,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
