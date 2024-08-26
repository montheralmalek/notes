// import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notes/core/service/note_service.dart';
import 'package:notes/data/model/note_model.dart';
import 'package:notes/view/add_note_view.dart';

abstract class NoteController extends GetxController {
  List<NoteModel> getAll();
  void goToAddNoteView();
}

class NoteControllerImp extends NoteController {
  late NoteServiceImp _noteService;
  @override
  void onInit() async {
    _noteService = Get.find();

    super.onInit();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  List<NoteModel> getAll() {
    return _noteService.fetchAll();
  }

  @override
  void goToAddNoteView() {
    Get.toNamed(AddNoteView.id);
  }
}
