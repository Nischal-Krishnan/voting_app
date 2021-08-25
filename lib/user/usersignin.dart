import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/user/otpverify.dart';

class UserSignIn extends StatefulWidget {
  @override
  _UserSignInState createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {

  TextEditingController voterid = TextEditingController();

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
            children: <Widget>[
              SizedBox(height: 100,),
              Text('User Sign in',
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),),
              SizedBox(height: 80,),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff536872),
                    border:Border.all(color: Colors.black45)),
                child: TextFormField(
                  controller: voterid,
                  validator: (value)
                  {if(value.isEmpty) {
                    return 'Invalid ID';
                  }
                  return null;
                  },
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: 'Voter ID',
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    icon: Icon(Icons.account_circle,
                      color: Colors.white,),
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
                  onPressed:() async {
                    // User user = FirebaseAuth.instance.currentUser;
                    final QuerySnapshot result = await FirebaseFirestore.instance.collection('Voter')
                        .where('Voter ID', isEqualTo: voterid.text ).get();
                    final List <DocumentSnapshot> document = result.docs;
                    if(document.isNotEmpty)
                    {
                      print('logged in');
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> OtpVerification()));
                    }
                    else{
                      print('Not logged in');
                    }
                  } ),

            ],
          ),
        ),
      ),
    );
  }

}
