import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class AddFolderWidget extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  late String title;
  late String desc;

  Future<void> addFolderFirebase(String titleOfFolder, String folderDescription) async {
    if (auth.currentUser != null) {
      await firestore.collection('${auth.currentUser?.email}/folderDoc/Folders').add({
        'Title of Folder': titleOfFolder,
        'Description of Folder': folderDescription,
      });
      print(firestore.collection('${auth.currentUser?.email}/folderDoc/Folders').doc());
    } else {
      print('user not signed in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.blue,
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
              title: 'Create Folder',
              onPressed: () {
                addFolderFirebase(title, desc);
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
