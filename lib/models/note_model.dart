import 'package:hive/hive.dart';

part 'note_model.g.dart'; //[class file name].g.dart

@HiveType(typeId: 0)  //Generate Type Adaptor => flutter packages pub run build_runner build
class NoteModel extends HiveObject
{
  @HiveField(0)
   String title;
  @HiveField(1)
   String content;
  @HiveField(2)
   final DateTime date;

  NoteModel({required this.title, required this.content, required this.date});
}