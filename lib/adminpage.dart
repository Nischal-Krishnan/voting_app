import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/admin/createcandidate.dart';
import 'package:voting_app/admin/viewcandidates.dart';
import 'package:voting_app/admin/viewvoters.dart';
import 'package:voting_app/main.dart';
import 'admin/createvoter.dart';
import 'admin/result.dart';


class AdminPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voting App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyAdminPage(title:'Admin Page'),
    );
  }
}

class MyAdminPage extends StatefulWidget {

  MyAdminPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyAdminPageState createState() => _MyAdminPageState();

}

class _MyAdminPageState extends State<MyAdminPage>{

  Offset _offset = Offset(0, 0);
  GlobalKey globalKey = GlobalKey();
  List<double> limits = [];


  bool isMenuOpen = false;

  @override
  void initState(){
    limits = [0, 0 , 0];
    WidgetsBinding.instance.addPostFrameCallback(getPosition);
        super.initState();
  }

  getPosition(duration){
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    final position = renderBox.localToGlobal(Offset.zero);
    double start = position.dy - 20;
    double contLimit = position.dy + renderBox.size.height - 20;
    double step = (contLimit-start)/5;
    limits = [];
    for(double x = start; x<= contLimit; x = x + step){
      limits.add(x);
    }
    setState(() {
      limits = limits;
    });
  }

  double getSize(int x){
    double size = (_offset.dy > limits[x] && _offset.dy < limits[x+1]) ? 25 : 20;
    return size;
  }

  @override
  Widget build(BuildContext context){

    Size mediaQuery = MediaQuery.of(context).size;
    double sizebarSize = mediaQuery.width * 0.65;
    double menuContainerHeight = mediaQuery.height/2;

     return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  SizedBox(height: 80,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> CreateCandidate()));
                    },
                    child: Container(
                      width: 150.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 20.0),
                          blurRadius: 30.0,
                          color: Colors.black12)
                      ],
                      color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            width: 130.0,
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                            child: Text('New Candidate',
                            style: Theme.of(context).textTheme.button.apply(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff85a1c1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(95.0),
                                topLeft: Radius.circular(95.0),
                                bottomRight: Radius.circular(200.0)
                              )
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: (){

                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ViewCandidates()));

                    },
                    child: Container(
                      width: 150.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 20.0),
                            blurRadius: 30.0,
                            color: Colors.black12)
                      ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            width: 130.0,
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                            child: Text('View Candidate',
                              style: Theme.of(context).textTheme.button.apply(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff597387),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(95.0),
                                    topLeft: Radius.circular(95.0),
                                    bottomRight: Radius.circular(200.0)
                                )
                            ),
                          )

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),
                  InkWell(
                    onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> CreateVoter()));},
                    child: Container(
                      width: 150.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 20.0),
                            blurRadius: 30.0,
                            color: Colors.black12)
                      ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            width: 130.0,
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                            child: Text('Create Voter',
                              style: Theme.of(context).textTheme.button.apply(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                color: Color( 0xff3f4d63),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(95.0),
                                    topLeft: Radius.circular(95.0),
                                    bottomRight: Radius.circular(200.0)
                                )
                            ),
                          )

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ViewVoter()));
                    },
                    child: Container(
                      width: 150.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 20.0),
                            blurRadius: 30.0,
                            color: Colors.black12)
                      ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            width: 130.0,
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                            child: Text('View Voter',
                              style: Theme.of(context).textTheme.button.apply(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff2a4158),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(95.0),
                                    topLeft: Radius.circular(95.0),
                                    bottomRight: Radius.circular(200.0)
                                )
                            ),
                          )

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> Result()));
                    },
                    child: Container(
                      width: 150.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 20.0),
                            blurRadius: 30.0,
                            color: Colors.black12)
                      ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22.0)),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            width: 130.0,
                            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                            child: Text('Election Result',
                              style: Theme.of(context).textTheme.button.apply(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xff274b69),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(95.0),
                                    topLeft: Radius.circular(95.0),
                                    bottomRight: Radius.circular(200.0)
                                )
                            ),
                          )

                        ],
                      ),
                    ),
                  ),

                ],
              ),

            ),

            Center(
              child: Container(),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 1500),
              left: isMenuOpen?0: -sizebarSize+20,
              top: 0,
              curve: Curves.elasticOut,
              child: SizedBox(
                  width:  sizebarSize,
                  child: GestureDetector(
                    onPanUpdate: (details){
                        if(details.localPosition.dx<=sizebarSize){
                          setState((){
                            _offset = details.localPosition;
                          });
                        }
                        if(details.localPosition.dx>sizebarSize-20 && details.delta.distanceSquared>2){
                          setState(() {
                            isMenuOpen = true;
                          });
                        }
                    },
                    onPanEnd: (details){
                      setState((){
                        _offset = Offset(0, 0);
                      });
                    },
                    child: Stack(
                      children: <Widget>[
                        CustomPaint(
                          size: Size(sizebarSize, mediaQuery.height),
                          painter: DrawerPainter(offset: _offset),
                        ),
                        Container(
                          height: mediaQuery.height,
                          width: sizebarSize,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                height: mediaQuery.height*0.25,
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Image.asset("assets/admin.png",width: sizebarSize/2,),
                                    ],
                                  ),
                                )
                              ),
                              Divider(thickness: 1,),
                              Container(
                                key: globalKey,
                                width: double.infinity,
                                height: menuContainerHeight,
                                child: Column(
                                  children: <Widget>[
                                    MyButton(
                                      text: "Home",
                                      iconData: Icons.home,
                                      textSize: getSize(0),
                                      height: (menuContainerHeight/5),
                                    ),
                                    MyExitButton(
                                      text: "Log Out",
                                      iconData: Icons.logout,
                                      textSize: getSize(1),
                                      height: (menuContainerHeight/5),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          right: (isMenuOpen)?10:sizebarSize,
                          top: 600,
                          child: IconButton(
                          enableFeedback: true,
                            icon: Icon(Icons.arrow_back,color: Colors.white, size: 30,),
                            onPressed: (){
                            this.setState(() {
                              isMenuOpen = false;
                            });
                            },
                        ),
                         )
                      ],
                    ),
                  )
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double textSize;
  final double height;

  MyButton({this.text, this.iconData, this.textSize,this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: textSize),
          ),
        ],
      ),
      onPressed: (

          ) {
       
      },
    );
  }
}

class MyExitButton extends StatelessWidget {
  final String text;
  final IconData iconData;
  final double textSize;
  final double height;
  final auth = FirebaseAuth.instance;

  MyExitButton({this.text, this.iconData, this.textSize,this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: textSize),
          ),
        ],
      ),
      onPressed: () {
        auth.signOut();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyApp()));
      },
    );
  }
}

class DrawerPainter extends CustomPainter{

  final Offset offset;

  DrawerPainter({this.offset});

  double getControlPointX(double width){
    if(offset.dx == 0){
      return width;
    }else{
      return offset.dx>width?offset.dx:width+75;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blueGrey..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(-size.width,0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(getControlPointX(size.width), offset.dy, size.width, size.height);
    path.lineTo(-size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}