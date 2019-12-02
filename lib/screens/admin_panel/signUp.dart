import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gpsapkota_app/screens/admin_panel/appointment_list.dart';
import 'package:gpsapkota_app/screens/admin_panel/signIn.dart';
import 'package:gpsapkota_app/screens/users_page/home_page.dart';

import 'package:gpsapkota_app/widgets/custom_shape.dart';
import 'package:gpsapkota_app/widgets/customappbar.dart';
import 'package:gpsapkota_app/widgets/responsive_ui.dart';
import 'package:gpsapkota_app/widgets/textformfield.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
    final FirebaseAuth _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();
    String _name, _email, _password;

   bool _obscureText=true;
    bool _obscureText2=true;
    bool isEmail(String em) {

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}
  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }
  
  navigateToSigninScreen() {
    Navigator.pushReplacementNamed(context, "/SigninPage");
  }

  @override
  void initState() {
    super.initState();
  //  this.checkAuthentication();
  }

    signup() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      alertBox();

      try {
        AuthResult user = await _auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        if (user != null) {
            // UserUpdateInfo updateuser = UserUpdateInfo();
            // updateuser.displayName = _name;
            // user.updateProfile(updateuser);

              Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (contect)=>HomePage(user:user),
        )); 
        }
      } catch (e) {
        showError(e.message);
      }
    }
  }

  //alertbox
  alertBox() {
    return showDialog(
        context: context,
        builder: (_) => Center(
                // Aligns the container to center
                child: Container(
              // A simplified version of dialog.
              width: 100.0,
              height: 65.0,
              decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(0.3)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.blueGrey,
                  ),
                                  ],
              ),
                         )));
  }
  //error
  showError(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(errorMessage),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
     return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: ListView(
          children: <Widget>[
            clipShape(),
            welcomeTextRow(),
            signInTextRow(),
            form(),
            //forgetPassTextRow(),
            SizedBox(height: _height / 20),
            button(),
            signUpTextRow(),
          ],
        ),
      ),
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 4
                  : (_medium ? _height / 5.75 : _height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 4.5
                  : (_medium ? _height / 4.25 : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
              top: _large
                  ? _height / 30
                  : (_medium ? _height / 25 : _height / 20)),
          // child: Image.asset(
          //   'assets/images/login.png',
          //   height: _height/3.5,
          //   width: _width/3.5,
          // ),
        ),
      ],
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 100),
      child: Row(
        children: <Widget>[
          Text(
            "Welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _large ? 60 : (_medium ? 50 : 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Create your account",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(

        key: _formKey,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
            SizedBox(height: _height / 40.0),
            conformPasswordTextFormField(),
          ],
        ),
      ),
    );
  }
  Widget emailTextFormField() {
    return Material(
      borderRadius: BorderRadius.circular(15.0),
      elevation: 10,
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter some text';
          }
          // isEmail(value)==true;
          if (!isEmail(value)) {
            return 'this is not an email';
          }
          return null;
        },
        onSaved: (value) => emailController.text = value,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email, color: Colors.orange[200], size: 20),
            hintText: "Email ID",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide.none),
            errorStyle: TextStyle(
              textBaseline: TextBaseline.alphabetic,
              decorationStyle: TextDecorationStyle.wavy,
            )),
      ),
    );
  }

    Widget passwordTextFormField() {
    return Material(
      borderRadius: BorderRadius.circular(15.0),
      elevation: 10,
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Password is empty';
          }
          if (value.length < 8) {
            return 'Password less then 8';
          }
          return null;
        },
        onSaved: (value) => passwordController.text = value,
        controller: passwordController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        obscureText: _obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.orange[200], size: 20),
            suffixIcon: GestureDetector(
            onTap: (){
          
                setState(() {
                  _obscureText=!_obscureText;
                });
              
            },
           child:_obscureText?Icon(Icons.visibility,color: Colors.grey,):Icon(Icons.visibility_off,color: Colors.grey),
          ),

          hintText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
  Widget conformPasswordTextFormField() {
    return Material(
  borderRadius: BorderRadius.circular(15.0),
        elevation: 10,
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'confirm password is empty';
          }
          if (value.length <8 ) {
            return 'confirm password less then 8';
          }
          if (passwordController.text != conformPasswordController.text ) {
            return 'password donen\'t match';
          }

          return null;
        },
        onSaved: (value) => conformPasswordController.text = value,
        controller: conformPasswordController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        obscureText: _obscureText2,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.orange[200], size: 20),
                 suffixIcon: GestureDetector(
            onTap: (){
          
                setState(() {
                  _obscureText2=!_obscureText2;
                });
              
            },
           child:_obscureText2?Icon(Icons.visibility,color: Colors.grey,):Icon(Icons.visibility_off,color: Colors.grey),
          ),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget forgetPassTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot your password?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              print("Routing");
            },
            child: Text(
              "Recover",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.orange[200]),
            ),
          )
        ],
      ),
    );
  }

    Widget button() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: RaisedButton(
        color: Colors.pinkAccent,
            onPressed: () async {
       // await signInWithEmailPassword();
        // print("Routing to your account");
        // Scaffold.of(context)
        //     .showSnackBar(SnackBar(content: Text('Login Successful')));

        //   if (_formKey.currentState.validate()) {
        //   // If the form is valid, display a Snackbar.
        //   // Scaffold.of(context)
        //   //     .showSnackBar(SnackBar(content: Text('Processing Data')));
        //   print('all data validate');
        // }
        signup();
      },
        child: Text(
          'Create Account',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) => SignInPage()));
              print("Routing to Sign up screen");
            },
            child: Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: _large ? 19 : (_medium ? 17 : 15)),
            ),
          )
        ],
      ),
    );
  }
}
