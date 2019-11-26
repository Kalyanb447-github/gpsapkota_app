import 'package:flutter/material.dart';
import 'package:gpsapkota_app/screens/admin_panel/contact_list.dart';

// import '../screens/orders_screen.dart';
// import '../screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 800,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50)
      ),
      child: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text('GPSapkota'),
              automaticallyImplyLeading: false,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.remove_red_eye),
              title: Text('Appointment'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Contact'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>ContactList(),
                ));
                   
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Appointment'),
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
                 Divider(),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Contact'),
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
