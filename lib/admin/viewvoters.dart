import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewVoter extends StatefulWidget {
  @override
  _ViewVoterState createState() => _ViewVoterState();
}

class _ViewVoterState extends State<ViewVoter> {
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
                Text('View Voters',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),),
                SizedBox(height: 50,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                      'Name: Ram\n Father name: Aadesh\n Voter ID: SA5324 \n'
                          ' Mobile Number: +918884562096\n Gender: Male\n Ward: Ward 5\n Age: 32\n '
                          'Door No.: 45\n Street 1: kjsd\n Street 2: kjdadi\n City/Town: Bangalore\n Pin Code: 560076',
                      style: GoogleFonts.openSans(color: Colors.black, fontSize: 15)),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                      'Name: Amar\n Father name: Abdul\n Voter ID: SA5234 \n'
                          ' Mobile Number: +918884562096\n Gender: Male\n Ward: Ward 5\n Age:32\n '
                          'Door No.: 45\n Street 1: kjsd\n Street 2: kjdadi\n City/Town: Bangalore\n Pin Code: 560076',
                      style: GoogleFonts.openSans(color: Colors.black, fontSize: 15)),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                      'Name: Lata\n Father name: Ashoka\n Voter ID: SA5599 \n'
                          ' Mobile Number: +918884562096\n Gender: Female\n Ward: Ward 5\n Age:20\n '
                          'Door No.: 45\n Street 1: 1st cross\n Street 2: 1st main\n City/Town: Bangalore\n Pin Code: 560076',
                      style: GoogleFonts.openSans(color: Colors.black, fontSize: 15)),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: Text(
                      'Name: Diya\n Father name: Vishnu\n Voter ID: SA5892 \n'
                          ' Mobile Number: +919538824126\n Gender: Female\n Ward: Ward 5\n Age: 24\n '
                          'Door No.: 45\n Street 1: 1st cross\n Street 2: 1st main\n City/Town: Bangalore\n Pin Code: 560076',
                      style: GoogleFonts.openSans(color: Colors.black, fontSize: 15)),
                ),

              ],
            )),
      ),
    );
  }
}
