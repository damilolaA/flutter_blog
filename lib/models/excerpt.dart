import 'package:equatable/equatable.dart';

class Excerpt extends Equatable {
  final String rendered;
  final bool protected;

  Excerpt({
    this.rendered,
    this.protected
  });

  Excerpt.fromMap(Map<String, dynamic> map) :
    rendered = map['rendered'],
    protected = map['protected'];

  Map<String, dynamic> toMap() {
    return {
      'rendered': rendered,
      'protected': protected
    };
  }

  @override 
  String toString() {
    return '${toMap()}';
  }
}