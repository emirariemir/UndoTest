import 'package:flutter/material.dart';
import 'package:undo_test/constants.dart';

class UndoFlashcard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        color: kMyRedColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.white, width: 5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
            child: const Text(
              'Title of Card',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 10),
            padding: const EdgeInsets.all(2),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.name,
              maxLines: null,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  fontSize: 45,
                ),
                hintText: 'What was this flashcard?!',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.white70, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.white, width: 2.5),
                ),
                hintStyle: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
