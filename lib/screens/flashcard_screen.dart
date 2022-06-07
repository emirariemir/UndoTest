import 'package:flutter/material.dart';
import 'package:undo_test/components/add_card_widget.dart';
import 'package:undo_test/components/card_stream.dart';
import 'package:undo_test/constants.dart';
import '../components/top_config_widget.dart';

class FlashcardScreen extends StatelessWidget {
  final String title;
  final String docId;

  FlashcardScreen({required this.title, required this.docId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMyGreenColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
              top: 10.0, left: 24.0, right: 24.0, bottom: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTopBar(
                onAddIconTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return AddCardWidget(docId: docId);
                      });
                },
                header: title,
                bigTitle: 'Flashcards',
                smallTitle: 'You have 2 UNDO! in this folder.',
                icon: Icons.arrow_back,
                addIconMood: true,
                onIconTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: CardStream(
                  docId: docId,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
