import 'package:equatable/equatable.dart';

class Content extends Equatable {
  final String rendered;
  final bool protected;

  Content({
    this.rendered,
    this.protected
  });

  Content.fromMap(Map<String, dynamic> map) :
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