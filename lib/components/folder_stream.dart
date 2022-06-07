import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:undo_test/components/folder_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FolderStream extends StatelessWidget {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('${auth.currentUser?.email}/folderDoc/Folders')
            .snapshots(),
        builder: (context, snapshots) {
          if (snapshots.hasData != true) {
            return const Center(
              child: SpinKitThreeBounce(
                color: Colors.white,
                size: 40.0,
              ),
            );
          }

          final folders = snapshots.data!.docs;
          List<CustomFolder> customFolderList = [];
          for (var folder in folders) {
            final folderTitle = folder.get('Title of Folder');
            final customFolder =
                CustomFolder(title: folderTitle, docId: folder.id);
            customFolderList.add(customFolder);
          }
          return Container(
            padding: const EdgeInsets.only(top: 20),
            child: ListView(
              children: customFolderList,
            ),
          );
        });
  }
}
