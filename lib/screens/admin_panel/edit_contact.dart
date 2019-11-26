import 'package:flutter/material.dart';
import 'package:gpsapkota_app/widgets/app_drawer.dart';

class EditContact extends StatefulWidget {
  String patientName;
  String symtioms;
  String time;
  String date;
  EditContact(this.patientName, this.symtioms, this.time, this.date);
  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .8,
              //color: Colors.lightGreen,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: new LinearGradient(
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                    colors: [
                      Colors.cyan[800],
                      Colors.cyan[400],
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //   SizedBox(height: 20,),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  //   SizedBox(height: 20,),
                  ListTile(
                    title: Text(
                      'Patient Name',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Raj Sharma',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Kalyan@gamil.com',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Message',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'sir i want to know something  ,dfgbkubgkjdsmf dbfvsd sg  ghgs g sugug ',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      maxLines: 5,
                    ),
                  ),

                  ListTile(
                    leading: Text(
                      '10.15',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '10/12/19',
                      style: TextStyle(
                          color: Colors.white54,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .2 - 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 100,
                            child: RaisedButton(
                              color: Colors.white,
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.email,
                                    color: Colors.lightGreen,
                                  ),
                                  Text(
                                    'Send Eamil ',
                                    style: TextStyle(
                                        color: Colors.lightGreen,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 5,
                          child: Container(
                            height: 100,
                            child: RaisedButton(
                              color: Colors.white,
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    'Delete',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
