
import 'package:equatable/equatable.dart';

class Meta extends Equatable{
  final String spayEmail;
  final String jetpackPublicizeMessage;

  Meta({
    this.spayEmail,
    this.jetpackPublicizeMessage
  });

  Meta.fromMap(Map <String, dynamic> map) :
    spayEmail = map['spay_email'],
    jetpackPublicizeMessage = map['jetpack_publicize_message'];

  Map<String, dynamic> toMap() {
    return{
      "spayEmail": spayEmail,
      "jetpackPublicizeMessage": jetpackPublicizeMessage
    };
  }

  String toString() {
    return "${toMap()}";
  }
}