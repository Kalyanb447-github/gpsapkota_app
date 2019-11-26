import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'appointment_page.dart';
import 'contact_us_page.dart';
class HomePage extends StatefulWidget {
  AuthResult user;
  HomePage({this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _launchCaller() async{
    var url="tel:+91 98002 01837";
    if(await canLaunch(url)){
      launch(url);   
    } 
    else{
       print('cant launch this $url ');
    }
}
  _launchEmail() async{
    var url="mailto:sapkotagps@gmail.com";
    if(await canLaunch(url)){
      launch(url);   
    } 
    else{
       print('cant launch this $url ');
    }
}

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white ,
      body: SafeArea(
              child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            //  color: Colors.black54.withOpacity(.50),
            boxShadow: [
              BoxShadow(
                color: Colors.green,
                blurRadius: 20.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  10.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              )
            ],
            image: DecorationImage(
              image: AssetImage("images/doctor.jpg"),
              fit: BoxFit.fill,
              //  colorFilter: ColorFilter.
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              //call buton
              Container(
             
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                   
                   RaisedButton(
                     color: Colors.red,
                    child: Row(
                      children: <Widget>[
                         Text('Call',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                         SizedBox(width: 25,),
                         Icon(Icons.call,color: Colors.white),
                      ],
                    ),
                  onPressed: (){
                  return  _launchCaller();
                  },
                  
                ),
                    ],
                 ),
              ),
                //mail buton
                   Container(
                
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                   
                   RaisedButton(
                     color: Colors.lightGreen,
                    child: Row(
                      children: <Widget>[
                         Text('Mail',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                         SizedBox(width: 20,),
                         Icon(Icons.mail,color: Colors.white),
                      ],
                    ),
                  onPressed: (){
                  return  _launchEmail();
                  },
                  
                ),
                    ],
                 ),
              ),
              SizedBox(
                height: height * .2,
              ),
              Container(
                padding: EdgeInsets.all(5),
                color: Colors.black54,
                child: Text(
                  'Dr. G. P. SAPKOTA',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                color: Colors.black54,
                child: Text(
                  'We provide the basis for  your new  and happy  family with our prenatal  consultation,  child rearing practices & parenting   consultations.',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                      ),
                ),
              ),

              SizedBox(
                height: height * .1,
              ),
              //Book Appointment button
              Container(
                height: 70,
                   width: 250,
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.lightGreen,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AppointmentPage(user: widget.user,),
                    ));
                  },
                  child: Text(
                    'Book Appointment',
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
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ContactUsPage(user: widget.user,),
                    ));
                  },
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),


              
            ],
          ),
        ),
      ),
    );
  }
}
