import 'package:flutter/material.dart';

class profileItem extends StatelessWidget {
  final String itemName;

  final icon;
  final Function press;
  const profileItem(
      {super.key,
      required this.icon,
      required this.itemName,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          press();
        },
        child: Row(
          children: [
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              itemName,
              style: const TextStyle(fontSize: 24),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
