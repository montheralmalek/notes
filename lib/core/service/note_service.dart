import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/core/constant/constant.dart';
import 'package:notes/data/model/note_model.dart';
import 'package:notes/data/seed_data/data_intializer.dart';
import 'package:notes/main.dart';

abstract class NoteService extends GetxService {
  Future<NoteServiceImp> initData();
  List<NoteModel> fetchAll();
  Future<int> add(NoteModel note);
  void update(NoteModel note);
  void delete(int noteKey);
}

class NoteServiceImp extends NoteService {
  late Box<NoteModel>
      _dataBox; //= Hive.box<ClassroomModel>(kClassroomBox.name);
  @override
  Future<NoteServiceImp> initData() async {
    Hive.registerAdapter(NoteModelAdapter());
    _dataBox = await Hive.openBox<NoteModel>(kNote);
    await _dataBox.clear();
    await createInitialNotes();
    return this;
  }

  @override
  List<NoteModel> fetchAll() {
    return _dataBox.values.toList();
  }

  @override
  Future<int> add(NoteModel note) async {
    var result = await _dataBox.add(note);
    return result;
  }

  @override
  void delete(int noteKey) {
    // TODO: implement delete
  }

  @override
  void update(NoteModel note) {
    // TODO: implement update
  }
}
// void _deleteRelated(int classroomKey) {
//   ClassServiceImp classDivService = Get.find();
//   //lessonService
//   final classDivs =
//       classDivService.fetchClassDivisionsByClassroom(classroomKey);
//   for (var e in classDivs) {
//     e.delete();
//   }
// }



// void main() async {
//   Hive.registerAdapter(PersonAdapter());
//   var persons = await Hive.openBox<Person>('personsWithLists');
//   persons.clear();

//   var mario = Person('Mario');
//   var luna = Person('Luna');
//   var alex = Person('Alex');
//   persons.addAll([mario, luna, alex]);

//   mario.friends = HiveList(
//); // Create a HiveList
//   mario.friends.addAll([luna, alex]); // Update Mario's friends
//   mario.save(); // make persistent the change,
//   print(mario.friends);

//   luna.delete(); // Remove Luna from Hive
//   print(mario.friends); // HiveList updates automatically
// }
// class Person extends HiveObject {
//   String name;

//   int age;

//   List<Person> friends;

//   Person(this.name, this.age);
// }
// @HiveType()
// class Person extends HiveObject {
//   @HiveField(0)
//   String name;

//   @HiveField(1)
//   HiveList friends;

//   Person(this.name);

//   String toString() => name; // For print()
// }

// class PersonAdapter extends TypeAdapter<Person> {
//   @override
//   final typeId = 0;

//   @override
//   Person read(BinaryReader reader) {
//     return Person(reader.read())..friends = reader.read();
//   }

//   @override
//   void write(BinaryWriter writer, Person obj) {
//     writer.write(obj.name);
//     writer.write(obj.friends);
//   }
// }
