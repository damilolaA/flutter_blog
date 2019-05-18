import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import '../utils/index.dart';
import './title.dart';
import './content.dart';
import './excerpt.dart';
class Posts extends Equatable {
  String id;
  String link;
  DateTime date;
  Title title;
  Content content;
  Excerpt excerpt;

  Posts({
    this.id,
    this.link,
    this.date,
    this.title,
    this.content,
    this.excerpt,
  });

  Posts.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    link = map['link'];
    date = DateTime.fromMillisecondsSinceEpoch(parseDate(map['date'])) ?? DateTime.now();
    title = map['title'] != null ? Title.fromMap(map['title'].cast<String, dynamic>()) : null;
    content = map['content'] != null ? Content.fromMap(map['content'].cast<String, dynamic>()) : null;
    excerpt = map['excerpt'] != null ? Excerpt.fromMap(map['excerpt'].cast<String, dynamic>()) : null;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "link": link,
      "date": date,
      "title": title,
      "content": content,
      "excerpt": excerpt,
    };
  }

  @override 
  String toString() {
    return '${toMap()}';
  }
}