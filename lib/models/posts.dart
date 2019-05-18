import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Posts extends Equatable {
  String id;
  String link;
  DateTime date;

  Posts({
    this.id,
    this.link,
    this.date,
  });

  Posts.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    link = map['link'];
    date = DateTime.fromMillisecondsSinceEpoch()
  }
}