// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:gpsapkota_app/screens/users_page/home_page.dart';
// class PhoneAuthentication extends StatefulWidget {
//   @override
//   _PhoneAuthenticationState createState() => _PhoneAuthenticationState();
// }

// class _PhoneAuthenticationState extends State<PhoneAuthentication> {
//  String phoneNo;
//   String smsCode;
//   String verificationId;

//   Future<void> verifyPhone() async {
//     final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
//       this.verificationId = verId;
//     };

//     final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
//       this.verificationId = verId;
//       smsCodeDialog(context).then((value) {
//         print('Signed in');
//       });
//     };

//   final PhoneVerificationCompleted verifiedSuccess = (FirebaseUser user) {
//       print('verified');
//     } as PhoneVerificationCompleted;

//     final PhoneVerificationFailed veriFailed = (AuthException exception) {
//       print('${exception.message}');
//     };

//     await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: this.phoneNo,
//         codeAutoRetrievalTimeout: autoRetrieve,
//         codeSent: smsCodeSent,
//         timeout: const Duration(seconds: 5),
//         verificationCompleted: verifiedSuccess,
//         verificationFailed: veriFailed);
//   }

//   Future<bool> smsCodeDialog(BuildContext context) {
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return new AlertDialog(
//             title: Text('Enter sms Code'),
//             content: TextField(
//               onChanged: (value) {
//                 this.smsCode = value;
//               },
//             ),
//             contentPadding: EdgeInsets.all(10.0),
//             actions: <Widget>[
//               new FlatButton(
//                 child: Text('Done'),
//                 onPressed: () {
//                   FirebaseAuth.instance.currentUser().then((user) {
//                     if (user != null) {
//                       Navigator.of(context).pop();
//                       Navigator.of(context).pushReplacementNamed('/homepage');
//                     } else {
//                       Navigator.of(context).pop();
//                       signIn();
//                     }
//                   });
//                 },
//               )
//             ],
//           );
//         });
//   }

//   signIn() {
//     FirebaseAuth.instance
//         .signInWithPhoneNumber(verificationId: verificationId, smsCode: smsCode)
//         .then((user) {
//       Navigator.of(context).pushReplacementNamed('/homepage');
//     }).catchError((e) {
//       print(e);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text('PhoneAuth'),
//       ),
//       body: new Center(
//         child: Container(
//             padding: EdgeInsets.all(25.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 TextField(
//                   decoration: InputDecoration(hintText: 'Enter Phone number'),
//                   onChanged: (value) {
//                     this.phoneNo = value;
//                   },
//                 ),
//                 SizedBox(height: 10.0),
//                 RaisedButton(
//                     onPressed: verifyPhone,
//                     child: Text('Verify'),
//                     textColor: Colors.white,
//                     elevation: 7.0,
//                     color: Colors.blue)
//               ],
//             )),
//       ),
//     );
//   }
// }