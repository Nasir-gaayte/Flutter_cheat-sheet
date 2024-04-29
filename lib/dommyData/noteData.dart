import 'package:flutter/material.dart';

import '../models/noteModel.dart';

class NoteData with ChangeNotifier {
  List<Note> allnotes = [
    Note(id: 0, text: 'First Note'),
    Note(id: 1, text: 'Scound Note'),
    Note(id: 2, text: 'Theard Note'),
  ];

  List<Note> getNotes() {
    return allnotes;
  }

  addNote(note) {
    allnotes.add(note);
    notifyListeners();
  }

  updateNote(Note note, text) {
    for (var n in allnotes) {
      if (n.id == note.id) {
        n.text = text;
      }
      notifyListeners();
    }
  }

  deleteNote(Note note) {
    allnotes.remove(note);
    notifyListeners();
  }
}
