import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/main.dart';

class CastVote extends StatefulWidget {
  @override
  _CastVoteState createState() => _CastVoteState();
}

class _CastVoteState extends State<CastVote> {

  String valueChoose;
  List listItem = [ ' Dhruv',  ' Aarav', ' Anika', 'Ishita'];


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
        children: [
          SizedBox(height: 100,),
          Text('Submit Vote',
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),),
          SizedBox(height: 80,),
          DropdownButton(
            value: valueChoose,
              items: listItem.map((valueItem){
                return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem)
                );
             },).toList(),
            onChanged: (newValue){
              setState(() {
                valueChoose = newValue;
              });
            },
               ),

          MaterialButton(
              elevation: 0,
              height: 50,
              minWidth: double.maxFinite,
              color: Colors.blueGrey,
              child: Text('Vote',
                style: TextStyle(color: Colors.white, fontSize: 20),),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
              ),
              onPressed: (){
                if(valueChoose!=null){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> MyApp()));
                }else{
                  final snackBar = SnackBar(content:Text("Please vote" ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar );
                }

              }),
        ],
      ),
    ),
    ),
    );
  }
}
