import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;

  UserModel({this.id, this.name, this.email,this.password,this.phone});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    id = doc["id"];
    name = doc["name"];
    email = doc["email"];
    password = doc["password"];
    phone = doc["phone"];
  }
}
