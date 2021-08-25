import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_app/adminsignin.dart';
import 'package:voting_app/user/usersignin.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voting App',
      theme: ThemeData(

        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Voting App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: Container(
        decoration: BoxDecoration(

          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xff85a1c1),
                Color(0xff274b69),
              ]
          ),

          /*image: DecorationImage(
            image: AssetImage("lib/images/vote-clipart-gif-5.gif"),
            fit: BoxFit.cover
          )*/
        ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 8),
              child: MaterialButton(
                height: 50,
                color: Colors.blueGrey,
                child: Text("Admin Sign In",
                    style:
                    GoogleFonts.openSans(color: Colors.white, fontSize: 20)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                ),

                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> AdminSignIn()));
                },

              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              margin: EdgeInsets.only(top: 8),
              child: MaterialButton(
                height: 50,
                color: Colors.blueGrey,
                child: Text("User Sign In",
                style:
                  GoogleFonts.openSans(color: Colors.white, fontSize: 20),),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> UserSignIn()));
                },
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}
