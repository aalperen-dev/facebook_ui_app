// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:facebook_ui_app/config/palette.dart';
import 'package:facebook_ui_app/models/post_model.dart';
import 'package:facebook_ui_app/widgets/profile_avatar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(height: 4),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: _PostStats(post: post),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} ·',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[800],
                    size: 12,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.more_vert,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;
  const _PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                '${post.likes}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${post.shares} Shares',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                MdiIcons.thumbUpOutline,
                color: Colors.grey,
                size: 20,
              ),
              label: 'Like',
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey,
                size: 20,
              ),
              label: 'Comment',
              onTap: () {},
            ),
            _PostButton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey,
                size: 25,
              ),
              label: 'Share',
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;
  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
