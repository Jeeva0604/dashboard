import 'package:flutter/material.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/constant/app_online_image.dart';
import 'poll_card.dart';
import 'social_post_card.dart';
import 'story_rows.dart';

class FeedBody extends StatelessWidget {
  const FeedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        //Story Grid
        StoriesRow(),

        SizedBox(height: 8),

        //Post Card
        SocialPostCard(
          profileImage: AppOnlineImage.univercityImage1,
          title: "Amet University",
          time: "7 min ago",
          postImage: AppAssets.image1,
          bottomText: "#SIMULATION  #NAUTICALWING",
          likes: 60,
          comments: 37,
          shares: 20,
          likedText: "Liked by Libin and 345 others",
          showBorder: true,
          showIconProfile: true,
        ),

        SizedBox(height: 8),

        //Poll Card
        PollCard(),

        SizedBox(height: 8),

        //Post Card
        SocialPostCard(
          profileImage: AppOnlineImage.profileImage,
          title: "Himt Chennai",
          time: "27 min ago",
          postImage: AppAssets.image2,
          bottomText: "Himtcollege.com/himt_courses/graduate-marine-...",
          likes: 30,
          comments: 22,
          shares: 12,
          likedText: "Liked by pankaj and 271 others",
          isFollowing: true,
        ),

        SizedBox(height: 16),
      ],
    );
  }
}
