import 'package:dashboard/core/constant/app_online_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';

class StoriesRow extends StatelessWidget {
  const StoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = [
      _StoryData(hasPlus: true, image: AppOnlineImage.profileImage),
      _StoryData(image: AppOnlineImage.person2),
      _StoryData(image: AppOnlineImage.person3),
      _StoryData(image: AppOnlineImage.person4),
      _StoryData(image: AppOnlineImage.person5),
      _StoryData(image: AppOnlineImage.person1),
    ];

    return Container(
      height: 90,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // one row
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return _buildStory(stories[index]);
        },
      ),
    );
  }

  Widget _buildStory(_StoryData data) {
    return Stack(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primaryColor, width: 2),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(data.image),
          ),
        ),
        if (data.hasPlus)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 12),
            ),
          ),
      ],
    );
  }
}

class _StoryData {
  final bool hasPlus;
  final String image;
  _StoryData({this.hasPlus = false, required this.image});
}
