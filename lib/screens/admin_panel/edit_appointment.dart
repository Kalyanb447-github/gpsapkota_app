import 'package:flutter/material.dart';
import 'package:gpsapkota_app/widgets/app_drawer.dart';

class Editappointmment extends StatefulWidget {
  String patientName;
  String symtioms;
  String time;
  String date;
  Editappointmment(this.patientName, this.symtioms, this.time, this.date);
  @override
  _EditappointmmentState createState() => _EditappointmmentState();
}

class _EditappointmmentState extends State<Editappointmment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.white,
      drawer: AppDrawer(),
      body: SafeArea(
              child: ListView(
          padding: EdgeInsets.only(left: 10,right: 10,top: 10),
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .5,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),

                   SizedBox(height: 40,),
                    ListTile(
                  title:Text('Patient Name',style: TextStyle(color: Colors.white54,fontSize: 16,fontWeight: FontWeight.bold),),
                   
                   subtitle:  Text('Raj Sharma',style: TextStyle(color: Colors.white54,fontSize: 40,fontWeight: FontWeight.bold),),
                   ),

                ListTile(
                  title: Text('Symptioms',style: TextStyle(color: Colors.white54,fontSize: 16,fontWeight: FontWeight.bold),),
                   subtitle: Text('Fven and headeach',style: TextStyle(color: Colors.white54,fontSize: 30,fontWeight: FontWeight.bold),),
                   ) ,
                         Padding(
                     padding: const EdgeInsets.only(left:18.0),
                     child: Text('Time and Date',style: TextStyle(color: Colors.white54,fontSize: 16,fontWeight: FontWeight.bold),),
                   ),
                  ListTile(
                   leading: Text('10.15',style: TextStyle(color: Colors.white54,fontSize: 25,fontWeight: FontWeight.bold),),
                   trailing: Text('10/12/19',style: TextStyle(color: Colors.white54,fontSize: 25,fontWeight: FontWeight.bold),),
                   ) ,
             

                ],
              ),
            ),
            SizedBox(height: 20,),


               Container(
              height: MediaQuery.of(context).size.height * .5 -20,
           // color: Colors.white70,
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
                             onPressed: (){},
                                                        child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Icon(Icons.confirmation_number,color: Colors.lightGreen,),
                                 Text('Confirm ',style: TextStyle(color: Colors.lightGreen,fontSize: 25,fontWeight: FontWeight.bold),),

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
                             onPressed: (){},
                                                        child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Icon(Icons.delete,color: Colors.red,),
                                 Text('Reject ',style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),),

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
