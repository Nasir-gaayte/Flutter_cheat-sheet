import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:provider/provider.dart';
import 'package:widgets/dommyData/noteData.dart';
import 'package:widgets/models/noteModel.dart';

class EditeNewNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;
  EditeNewNotePage({super.key, required this.note, required this.isNewNote});

  @override
  State<EditeNewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<EditeNewNotePage> {
  QuillController _controller = QuillController.basic();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadExitingNote();
  }

  loadExitingNote() {
    final doc = Document()..insert(0, widget.note.text);
    setState(() {
      _controller = QuillController(
          document: doc, selection: TextSelection.collapsed(offset: 0));
    });
  }

  addingNewNote() {
    int i = Provider.of<NoteData>(context, listen: false).getNotes().length;
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false)
        .addNote(Note(id: i, text: text));
  }

  updateNote() {
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false)
        .updateNote(Note(id: widget.note.id, text: widget.note.text), text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.isNewNote && !_controller.document.isEmpty()) {
            addingNewNote();
          } else {
            updateNote();
          }
          Navigator.pop(context);
        },
        child: Container(alignment: Alignment.center, child: Text('+ & NEW')),
      ),
      body: Column(
        children: [
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: _controller,
              sharedConfigurations: const QuillSharedConfigurations(
                locale: Locale('de'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: _controller,
                  readOnly: false,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('de'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
