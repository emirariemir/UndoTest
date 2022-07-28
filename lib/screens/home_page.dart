import 'package:flutter/material.dart';
import 'package:undo_test/components/add_folder_wigdet.dart';
import 'package:undo_test/components/folder_stream.dart';
import 'package:undo_test/components/top_config_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:undo_test/components/folder_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;

  bool isUserLoggedIn = false;

  Widget bottomSheetBuilder(BuildContext context) {
    return AddFolderWidget();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (auth.currentUser != null) {
      isUserLoggedIn = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, left: 24.0, right: 24.0, bottom: 0.0),
        child: Column(
          children: [
            CustomTopBar(
              header: 'HOME',
              addIconMood: true,
              bigTitle: 'Folders',
              smallTitle: 'You have 2 UNDO!',
              icon: Icons.wb_sunny,
              onIconTap: () async {
                await auth.signOut();
                setState(() {
                  // SHEEEEEESSH!
                });
                print('user signed out');
              },
              onAddIconTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return AddFolderWidget();
                    });
              },
            ),
            isUserLoggedIn ? ArtificialFolders() : const Text('Log in to create a folder.'),
          ],
        ),
      ),
    );
  }
}

class ArtificialFolders extends StatelessWidget {
  const ArtificialFolders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: const [
          CustomFolder(title: "Folder 1", docId: "1"),
          CustomFolder(title: "Folder 2", docId: "2"),
          CustomFolder(title: "Folder 3", docId: "3"),
          CustomFolder(title: "Folder 4", docId: "4"),
        ],
      ),
    );
  }
}
