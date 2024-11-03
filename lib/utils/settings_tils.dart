
import 'package:education_app/utils/constants.dart';
import 'package:flutter/material.dart';

class SettingsUtils extends StatelessWidget {
 final void Function()? onTap;
  final String text;
  final IconData icon;
  const SettingsUtils({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Text(
              text,
              style: Constants.mediumHeaderStyle,
            )
          ],
        ),
      ),
    );
  }
}
