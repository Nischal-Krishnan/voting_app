import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
      Text('Election Results',
        textAlign: TextAlign.center,
        style: GoogleFonts.openSans(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),),
      SizedBox(height: 30,),
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Table(
          children: [
            TableRow(children: [
              Container(padding: EdgeInsets.all( 10),child: Text('Candidate name', style: TextStyle(fontSize: 15.0))),
              Container(padding:  EdgeInsets.all( 10),child: Text('Number of votes', style: TextStyle(fontSize: 15.0))),
            ],decoration: BoxDecoration(
              color: Colors.black12,
           )),
            TableRow(children: [
              Container(padding:  EdgeInsets.all( 10),child: Text('Dhruv', style: TextStyle(fontSize: 15.0,),)),
              Container(padding: EdgeInsets.all( 10),child: Text('0', style: TextStyle(fontSize: 15.0),)),
            ],decoration: BoxDecoration(

            )),
            TableRow(children: [
              Container(padding: EdgeInsets.all( 10),child: Text('Aarav', style: TextStyle(fontSize: 15.0))),
              Container(padding: EdgeInsets.all( 10),child: Text('0', style: TextStyle(fontSize: 15.0))),
            ]),
            TableRow(children: [
              Container(padding: EdgeInsets.all( 10),child: Text('Anika', style: TextStyle(fontSize: 15.0))),
              Container(padding: EdgeInsets.all( 10),child: Text('1', style: TextStyle(fontSize: 15.0))),
            ]),

            TableRow(children: [
              Container(padding: EdgeInsets.all( 10), child: Text('Ishita', style: TextStyle(fontSize: 15.0))),
              Container(padding: EdgeInsets.all( 10),child: Text('0', style: TextStyle(fontSize: 15.0))),
            ])
          ],
        ),
      )

    ],
    ),
    ),
    ),
    );
  }
}
