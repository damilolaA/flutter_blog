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
  num author;
  String imageUrl;
  List<num> categories;
  List<num> tags;

  Posts({
    this.id,
    this.link,
    this.date,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.imageUrl,
    this.categories,
    this.tags,
  });

  Posts.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    link = map['link'];
    date = DateTime.fromMillisecondsSinceEpoch(parseDate(map['date'])) ?? DateTime.now();
    title = map['title'] != null ? Title.fromMap(map['title'].cast<String, dynamic>()) : null;
    content = map['content'] != null ? Content.fromMap(map['content'].cast<String, dynamic>()) : null;
    excerpt = map['excerpt'] != null ? Excerpt.fromMap(map['excerpt'].cast<String, dynamic>()) : null;
    author = map['author'];
    imageUrl = map['jetpack_featured_media_url'];
    categories = map["categories"] != null ? (map['catergories'] as List)?.map((category) => category)?.toList() : null;
    tags = map['tags'] != null ? (map['tags'] as List)?.map((tag) => tag)?.toList() : null;
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "link": link,
      "date": date,
      "title": title?.toMap(),
      "content": content?.toMap(),
      "excerpt": excerpt?.toMap(),
      "author": author,
      "imageUrl": imageUrl,
      "categories": categories?.map((category) => category)?.toList(),
      "tags": tags?.map((tag) => tag)?.toList(),
    };
  }

  @override 
  String toString() {
    return '${toMap()}';
  }
}