import 'package:get/get.dart';
import 'package:notes/view/add_note_view.dart';
import 'package:notes/view/home_view.dart';

List<GetPage<dynamic>> pagesRoutes = [
  GetPage(name: HomeView.id, page: () => const HomeView()),
  GetPage(name: AddNoteView.id, page: () => const AddNoteView()),
];
