import 'package:equatable/equatable.dart';

import '../utils/index.dart';
import './title.dart';
import './content.dart';
import './excerpt.dart';
import './guid.dart';
import './meta.dart';
class Posts extends Equatable {
  int id;
  String link;
  DateTime date;
  DateTime dateGmt;
  Title title;
  Content content;
  Excerpt excerpt;
  num author;
  String imageUrl;
  List<dynamic> categories;
  List<dynamic> tags;
  Guid guid;
  String status;
  String slug;
  String type;
  DateTime modified;
  DateTime modifiedGmt;
  num featuredMedia;
  String commentStatus;
  String pingStatus;
  bool sticky;
  String template;
  String format;
  Meta meta;
  bool jetpackSharingEnabled;

  Posts({
    this.id,
    this.link,
    this.date,
    this.dateGmt,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.imageUrl,
    this.categories,
    this.tags,
    this.guid,
    this.status,
    this.slug,
    this.type,
    this.modified,
    this.modifiedGmt,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.jetpackSharingEnabled,
  });

  Posts.fromMap(Map<String, dynamic> map) {

    id = map['id'];
    link = map['link'];
    date = DateTime.fromMillisecondsSinceEpoch(parseDate(map['date'])) ?? DateTime.now();
    dateGmt = DateTime.fromMillisecondsSinceEpoch(parseDate(map['date_gmt'])) ?? DateTime.now();
    title = map['title'] != null ? Title.fromMap(map['title'].cast<String, dynamic>()) : null;
    content = map['content'] != null ? Content.fromMap(map['content'].cast<String, dynamic>()) : null;
    excerpt = map['excerpt'] != null ? Excerpt.fromMap(map['excerpt'].cast<String, dynamic>()) : null;
    author = map['author'];
    imageUrl = map['jetpack_featured_media_url'];
    categories = map["categories"] != null ? (map['catergories'] as List)?.map((category) => category)?.toList() : null;
    tags = map['tags'] != null ? (map['tags'] as List)?.map((tag) => tag)?.toList() : null;
    guid = map['guid'] != null ? Guid.fromMap(map['guid'].cast<String, dynamic>()) : null;
    status = map['status'];
    slug = map['slug'];
    type = map['type'];
    modified = DateTime.fromMillisecondsSinceEpoch(parseDate(map['modified'])) ?? DateTime.now();
    modifiedGmt = DateTime.fromMillisecondsSinceEpoch(parseDate(map['modified_gmt'])) ?? DateTime.now();
    featuredMedia = map['featured_media'];
    commentStatus = map['comment_status'];
    pingStatus = map['ping_status'];
    sticky = map['sticky'];
    template = map['template'];
    format = map['format'];
    meta = map['meta'] != null ? Meta.fromMap(map['meta'].cast<String, dynamic>()) : null;
    jetpackSharingEnabled = map['jetpack_sharing_enabled']; 
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
      "guid": guid?.toMap(),
      "status": status,
      "slug": slug,
      "type": type,
      "modified": modified,
      "modified_gmt": modifiedGmt,
      "featuredMedia": featuredMedia,
      "commentStatus": commentStatus,
      "pingStatus": pingStatus,
      "sticky": sticky,
      "template": template,
      "format": format,
      "meta": meta?.toMap(),
      "jetpackSharingEnabled": jetpackSharingEnabled,
    };
  }

  @override 
  String toString() {
    return '${toMap()}';
  }
}