import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../utils/index.dart';
import './title.dart';

class Posts extends Equatable {
  String id;
  String link;
  DateTime date;
  Title title;

  Posts({
    this.id,
    this.link,
    this.date,
    this.title,
  });

  Posts.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    link = map['link'];
    date = DateTime.fromMillisecondsSinceEpoch(parseDate(map['date'])) ?? DateTime.now();
    title = map['title'] != null ? Title.fromMap(map['title'].cast<String, dynamic>()) : null;
  }
}