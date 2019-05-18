import 'package:equatable/equatable.dart';

class Title extends Equatable {

  final String rendered;
  Title({
    this.rendered
  });

  Title.fromMap(Map<String, dynamic> map) : 
    rendered = map['rendered'];

  Map<String, dynamic> toMap() {
    return{
      'rendered': rendered
    };
  }

  @override
  String toString() {
    return '${toMap()}';
  }
}