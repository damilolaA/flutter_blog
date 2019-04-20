import 'package:flutter/material.dart';
import 'package:blog_app/blog_app.dart';

class BlogOptions {
  BlogOptions({
    this.theme
  });

  final BlogTheme theme;

  BlogOptions copyWith({
    BlogTheme theme
  }) {
    return BlogOptions(
      theme: theme ?? this.theme
    );
  }

  // @override
  // bool operator ==(dynamic other) {
  //   if (runtimeType != other.runtimeType)
  //     return false;
  //   final BlogOptions typedOther = other;
  //   return theme == typedOther.theme;
  // }

  // @override
  // int get hashCode => hashValues(
  //   theme
  // );
}