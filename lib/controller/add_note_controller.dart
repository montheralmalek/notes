// import 'package:hive/hive.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notes/core/service/note_service.dart';
import 'package:notes/data/model/note_model.dart';

abstract class AddNoteController extends GetxController {
  void addNote();
  String? validate(String? val);
}

class AddNoteControllerImp extends AddNoteController {
  late NoteServiceImp _noteService;
  late GlobalKey<FormState> formKey;
  late TextEditingController title;
  late TextEditingController content;
  late TextEditingController tags;
  @override
  void onInit() async {
    _noteService = Get.find();
    formKey = GlobalKey();
    title = TextEditingController();
    content = TextEditingController();
    tags = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  void addNote() async {
    if (formKey.currentState!.validate()) {
      await _noteService.add(
          NoteModel(title: title.text, content: content.text, tags: tags.text));
      // show sucess message
    }
  }

  @override
  String? validate(String? val) {
    if (val == null) {
      return 'required';
    } else if (val.isEmpty) {
      return 'required';
    }
    return null;
  }
}
