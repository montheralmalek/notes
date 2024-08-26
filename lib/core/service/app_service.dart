import 'package:get/get.dart';
import 'package:notes/core/service/note_service.dart';

class AppService extends GetxService {
  Future<AppService> init() async {
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => AppService().init());
  await Get.putAsync(() => NoteServiceImp().initData());
}
