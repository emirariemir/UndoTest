import 'package:flutter/material.dart';
import 'package:undo_test/constants.dart';

class CustomTopBar extends StatelessWidget {
  final String bigTitle;
  final String smallTitle;
  final String header;
  final IconData icon;
  final bool addIconMood;
  final VoidCallback onIconTap;
  final VoidCallback onAddIconTap;

  CustomTopBar(
      {required this.header,
      required this.bigTitle,
      required this.smallTitle,
      required this.icon,
      required this.onIconTap,
      required this.addIconMood,
      required this.onAddIconTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onIconTap,
                  child: Icon(
                    icon,
                    color: kDarkBlueColor,
                    size: 30.0,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kMyGreenColor,
                    border: Border.all(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text(
                    header,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: onAddIconTap,
              child: Icon(
                addIconMood ? Icons.add : Icons.info,
                size: 30.0,
                color: kDarkBlueColor,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            smallTitle,
            style: const TextStyle(
              fontSize: 16.0,
              color: kDarkBlueColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 1.0),
          child: Text(
            bigTitle,
            style: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: kDarkBlueColor,
            ),
          ),
        ),
      ],
    );
  }
}
