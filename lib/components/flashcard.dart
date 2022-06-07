import 'package:flutter/material.dart';
import 'package:undo_test/constants.dart';

class Flashcard extends StatelessWidget {
  final String cardTitle;
  final String cardDesc;
  Flashcard({required this.cardTitle, required this.cardDesc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      decoration: BoxDecoration(
        color: kmyBlueColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.white, width: 5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
            child: Text(
              cardTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
            child: Text(
              cardDesc,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
