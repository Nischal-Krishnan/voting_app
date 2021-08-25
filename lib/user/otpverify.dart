import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/user/castvote.dart';


class OtpVerification extends StatefulWidget {

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  bool isPhoneNumberSubmitted;
  bool isCodeVerified;
  String verificationCode;
  String number;
  String num, phNumber;

  TextEditingController mobileNumber;
  TextEditingController  _codeNumberController ;

  @override
  void initState() {
    super.initState();
    isPhoneNumberSubmitted = false;
    isCodeVerified = false;
    mobileNumber = TextEditingController();
    _codeNumberController = TextEditingController();
  }

  void _verifySMS() async {
    setState(() {
      isCodeVerified = true;
    });
    _signInWithPhoneNumber();
  }

 Future <void> _verifyPhoneNumber()async{

    final QuerySnapshot result = await FirebaseFirestore.instance.collection('Voter')
        .where('Mobile number', isEqualTo: mobileNumber.text ).get();
    final List <DocumentSnapshot> document = result.docs;
    if(document.isNotEmpty){
      num = document.toString();
    }
    else{print('Invalid number');}
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mobileNumber.text,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    setState(() {
      isPhoneNumberSubmitted = true;
    });
  }

  Future <void> verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {

    print('Verification completed is called ');
    final UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);

    print('user have singed with ${userCredential.user.uid}');

  }

  Future <void> verificationFailed(FirebaseAuthException error) async {
    print('Verification failed is called ${error.toString()}');

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error occurred ${error.toString()}')));
    setState(() {
      isPhoneNumberSubmitted = false;
    });
  }

  Future <void> codeSent(String verificationId, int forceResendingToken) async {
    print('Code sent is called with $verificationCode and token $forceResendingToken');
    setState(() {
      isPhoneNumberSubmitted = true;
      verificationCode = verificationId;
    });
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP is sent to your mobile number ')));

  }

  Future <void>  codeAutoRetrievalTimeout(String verificationId) async{

    print(
        'Code auto retrieval time out is called with verification id $verificationId');

  }

  Future<void>_signInWithPhoneNumber() async {
    final code = _codeNumberController.text;

    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationCode,
      smsCode: (code == null || code.trim().length == 0) ? '123456' : code,
    );

    final UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CastVote()));
    print('user have singed with ${userCredential.user.uid}');
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
                  controller: mobileNumber,
                  validator: (value)
                  {if(value.isEmpty|| value.length!=10) {
                    this.phNumber = value;
                    return 'Invalid ID';
                  }
                  return null;
                  },
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: 'Enter the mobile number',
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    icon: Icon(Icons.account_circle,
                      color: Colors.white,),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff536872),
                    border:Border.all(color: Colors.black45)),
                child: TextFormField(
                  controller: _codeNumberController,
                  validator: (value)
                  {if(value.isEmpty) {
                    return 'Invalid OTP';
                  }
                  return null;
                  },
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: 'Enter the OTP',
                    labelStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    icon: Icon(Icons.account_circle,
                      color: Colors.white,),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(
                  elevation: 0,
                  height: 50,
                  minWidth: double.maxFinite,
                  color: Colors.blueGrey,
                  child: Text('Send OTP',
                    style: TextStyle(color: Colors.white, fontSize: 20),),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  onPressed: (){
                    _verifyPhoneNumber();
                  }),

              SizedBox(height: 30,),

              MaterialButton(
                  elevation: 0,
                  height: 50,
                  minWidth: double.maxFinite,
                  color: Colors.blueGrey,
                  child: Text('Verify OTP',
                    style: TextStyle(color: Colors.white, fontSize: 20),),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  onPressed: (){
                      _verifySMS();
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
