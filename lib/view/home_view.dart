import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controller/Home_controller.dart';

import 'widgets/note_widget.dart';

class HomeView extends StatelessWidget {
  static const String id = '/';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NoteControllerImp());
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(15),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisExtent: 200,
          ),
          children: [
            ...controller.getAll().map(
                  (note) => NoteWidget(
                    note: note,
                  ),
                )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.goToAddNoteView,
        child: const Icon(Icons.add),
      ),
    );
  }
}
