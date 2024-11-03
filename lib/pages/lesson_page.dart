
import 'package:education_app/models/course_Model.dart';
import 'package:education_app/utils/constants.dart';
import 'package:education_app/utils/subjectContainer.dart';
import 'package:flutter/material.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 13),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),
                        border: InputBorder.none),
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
              Expanded(
                child: ListView.builder(
                  itemCount: course.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final subject = course[index];
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
