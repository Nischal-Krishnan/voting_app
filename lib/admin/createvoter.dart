import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../adminpage.dart';

class CreateVoter extends StatefulWidget {
  @override
  _CreateVoterState createState() => _CreateVoterState();
}

class _CreateVoterState extends State<CreateVoter> {

  final TextEditingController name = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController ward = TextEditingController();
  final TextEditingController fName = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController doorno = TextEditingController();
  final TextEditingController street1 = TextEditingController();
  final TextEditingController street2 = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  final TextEditingController number = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xff36454f),
    elevation: 0,
    ),
    body: Container(
      alignment: Alignment.topCenter,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            SizedBox(
              height: 50,
            ),
            Text('Create Voter',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45)),
              child: TextFormField(
                controller: name,
                validator: (value)
                {if(value.isEmpty ) {
                  return 'Enter name';
                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45)),
              child: TextFormField(
                controller: fName,
                validator: (value)
                {if(value.isEmpty ) {
                  return 'Please Enter';
                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Father Name',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45)),
              child: TextFormField(
                controller: id,
                validator: (value)
                {if(value.isEmpty ) {
                  return 'Enter the ID';
                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Voter ID',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45)),
              child: TextFormField(
                controller: ward,
                validator: (value)
                {if(value.isEmpty ) {
                  return 'Enter ward';
                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Ward',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45)),
              child: TextFormField(
                controller: age,
                keyboardType: TextInputType.number,
                validator: (value)
                {if(value.isEmpty ) {
                  return 'Enter age';
                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45)),
              child: TextFormField(
                controller: gender,
                validator: (value)
                {if(value.isEmpty ) {
                  return 'Enter gender';
                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45)),
              child: TextFormField(
                controller: doorno,
                keyboardType: TextInputType.streetAddress,
                validator: (value)
                {if(value.isEmpty) {
                  return 'Please Enter';
                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Door No.',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),


            SizedBox(height: 30,),

            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45)),
              child: TextFormField(
                controller: street1,
                validator: (value)
                {if(value.isEmpty ) {
                  return 'Enter the address';
                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Street 1',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45)),
              child: TextFormField(
                controller: street2,
                keyboardType: TextInputType.streetAddress,
                validator: (value)
                {if(value.isEmpty) {
                  return 'Please Enter';
                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Street 2',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45)),
              child: TextFormField(
                controller: city,
                keyboardType: TextInputType.streetAddress,
                validator: (value)
                {if(value.isEmpty) {
                  return 'Please Enter';
                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'City/Town',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45)),
              child: TextFormField(
                controller: pincode,
                keyboardType: TextInputType.number,
                validator: (value)
                {if(value.isEmpty) {
                  return 'Please Enter';
                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Pin Code',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),



            SizedBox(height: 30,),

            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.blueGrey,
                  border:Border.all(color: Colors.black45,)
              ),
              child: TextFormField(
                controller: number,
                keyboardType: TextInputType.text,
                validator: (value)
                {if(value.isEmpty || value.length==10 ) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Enter the right number')));
                  return 'Enter your number';

                }
                return null;
                },
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: MaterialButton(
                  elevation: 0,
                  height: 50,
                  minWidth: double.maxFinite,
                  color: Colors.blueGrey,
                  child: Text('Create',
                    style: TextStyle(color: Colors.white, fontSize: 20),),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  onPressed:()async{

                    User user = FirebaseAuth.instance.currentUser;
                    //final String uid = user.uid;
                    firestore.collection('Voter').add(
                        {
                          'Candidate name': name.text,
                          'Father name': fName.text,
                          'Voter ID': id.text,
                          'Ward': ward.text,
                          'Age' : age.text,
                          'Gender': gender.text,
                          'Door No.' : doorno.text,
                          'Street 1' : street1.text,
                          'Street 2' : street2.text,
                          'City/Town' : city.text,
                          'Pin Code' : pincode.text,
                          'Mobile number' : number.text
                        }
                    ).then( (_)  {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> AdminPage()));
                      // ignore: unnecessary_statements
                          (value) => print("User Added");
                    })
                        .catchError((error) => print("Failed to add user: $error"));
                  }
              ),
            ),

            SizedBox(height: 50,),
          ],

        ),
      ),
    ),
    );
  }
}
