import 'package:facebook_ui_app/config/palette.dart';
import 'package:facebook_ui_app/data/data.dart';
import 'package:facebook_ui_app/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/create_post_cont.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
                fontSize: 28,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30,
                onPressed: () {},
              ),
              CircleButton(
                icon: MdiIcons.facebookMessenger,
                iconSize: 30,
                onPressed: () {},
              ),
            ],
          ),
          const SliverToBoxAdapter(
              child: CreatePostContainer(
            currentUser: currentUser,
          )),
        ],
      ),
    );
  }
}
