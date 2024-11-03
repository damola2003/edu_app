
import 'package:education_app/models/course_Model.dart';
import 'package:education_app/pages/settingsPage.dart';
import 'package:education_app/utils/constants.dart';
import 'package:education_app/utils/rectangleBoxes.dart';
import 'package:education_app/utils/subjectContainer.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => bottomNavbar(),
                        //   ),
                        // );
                      },
                      child: Image.asset("lib/assets/logo.png")
                      // ),
                      ),
                  const Text(
                    "Profile",
                    style: Constants.mediumHeaderStyle,
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Constants.themeColor,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsPage()));
                      },
                      child: const Icon(
                        Icons.settings,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("lib/assets/student.png"),
                ),
              ),
              const Text("Hello, I'm Fatima Ayomide",
                  style: Constants.headerStyle),
              const Text(
                'Grade 6',
                style: Constants.headerStyle,
              ),
              const SizedBox(height: 30),
              const RectangleBox(
                icon: Icons.book,
                text: "Enrolled Courses",
                int: 3,
              ),
              const SizedBox(height: 10),
              const RectangleBox(
                icon: Icons.settings,
                text: "Active Courses",
                int: 2,
              ),
              const SizedBox(height: 10),
              const RectangleBox(
                icon: Icons.celebration,
                text: "Completed Courses",
                int: 1,
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "In Progress Courses",
                  style: Constants.mediumHeaderStyle,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final subject = course[2];
                    return Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(12),
                        child: subjectContainer(
                          subject: subject,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
