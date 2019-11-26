import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  String id;
  String name;
  String email;
  String subject;
  String message;
 // bool gender;

  ContactModel({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.subject,
    @required this.message,
   // @required this.gender,
  });

  factory ContactModel.fromDocument(DocumentSnapshot doc) {
    return ContactModel(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
     // gender: doc['gender'],
      subject: doc['subject'],
      message: doc['message'],
    );
  }
}
