import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../adminpage.dart';

class CreateCandidate extends StatefulWidget {
  @override
  _CreateCandidateState createState() => _CreateCandidateState();
}

class _CreateCandidateState extends State<CreateCandidate> {

  final TextEditingController name = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController ward = TextEditingController();
  final TextEditingController year = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController number = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  _CreateCandidateState();

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
              SizedBox(height: 50,),
              Text('Allocate Candidate',
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
                    labelText: 'Candidate Name',
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
                  controller: year,
                  keyboardType: TextInputType.number,
                  validator: (value)
                  {if(value.isEmpty ) {
                    return 'Enter the year';
                  }
                  return null;
                  },
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: 'Year',
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
                  controller: date,
                  keyboardType: TextInputType.datetime,
                  validator: (value)
                  {if(value.isEmpty) {
                    return 'Enter the date';
                  }
                  return null;
                  },
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: 'Date of election',
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
                  controller: address,
                  validator: (value)
                  {if(value.isEmpty ) {
                    return 'Enter the address';
                  }
                  return null;
                  },
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: 'Address',
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
                  keyboardType: TextInputType.number,
                  validator: (value)
                  {if(value.isEmpty || value.length!=13 ) {
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
                    child: Text('Allocate',
                      style: TextStyle(color: Colors.white, fontSize: 20),),
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    onPressed:()async{

                      firestore.collection('Candidate').add(
                       {
                         'candidate name': name.text,
                         'Voter ID': id.text,
                         'ward': ward.text,
                         'Year' : year.text,
                         'Date' : date.text,
                         'Gender': gender.text,
                         'Address' : address.text,
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
