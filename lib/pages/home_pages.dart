
import 'package:education_app/models/course_Model.dart';
import 'package:education_app/pages/ai_page.dart';
import 'package:education_app/pages/settingsPage.dart';
import 'package:education_app/utils/constants.dart';
import 'package:education_app/utils/subjectContainer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      child: Image.asset("lib/assets/student.png"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsPage()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: const Icon(
                          Icons.settings,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AiPage(),
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          "Ask AI a Question",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Lessons",
                    style: Constants.mediumHeaderStyle,
                  ),
                ),
                SizedBox(
                  height: 530,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final subject = course[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                const InkWell(
                  // onTap: () {
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const bottomNavbar()));
                  // },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Next"),
                      Icon(
                        Icons.arrow_forward,
                      ),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "Progress",
                      style: Constants.mediumHeaderStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final subject = course[2];
                      return Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 12),
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
      ),
    );
  }
}
