import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/core/constant/constant.dart';
import 'package:notes/data/model/note_model.dart';

Future<void> createInitialNotes() async {
  var noteBox = Hive.box<NoteModel>(kNote);
  for (var i = 0; i < 10; i++) {
    noteBox.add(
        NoteModel(title: 'title${i + 1}', content: 'some content content'));
  }
}
