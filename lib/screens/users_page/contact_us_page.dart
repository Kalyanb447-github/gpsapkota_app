import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
    AuthResult user;
  ContactUsPage({this.user});
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final DateTime timestamp = DateTime.now();
  List _genders = ["Male", 'Female', 'Others'];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedGender;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_genders);
    _selectedGender = _dropDownMenuItems[0].value;
    super.initState();
  }

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

  sendDataToFirebase() {
    final commentRef = Firestore.instance.collection('contact_us');
    // commentRef.document(widget.user.user.uid).collection("contacts").add({
    //   'id':widget.user.user.uid,
    //   "name": nameController.text,
    //   "email": emailController.text,
    //   "subject": subjectController.text,
    //   "message": messageController.text,
    //   "gender": _selectedGender,   
    //   "timestamp": timestamp,
    // });
 commentRef.document(widget.user.user.uid).collection("contacts").document().setData({
        'id':widget.user.user.uid,
      "name": nameController.text,
      "email": emailController.text,
      "subject": subjectController.text,
      "message": messageController.text,
      "gender": _selectedGender,   
      "timestamp": timestamp,
 });
    nameController.clear();
    emailController.clear();
    subjectController.clear();
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(left: 24.0, right: 24.0),
        children: <Widget>[
          SizedBox(
            height: height * .1,
          ),
          //patient name

          Container(
            child: Center(
              child: TextFormField(
                  controller: nameController,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Patient name',
                    labelText: ' name',
                    icon: Icon(
                      Icons.person,
                      color: Colors.blueAccent[400],
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 60.0, color: Colors.lightBlue.shade900),
                      //    borderRadius: BorderRadius.circular(30.0),
                    ),
                  )),
            ),
          ),

          Divider(
            height: 5,
          ),

          //email

          Container(
            child: Center(
              child: TextFormField(
                  controller: emailController,
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: ' Email',
                    icon: Icon(
                      Icons.email,
                      color: Colors.blueAccent[400],
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 60.0, color: Colors.lightBlue.shade900),
                      //    borderRadius: BorderRadius.circular(30.0),
                    ),
                  )),
            ),
          ),

          Divider(
            height: 5,
          ),

          //selext bar  male female

          Container(
              height: 60,
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

          Divider(
            height: 5,
          ),
          //enter subject

          Container(
            child: Center(
              child: TextFormField(
                  controller: subjectController,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'subject',
                    labelText: ' subject',
                    icon: Icon(
                      Icons.subject,
                      color: Colors.blueAccent[400],
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 60.0, color: Colors.lightBlue.shade900),
                      //    borderRadius: BorderRadius.circular(30.0),
                    ),
                  )),
            ),
          ),

          Divider(
            height: 5,
          ),
          //message

          Container(
            child: Center(
              child: TextFormField(
                  controller: messageController,
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'message',
                    labelText: 'message',
                    icon: Icon(
                      Icons.message,
                      color: Colors.blueAccent[400],
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 60.0, color: Colors.lightBlue.shade900),
                      //    borderRadius: BorderRadius.circular(30.0),
                    ),
                  )),
            ),
          ),

          SizedBox(
            height: height * .1,
          ),

          //button
          //contact us button

          Container(
            height: 70,
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.red,
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => AppointmentPage(),
                // ));
                sendDataToFirebase();
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
    );
  }
}

// //---------------------------Api Test-----------------//
// class ApiTest extends StatefulWidget {
//   @override
//   _ApiTestState createState() => _ApiTestState();
// }

// class _ApiTestState extends State<ApiTest> {
//   @override
//   void initState() {
//     super.initState();
//     getOrder();
//   }

//   KalyanApi myapi = KalyanApi();
//   //  Image.network("${myapi.musurl}/uploads/images/service_icons/${widget.serviceImage}",width: 80.0,),

//   getOrder() async {
//     List data = await myapi.getText();

//     return data;
//   }

//   String text = 'send from client';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         builder: (context, snapshot) {
//           if (snapshot.hasError) print(snapshot.error);
//           return Center(
//               child: snapshot.hasData
//                   ? Text(snapshot.data[0]['test'].toString())
//                   : Text('error'));
//         },
//         future: getOrder(),
//       ),
//     );
//   }
// }

// class KalyanApi {
//   String text = 'api text';
//   final myUrl = 'http://192.168.0.103/woker/public';

//   Future<List> getText() async {
//     try {
//       final response = await http.post("$myUrl/api/kalyanTest", body: {
//         'text': text,
//       });
//       return json.decode(response.body);
//     } catch (e) {
//       print(e);
//     }
//   }
// }
