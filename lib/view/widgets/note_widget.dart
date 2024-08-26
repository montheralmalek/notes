import 'package:flutter/material.dart';
import 'package:notes/data/model/note_model.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel note;
  const NoteWidget({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
            ],
          ),
        ],
      ),
    );
  }
}
