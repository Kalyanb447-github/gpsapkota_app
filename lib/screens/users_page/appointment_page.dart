import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gpsapkota_app/api/gpsapkota_api.dart';
import 'package:intl/intl.dart';

import 'payment_page.dart';

class AppointmentPage extends StatefulWidget {
      AuthResult user;
  AppointmentPage({this.user});
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  TextEditingController patientNameController = TextEditingController();
  TextEditingController symtomsController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  //controllers
  String _selectedGender;
// Declare this variable
  int selectedRadio;
  String timing = '10am - 2pm';
  final DateTime timestamp = DateTime.now();
  List _genders = ["Male", 'Female', 'Others'];
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  sendDataToFirebase() {
    if (selectedRadio != 0) {
      timing = '4pm - 8pm';
    }
    final appointmentRef = Firestore.instance.collection('appointment');
    appointmentRef.document(widget.user.user.uid).collection("appointments").add({
      'id':widget.user.user.uid,
      "Patient name": patientNameController.text,
      "symtions": symtomsController.text,
      "age": ageController.text,
      "phone": phoneController.text,
      "email": emailNameController.text,
      "gender": _selectedGender,
      "address": addressController.text,
      'appointment_date': selectedDate,
      'timing': timing,
      "timestamp": timestamp,
    });

    patientNameController.clear();
    symtomsController.clear();
    ageController.clear();
    phoneController.clear();
    emailNameController.clear();
    addressController.clear();
  }

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_genders);
    _selectedGender = _dropDownMenuItems[0].value;
    super.initState();
    selectedRadio = 0;
  }

  // String _selectedGender;
  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List gengers) {
    List<DropdownMenuItem<String>> items = List();
    for (String gender in gengers) {
      items.add(DropdownMenuItem(value: gender, child: Text(gender)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedGender = selectedFruit;
    });
  }

//date picker
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(DateTime.now().year, DateTime.now().month),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

// // Declare this variable
//   int selectedRadio;
// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  _sendAppointment() {
    GpsapkotaApi gpsapkotaApi = GpsapkotaApi();

    // gpsapkotaApi.submitAppointment(patientController.text, symptiomController.text, _selectedGender, ageController.text,phoneController.text,addressController.text);
//gpsapkotaApi.submitAppointment(patientController.text,  symptiomController.text, _selectedGender, ageController.text, phoneController.text, email, appointment_date, appointment_time, address, fees)
  }

//submit apppointment
  _submitAppointment() {
    GpsapkotaApi gpsapkotaApi = GpsapkotaApi();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.cyan,

      body: Container(
        //  color: Colors.transparent,
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(
              height: height * .06,
            ),
            //patient name
            Container(
              child: Center(
                child: TextFormField(
                    controller: patientNameController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Patient name',
                      labelText: 'Patient name',
                      icon: Icon(
                        Icons.person,
                        color: Colors.blueAccent[400],
                      ),
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       width: 60.0, color: Colors.lightBlue.shade900),
                      //   //    borderRadius: BorderRadius.circular(30.0),
                      // ),
                    )),
              ),
            ),
            Divider(
              height: 5,
            ),
            //symptioms
            Container(
              child: Center(
                child: TextField(
                    controller: symtomsController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Symptoms',
                      labelText: 'Symptoms',
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.blueAccent[400],
                      ),
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       width: 60.0, color: Colors.lightBlue.shade900),
                      //   //    borderRadius: BorderRadius.circular(30.0),
                      // ),
                    )),
              ),
            ),
            //selext bar  male female
            Container(
                height: 50,
                child: Row(
                  children: <Widget>[
                    Text(
                      'Gender',
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).accentColor),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    DropdownButton(
                      value: _selectedGender,
                      items: _dropDownMenuItems,
                      onChanged: changedDropDownItem,
                    ),
                  ],
                )),
            //age
            Container(
              child: Center(
                child: TextFormField(
                    controller: ageController,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'age',
                      labelText: 'age',
                      icon: Icon(
                        Icons.date_range,
                        color: Colors.blueAccent[400],
                      ),
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       width: 60.0, color: Colors.lightBlue.shade900),
                      //   //    borderRadius: BorderRadius.circular(30.0),
                      // ),
                    )),
              ),
            ),
            Divider(
              height: 5,
            ),
            //phone
            Container(
              child: Center(
                child: TextFormField(
                    controller: phoneController,
                    maxLines: 1,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'phone',
                      labelText: 'phone',
                      icon: Icon(
                        Icons.phone,
                        color: Colors.blueAccent[400],
                      ),
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       width: 60.0, color: Colors.lightBlue.shade900),
                      //   //    borderRadius: BorderRadius.circular(30.0),
                      // ),
                    )),
              ),
            ),
            Divider(
              height: 5,
            ),
            //Email
            Container(
              child: Center(
                child: TextFormField(
                    controller: emailNameController,
                    maxLines: 1,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      icon: Icon(
                        Icons.email,
                        color: Colors.blueAccent[400],
                      ),
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       width: 60.0, color: Colors.lightBlue.shade900),
                      //   //    borderRadius: BorderRadius.circular(30.0),
                      // ),
                    )),
              ),
            ),
            Divider(
              height: 5,
            ),
            //date select
            Container(
              
              decoration: BoxDecoration(
                
                border: Border.all(color: Colors.blue,width: 1,),
              ),
              child: ListTile(
                
                onTap: () => _selectDate(context),
                leading:
                    Icon(Icons.date_range, color: Theme.of(context).accentColor),
                title: Text(
                    selectedDate.day == DateTime.now().day
                        ? 'Today'
                        : DateFormat('dd/MM/yy').format(selectedDate),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                    )),
                //   subtitle: Text('Select date'),
                trailing: Text(
                  'Change',
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).accentColor),
                ),
              ),
            ),
            //select appointment time   10:  2  or 4:  8
            Row(
              children: <Widget>[
                Text(
                  'Timing',
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).accentColor),
                ),
                Radio(
                  value: 1,
                  groupValue: selectedRadio,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    print("Radio $val");
                    setSelectedRadio(val);
                  },
                ),
                Text(
                  '10 am - 2 pm',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700),
                ),
                Radio(
                  value: 2,
                  groupValue: selectedRadio,
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    print("Radio $val");
                    setSelectedRadio(val);
                  },
                ),
                Text(
                  '4 pm - 8 pm',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            // Divider(
            //   height: 5,
            // ),
            //address
            Container(
              child: Center(
                child: TextFormField(
                    controller: addressController,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'address',
                      labelText: 'address',
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.blueAccent[400],
                      ),
                      // border: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //       width: 60.0, color: Colors.lightBlue.shade900),
                      //   //    borderRadius: BorderRadius.circular(30.0),
                      // ),
                    )),
              ),
            ),
            //Consultancy Fees : Rs 600  //card
            //Book Appointment button
            Card(
              child: Container(
                margin: EdgeInsets.only(top: 5),
                color: Colors.blueGrey[50],
                height: 40,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Consultancy Fees : Rs 600',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            //Book Appointment button
            Container(
              height: 60,
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.lightGreen,
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => AppointmentPage(),
                  // ));

                  // _submitAppointment();

                  sendDataToFirebase();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (contest) => PaymentPage(),
                  ));
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
