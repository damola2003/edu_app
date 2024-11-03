
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, left: 14, right: 14),
              child: Row(
                children: [
                  Constants.appLogo,
                  const SizedBox(width: 40),
                  const Text(
                    "Progress Overviev",
                    style: Constants.mediumHeaderStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
