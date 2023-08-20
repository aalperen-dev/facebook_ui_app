// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook_ui_app/widgets/user_card.dart';
import 'package:flutter/material.dart';

import 'package:facebook_ui_app/models/user_model.dart';

class ContactList extends StatelessWidget {
  final List<User> users;
  const ContactList({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 280,
      ),
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey,
              ),
              SizedBox(width: 8),
              Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final User user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: UserCard(user: user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
