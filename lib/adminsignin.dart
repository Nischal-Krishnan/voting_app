import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/adminpage.dart';


class AdminSignIn extends StatefulWidget {
  @override
  _AdminSignInState createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String email;
  String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  void _showErrorDialog(String msg)
  {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An Error Occurred'),
          content: Text(msg),
          actions: <Widget>[
            MaterialButton(
              child: Text('Okay'),
              onPressed: (){
                Navigator.of(ctx).pop();
              },
            )
          ],
        )
    );
  }

  login() async{
    try {
      auth.signInWithEmailAndPassword(
          email: email,     //admin@gmail.com
          password: password  //Admin1234
      ).then((_){
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> AdminPage()));
      });//Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> AdminPage()));
      }  catch (error) {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff36454f),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              SizedBox(
                height: 50,
              ),
            Text('Admin Sign in',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 80,
            ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff536872),
                    border:Border.all(color: Colors.black45)),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value)
                  {if(value.isEmpty || !value.contains('@')) {
                    return 'invalid email';
                  }
                  return null;
                  },
                  onChanged: (val){
                    email = val.trim();
                  },
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: 'Email *',
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    icon: Icon(Icons.email_rounded,
                    color: Colors.white,),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff536872),
                    border:Border.all(color: Colors.black45)),
                child: Form(
                  key: formkey,
                  child: TextFormField(
                    controller: passwordController,
                    validator: (value)
                    {if(value.isEmpty || value.length<=7) {
                      return 'invalid password';
                    }
                    return null;
                    },
                    onChanged: (val){
                      password = val.trim();
                    },
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: const InputDecoration(
                      labelText: 'Password *',
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      icon: Icon(Icons.lock_outline,
                        color: Colors.white,),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                  elevation: 0,
                  height: 50,
                  minWidth: double.maxFinite,
                  color: Colors.blueGrey,
                  child: Text('Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  onPressed:()async{
                    login();
                  } ),
            ],
          ),
        ),
      ),
    );
  }
}
