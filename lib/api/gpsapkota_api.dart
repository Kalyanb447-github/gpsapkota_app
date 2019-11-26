import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class GpsapkotaApi {
  final gpsubkotaUrl = 'http://192.168.0.107/GPSapkota/public';
 
  removeSpace(String value) {
    var newValue = value.replaceAll(new RegExp(r"\s\b|\b\s"), "");
    return newValue;
  }

  removeSpecial(String value) {
    var newValue = value.replaceAll(new RegExp(r'[^\w\s]+'), '');
    return newValue;
  }



  // submint appointment
  Future<List> submitAppointment({String patient_name, String symptoms, String gender, String age,String phone,String email,DateTime appointment_date,String appointment_time,String address,int fees}) async {
    try {
      final response =
          await http.post("$gpsubkotaUrl/api/getBannerList", body: {
        'patient_name': patient_name,
        'symptoms': symptoms,
        'gender': gender,
        'age': age,
        'phone': phone,
        'email': email,
      });
      return json.decode(response.body);
    } catch (e) {
      print(e);
    }
  }

  // submint appointment
  Future<List> submitContact(String area_code, String operator_id,
      String plan_type, String systemRef) async {
    try {
      final response =
          await http.post("$gpsubkotaUrl/api/getBannerList", body: {
        'area_code': area_code,
        'operator_id': operator_id,
        'plan_type': plan_type,
       // 'mycode': mycode,
      });
      return json.decode(response.body);
    } catch (e) {
      print(e);
    }
  }
}
