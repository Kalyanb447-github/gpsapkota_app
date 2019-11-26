import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppointmentModel {
   String id;
  String name;
  String symptoms;
  String gender;
  int age;
  String phone;
  String email;
  DateTime date;
  String time;

  AppointmentModel(
      {
      @required this.id,
      @required this.name,
      @required this.symptoms,
      @required this.gender,
      @required this.age,
      @required this.phone,
      @required this.email,
      @required this.date,
      @required this.time
      });



        factory AppointmentModel.fromDocument(DocumentSnapshot doc) {
    return AppointmentModel(
      id: doc['id'],
      name: doc['name'],
      email: doc['email'],
       age: doc['age'],
      gender: doc['gender'],
      symptoms: doc['symptoms'],
      phone: doc['phone'],
      date: doc['date'],
      time: doc['time']
    );
  }
}
