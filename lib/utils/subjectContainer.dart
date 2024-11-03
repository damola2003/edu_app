
import 'package:education_app/models/subject_Model.dart';
import 'package:flutter/material.dart';

class subjectContainer extends StatelessWidget {
  final Subject subject;
  const subjectContainer({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade500),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // alignment: AlignmentDirectional.bottomStart,
          children: [
            Image.asset(
              subject.imagePath,
            ),
            Container(
              height: 100,
              color: Theme.of(context).colorScheme.secondary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subject.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(subject.description),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 7, bottom: 7, left: 16, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: const Text(
                          "Start",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                  // LinearProgressIndicator()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
