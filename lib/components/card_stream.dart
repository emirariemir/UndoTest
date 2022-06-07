import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:undo_test/components/flashcard.dart';

class CardStream extends StatelessWidget {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  String path = '/folderDoc/Folders';
  final String docId;
  CardStream({required this.docId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('${auth.currentUser!.email}$path/$docId/Cards')
            .snapshots(),
        builder: (context, snapshots) {
          if (snapshots.hasData == false) {
            return const Center(child: Text('Loading'));
          }
          final cards = snapshots.data!.docs;
          final List<Flashcard> flashcards = [];
          for (var flashcard in cards) {
            final flashcardTitle = flashcard.get('Card Name');
            final flashcardDesc = flashcard.get('Card Description');
            final theFlashcard =
                Flashcard(cardTitle: flashcardTitle, cardDesc: flashcardDesc);
            flashcards.add(theFlashcard);
          }
          return ListView(
            children: flashcards,
          );
        });
  }
}
