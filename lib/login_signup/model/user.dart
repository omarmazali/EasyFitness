import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {

  final String? id;
  final String? fName;
  final String? lName;
  final String? email;
  final String? password;
  final String? gender;
  final String? age;
  final String? height;
  final String? width;

  UserModel({this.id, this.fName,this.lName, this.email, this.password,
    this.gender, this.age, this.height, this.width});

  factory UserModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      id: snapshot['id'],
      fName: snapshot['fName'],
      lName: snapshot['lName'],
      email: snapshot['email'],
      password: snapshot['password'],
      gender: snapshot['gender'],
      age: snapshot['age'],
      height: snapshot['height'],
      width: snapshot['width'],
    );
  }

  Map<String, dynamic> toJson () => {
    "id": id,
    "fName": fName,
    "lName": lName,
    "email": email,
    "password": password,
    "gender": gender,
    "age": age,
    "height": height,
    "width": width,
  };
}