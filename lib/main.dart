import 'package:dashboard/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'features/dashboard/presentation/pages/home_page.dart';

void main() {
  runApp(const MaritimeSocialApp());
}

class MaritimeSocialApp extends StatelessWidget {
  const MaritimeSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.scaffoldColor),
      home: const HomeScreen(),
    );
  }
}
