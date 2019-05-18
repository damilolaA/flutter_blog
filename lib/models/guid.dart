import 'package:equatable/equatable.dart';

class Guid extends Equatable {
  final String rendered;

  Guid({
    this.rendered
  });

  Guid.fromMap(Map<String, dynamic> map) :
    rendered = map['rendered'];

  Map<String, dynamic> toMap() {
    return{
      "rendered": rendered
    };
  }

  @override 
  String toString() {
    return '${toMap()}';
  }
}