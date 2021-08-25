import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewCandidates extends StatefulWidget {
  @override
  _ViewCandidatesState createState() => _ViewCandidatesState();
}

class _ViewCandidatesState extends State<ViewCandidates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff36454f),
        elevation: 0,
      ),
      body: Container(
      width: double.infinity,
      color: Colors.white,

       child: SingleChildScrollView(
         child: Column(
           children:<Widget> [
             SizedBox(height: 50,),
             Text('View Candidates',
               textAlign: TextAlign.center,
               style: GoogleFonts.openSans(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),),
             SizedBox(height: 50,),
             Container(
               padding: EdgeInsets.only(left: 10),
               alignment: Alignment.topLeft,
               child: Text(
                   'Candidate name: Dhruv\n Voter ID: SA5436 \n'
                       ' Mobile Number: 8884562096\n Gender: Male\n Ward: Ward 5\n Date of Election: 26-04-2021\n'
                       'Year: 2021\n Address: Bangalore',
                   style: GoogleFonts.openSans(color: Colors.black, fontSize: 15)),
             ),
             SizedBox(height: 20,),
             Container(
               padding: EdgeInsets.only(left: 10),
               alignment: Alignment.topLeft,
               child: Text(
                   'Candidate name: Aarav\n Voter ID: SA5467 \n'
                       ' Mobile Number: 8884562096\n Gender: Male\n Ward: Ward 5\n Date of Election: 26-04-2021\n'
                       'Year: 2021\n Address: Bangalore',
                   style: GoogleFonts.openSans(color: Colors.black, fontSize: 15)),
             ),
             SizedBox(height: 20,),
             Container(
               padding: EdgeInsets.only(left: 10),
               alignment: Alignment.topLeft,
               child: Text(
                   'Candidate name: Anika\n Voter ID: SA5444 \n'
                       ' Mobile Number: 8884562096\n Gender: Female\n Ward: Ward 5\n Date of Election: 26-04-2021\n'
                       'Year: 2021\n Address: Bangalore',
                   style: GoogleFonts.openSans(color: Colors.black, fontSize: 15)),
             ),
             SizedBox(height: 20,),
             Container(
               padding: EdgeInsets.only(left: 10),
               alignment: Alignment.topLeft,
               child: Text(
                   'Candidate name: Ishita\n Voter ID: SA5489 \n'
                       ' Mobile Number: 8884562096\n Gender: Female\n Ward: Ward 5\n Date of Election: 26-04-2021\n'
                       'Year: 2021\n Address: Bangalore',
                   style: GoogleFonts.openSans(color: Colors.black, fontSize: 15)),
             ),
           ],
         )),
      ),
    );
  }
}
