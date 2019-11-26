import 'package:flutter/material.dart';
import 'package:gpsapkota_app/widgets/app_drawer.dart';
import 'package:intl/intl.dart';

import 'edit_contact.dart';

class ContactList extends StatefulWidget {
  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: Text('Contact List'),
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
           builder: (context)=>EditContact('patientName', 'symtioms', 'time', 'date')
         ));
            },
        
            title: Text('Contact Name'),
            subtitle: Text('Messages'),
            trailing: Text(
                DateFormat('dd/MM/yyyy').format(DateTime.now()).toString()

            ),
          ),
        ),
      ),
    );
  }
}
