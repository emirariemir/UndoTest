import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddCardWidget extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  final String docId;
  AddCardWidget({required this.docId});

  late String title;
  late String desc;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Add a Folder',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              onChanged: (value) {
                title = value;
              },
              textInputAction: TextInputAction.next,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Folder Name',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              onChanged: (value) {
                desc = value;
              },
              decoration: const InputDecoration(
                hintText: 'Folder description',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 3),
                ),
              ),
            ),
            CustomBottom(
              title: 'Create Card',
              onPressed: () {
                firestore
                    .collection(
                        '${auth.currentUser!.email}/folderDoc/Folders/$docId/Cards')
                    .add({
                  'Card Name': title,
                  'Card Description': desc,
                });
                Navigator.pop(context);
              },
            ),
            CustomBottom(
              title: 'Cancel',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
