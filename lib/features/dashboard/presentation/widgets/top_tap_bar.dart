import 'package:dashboard/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class TopTabBar extends StatefulWidget {
  const TopTabBar({super.key});

  @override
  State<TopTabBar> createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar> {
  int selectedIndex = 2;

  final icons = [
    Icons.home_outlined,
    Icons.people_outline,
    Icons.upload_outlined,
    Icons.description_outlined,
    Icons.menu_book_outlined,
    Icons.campaign_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: icons.length,
        itemBuilder: (context, index) {
          final selected = index == selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width / icons.length,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icons[index],
                    color: selected
                        ? AppColors.primaryColor
                        : AppColors.primaryColor.withValues(alpha: 0.6),
                  ),
                  const SizedBox(height: 6),
                  if (selected)
                    Container(
                      width: 20,
                      height: 3,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2E3580),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
