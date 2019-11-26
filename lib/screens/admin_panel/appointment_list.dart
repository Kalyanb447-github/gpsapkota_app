import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gpsapkota_app/models/appointment_model.dart';
import 'package:gpsapkota_app/widgets/app_drawer.dart';
import 'package:gpsapkota_app/widgets/progress.dart';
import 'package:intl/intl.dart';

import 'edit_appointment.dart';

class AppointmentList extends StatefulWidget {
  // FirebaseUser currentUser;
  // AppointmentList({this.currentUser});
  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
    List<AppointmentModel> posts;

      final timelineRef = Firestore.instance.collection('appointment');

  getTimeline() async {
    QuerySnapshot snapshot = await timelineRef
        .document('userId')
        .collection('appointments')
       // .orderBy('timestamp', descending: true)
        .getDocuments();
    List<AppointmentModel> posts =
        snapshot.documents.map((doc) => AppointmentModel.fromDocument(doc)).toList();
    setState(() {
      this.posts = posts;
    });
  }

  // buildUsersToFollow(){
  //   return StreamBuilder(
  //     stream:timelineRef.orderBy('timestamp', descending: true).limit(30).snapshots(),
  //    builder: (context,snapshot){
  //      if (!snapshot.hasData) {
  //                  return circularProgress();

  //      }

  //        List<AppointmentModel> userResults = [];

  //        snapshot.data.forEach((doc){
           
  //           // AppointmentModel appointmentModel = AppointmentModel.fromDocument(doc);
                     
  //           // AppointmentModel appointmentModel = AppointmentModel(appointmentModel);
  //           // userResults.add(appointmentModel);
          
  //        });

  //    },
  //   );
  // }
    buildTimeline() {
    if (posts == null) {
      return circularProgress();
    } else if (posts.isEmpty) {
     // return buildUsersToFollow();
    } else {
    //  return ListView(children: posts);
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
         appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        title: Text('Appointment List'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
            Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                 //     '\$${cart.totalAmount.toStringAsFixed(2)}',
                 '12354',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
               
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
               Expanded(
            child: ListView.builder(
              itemCount:5,
              itemBuilder: (ctx, i) => CartItem(
                   
                  ),
            ),
          )
        ],
      ),
    );
  }
}


//single card
class CartItem extends StatelessWidget {
  // final String id;
  // final String productId;
  // final double price;
  // final int quantity;
  // final String title;

  // CartItem(
  //   this.id,
  //   this.productId,
  //   this.price,
  //   this.quantity,
  //   this.title,
  // );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
     key: ValueKey(1),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction){
       return showDialog(
          context: context,
          builder: (context)=>AlertDialog(
           title: Text('Are you sure'),
           content: Text('do ypu want to remove the item from the card'),
           actions: <Widget>[
             FlatButton(
               child: Text('no'),
               onPressed: (){
                 Navigator.of(context).pop(false);
               },
             ),
                  FlatButton(
               child: Text('yes'),
               onPressed: (){ 
               Navigator.of(context).pop(true);

               },
             )
           ],
             

          ),
        );
      },
      onDismissed: (direction) {
      //  Provider.of<Cart>(context, listen: false).removeItem(productId);
      },

      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            onTap: (){
         //     print('something');
         Navigator.of(context).push(MaterialPageRoute(
           builder: (context)=>Editappointmment('patientName', 'symtioms', 'time', 'date')
         ));
            },
            leading: CircleAvatar(
              
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text(
                    DateFormat.Hm().format(DateTime.now()).toString()
                  ),
                ),
              ),
            ),
            title: Text('Patient Name'),
            subtitle: Text('Symptioms'),
            trailing: Text(
                DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()

            ),
          ),
        ),
      ),
    );
  }
}
