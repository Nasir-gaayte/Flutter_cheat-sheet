import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:widgets/pages/EditenewNotePage.dart';

import '../dommyData/noteData.dart';
import '../models/noteModel.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  createNote() {
    int id = Provider.of<NoteData>(context, listen: false).getNotes().length;
    Note newNote = Note(id: id, text: '');
    goToNotePage(newNote, true);
  }

  goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditeNewNotePage(
          note: note,
          isNewNote: isNewNote,
        ),
      ),
    );
  }

  deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) {
        return Column(
          children: [
            Text("Notes"),
            Expanded(
                child: CupertinoListSection.insetGrouped(
              children: List.generate(
                value.getNotes().length,
                (index) => CupertinoListTile(
                  title: Text(value.getNotes()[index].text),
                  trailing: IconButton(
                      onPressed: () {
                        Provider.of<NoteData>(context, listen: false)
                            .deleteNote(value.getNotes()[index]);
                      },
                      icon: Icon(Icons.delete)),
                  onTap: () {
                    goToNotePage(value.getNotes()[index], false);
                  },
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: createNote,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 40,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.yellow),
                    child: Text("Add Note"),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
