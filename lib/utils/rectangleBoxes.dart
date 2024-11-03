
import 'package:flutter/material.dart';

class RectangleBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final double int;
  const RectangleBox({
    super.key,
    required this.icon,
    required this.text,
    required this.int,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Colors.grey,
      child: Container(
        // margin: EdgeInsets.all(8),
        width: 300,
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(int.toString())
          ],
        ),
      ),
    );
  }
}
