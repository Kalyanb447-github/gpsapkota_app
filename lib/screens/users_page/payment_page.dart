import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  static String tag = 'payment-page';

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    var payUsingText = Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      child: Text(
        'Pay Using',
        style: TextStyle(
            color: Colors.black38, fontSize: 25.0, fontWeight: FontWeight.w700),
        textAlign: TextAlign.left,
      ),
    );
    var appBar = AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => Navigator.pop(context, false),
        icon: Icon(Icons.arrow_back, color: Colors.black),
      ),
      title: Text(
        'Payment',
        style: TextStyle(color: Colors.black),
      ),
    );
    Widget cashOnDElevery = Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ExpansionTile(
        title: Text(
          'Pay Cash on Delivery(COD)',
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w700),
          textAlign: TextAlign.left,
          maxLines: 1,
        ),
//9873351039
        //expention data
        children: <Widget>[
          ListTile(
            onTap: () {},
            leading: ClipRect(
              child: Image.asset(
                'assets/money.jpg',
                height: 50,
              ),
              clipBehavior: Clip.antiAlias,
            ),
            title: Text(
              'Pay with Cash',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
              maxLines: 1,
            ),
            trailing: Icon(Icons.radio_button_unchecked),
          ),
        ],
      ),
    );
    var bottomPortion = Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border(top: BorderSide(width: .2))),
        height: 90,
        //color: Colors.red,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Rs. 419',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'View Details',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: 60,
              width: 150,
              child: RaisedButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ));
    var creditAndDebit = Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ExpansionTile(
        title: Text(
          'Credit/Debit Card',
          style: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w700),
          textAlign: TextAlign.left,
          maxLines: 1,
        ),

        //expention data
        children: <Widget>[
          ListTile(
            onTap: () {},
            leading: ClipRect(
              child: Image.asset(
                'assets/credit.png',
                height: 52,
              ),
              clipBehavior: Clip.antiAlias,
            ),
            title: Text(
              'Credit Card',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
              maxLines: 1,
            ),
            trailing: Icon(Icons.radio_button_unchecked),
          ),
          //debit card
          ListTile(
            onTap: () {},
            leading: ClipRect(
              child: Image.asset(
                'assets/debit.png',
                height: 50,
              ),
              clipBehavior: Clip.hardEdge,
            ),
            title: Text(
              'Debit Card',
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.left,
              maxLines: 1,
            ),
            trailing: Icon(Icons.radio_button_unchecked),
          ),
        ],
      ),
    );
    var netWorking = Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ExpansionTile(
                  title: Text(
                    'Netbanking',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                  ),
    
                  //expention data
                  children: <Widget>[
                    ListTile(
                      onTap: () {},
                      leading: ClipRect(
                        child: Image.asset(
                          'assets/netbanking.jpg',
                          height: 50,
                        ),
                        clipBehavior: Clip.antiAlias,
                      ),
                      title: Text(
                        'Internet Banking',
                        style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                      ),
                      trailing: Icon(Icons.radio_button_unchecked),
                    ),
                  ],
                ),
              );
        var upi = Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ExpansionTile(
                title: Text(
                  'UPI ID',
                  style: TextStyle(
                      color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                ),
        
                //expention data
                children: <Widget>[
                  ListTile(
                    onTap: () {},
                    leading: ClipRect(
                      child: Image.asset(
                        'assets/google.png',
        
                        height: 50,
                      ),
                      clipBehavior: Clip.antiAlias,
                    ),
                    title: Text(
                      'Google Pay ',
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                    trailing: Icon(Icons.radio_button_unchecked),
                  ),
                  //phone pay
                    ListTile(
                    onTap: () {},
                    leading: ClipRect(
                      child: Image.asset(
                        'assets/phonepe.jpg',
                        height: 50,
                      ),
                      clipBehavior: Clip.antiAlias,
                    ),
                    title: Text(
                      'PhonePe',
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                    trailing: Icon(Icons.radio_button_unchecked),
                  ),
                  //paytm
                    ListTile(
                    onTap: () {},
                    leading: ClipRect(
                      child: Image.asset(
                        'assets/bhim.jpg',
                        height: 50,
                      ),
                      clipBehavior: Clip.antiAlias,
                    ),
                    title: Text(
                      'BHIM UPI ',
                      style: TextStyle(
                          color: Colors.black38,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                    trailing: Icon(Icons.radio_button_unchecked),
                  ),
                ],
              ),
            );
                return Scaffold(
                  appBar: appBar,
                  body: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      //only text
                      payUsingText,
            
                      //Pay Cash on Delivery
                      //expention
                      cashOnDElevery,
                      SizedBox(
                        height: 10,
                      ),
                      creditAndDebit,
                      SizedBox(
                        height: 10,
                      ),
                      netWorking,
                        SizedBox(
                        height: 10,
                        
                      ),
                      upi,
        ],
      ),
      bottomNavigationBar: bottomPortion,
    );
  }
}
