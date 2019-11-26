import 'package:flutter/material.dart';

import 'admin_panel/signIn.dart';
import 'users_page/home_page.dart';
class WhoAreYou extends StatefulWidget {
  @override
  _WhoAreYouState createState() => _WhoAreYouState();
}

class _WhoAreYouState extends State<WhoAreYou> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: height * .2,
          ),
          Center(
            child: Text(
              'who you are.',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 40,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(
            height: height * .3,
          ),
          Container(
            height: 70,
            width: 250,
            margin: EdgeInsets.only(left: 50, right: 50),
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.lightGreen,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
              },
              child: Text(
                'Patient',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(
            height: height * .03,
          ),

          //contact us button

          Container(
            width: 250,
            height: 70,
            margin: EdgeInsets.only(left: 50, right: 50),
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SignInPage(),
                ));
              },
              child: Text(
                'Admin',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
