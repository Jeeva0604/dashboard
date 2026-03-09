import 'package:dashboard/core/constant/app_online_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class SocialPostCard extends StatefulWidget {
  final String profileImage;
  final String title;
  final String time;
  final String postImage;
  final String bottomText;
  final bool isFollowing;
  final bool showIconProfile;
  final int likes;
  final int comments;
  final int shares;
  final String likedText;

  const SocialPostCard({
    super.key,
    required this.profileImage,
    required this.title,
    required this.time,
    required this.postImage,
    required this.bottomText,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.likedText,
    this.isFollowing = false,
    this.showIconProfile = false,
  });

  @override
  State<SocialPostCard> createState() => _SocialPostCardState();
}

class _SocialPostCardState extends State<SocialPostCard> {
  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// HEADER
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
                    child: Row(
                      children: [
                        /// Profile Image
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,

                            image: DecorationImage(
                              image: NetworkImage(widget.profileImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        /// Name & Time
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Text(
                                widget.time,
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Follow Button
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor.withValues(
                              alpha: 0.2,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            widget.isFollowing ? 'Following' : "Follow",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4),
                        const Icon(
                          Icons.more_vert,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),

                  /// POST IMAGE
                  Stack(
                    children: [
                      Image.asset(
                        widget.postImage,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),

                      Positioned(
                        bottom: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),

                      /// volume icon
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.volume_up,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Hashtag / URL
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
                    child: Text(
                      widget.bottomText,
                      style: const TextStyle(
                        color: AppColors.tealColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),

                  /// ACTION ROW
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 4, 12, 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.thumb_up,
                          color: AppColors.primaryColor,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text("${widget.likes}"),

                        const SizedBox(width: 16),

                        const Icon(
                          Icons.chat_bubble_outline,
                          color: AppColors.primaryColor,

                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${widget.comments}",
                          style: TextStyle(color: AppColors.tealColor),
                        ),

                        const SizedBox(width: 16),

                        const Icon(
                          Icons.share_outlined,
                          color: AppColors.primaryColor,

                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${widget.shares}",
                          style: TextStyle(color: AppColors.tealColor),
                        ),

                        const Spacer(),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              bookmarked = !bookmarked;
                            });
                          },
                          child: Icon(
                            bookmarked ? Icons.bookmark : Icons.bookmark_border,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Row(
              children: [
                _likeAvatars(),
                const SizedBox(width: 8),
                Text(
                  widget.likedText,
                  style: TextStyle(fontSize: 14, color: AppColors.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _likeAvatars() {
    final image = [
      AppOnlineImage.person3,
      AppOnlineImage.person2,
      AppOnlineImage.person5,
    ];

    return SizedBox(
      width: 52,
      height: 22,
      child: Stack(
        children: List.generate(
          image.length,
          (i) => Positioned(
            left: i * 16.0,
            child: CircleAvatar(
              radius: 11,
              backgroundImage: NetworkImage(image[i]),
            ),
          ),
        ),
      ),
    );
  }
}
