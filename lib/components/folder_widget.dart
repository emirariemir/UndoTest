import 'package:flutter/material.dart';
import 'package:undo_test/constants.dart';
import 'package:undo_test/screens/flashcard_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomFolder extends StatelessWidget {
  final String title;
  final String docId;

  const CustomFolder({required this.title, required this.docId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FlashcardScreen(
              title: title,
              docId: docId,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
            color: kmyBlueColor,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(color: Colors.white, width: 5.0)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    right: 10.0, top: 20.0, bottom: 20.0, left: 20),
                child: const Icon(
                  Icons.folder,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: AutoSizeText(
                  title,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const Text(
                  '!2',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
