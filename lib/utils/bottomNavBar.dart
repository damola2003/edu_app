

import 'package:education_app/pages/home_pages.dart';
import 'package:education_app/pages/lesson_page.dart';
import 'package:education_app/pages/profile_page.dart';
import 'package:education_app/pages/progress_page.dart';
import 'package:education_app/utils/constants.dart';
import 'package:flutter/material.dart';

class bottomNavbar extends StatelessWidget {
  const bottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 50,
          child: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.book),
              text: "Lesson",
            ),
            Tab(
              icon: Icon(Icons.timer),
              text: "Progress",
            ),
            Tab(
              icon: Icon(Icons.person_outline),
              text: "Profile",
            )
          ], labelColor: Constants.themeColor),
        ),
        body: TabBarView(
          children: [
            HomePage(),
            LessonPage(),
            ProgressPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
