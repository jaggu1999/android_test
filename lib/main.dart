import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:custom_switch/custom_switch.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() => runApp(MyApp());
String name;
String exp;
String desg;
String loc;
String hos;
bool status=true;
class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/main': (BuildContext context) => Screen1(),
        '/screen2': (BuildContext context) => Screen2(),
        '/screen3': (BuildContext context) => Screen3(),
      },
      home: Screen1(),
    );
  }
}
class Screen1 extends StatefulWidget{
  Screen1State createState() => new Screen1State();
}
class Screen1State extends State<Screen1>{

  void initState(){
    super.initState();
    Firestore.instance.collection("Data").document("Details").get().then((value){
      setState(() {
        name=value.data["Name"];
        exp=value.data["Experience"];
        desg=value.data["Designation"];
        loc=value.data["City"];
        hos=value.data["Hospital"];
      });
    });
  }
  Widget build(BuildContext context){
    return WillPopScope(
        onWillPop: () => Future.value(false),
    child: Scaffold(
      backgroundColor: Color(0xff062545),
      body: Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 50, 20, 360),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff0069B1),
                  ),
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 7.5),
                                child: IconButton(
                                  icon: Icon(Icons.close),
                                  color: Colors.white,
                                  iconSize: 30,
                                  onPressed: (){},
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 30,left: 70),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage('https://media-exp1.licdn.com/dms/image/C5103AQFd2tLgS8s6TA/profile-displayphoto-shrink_200_200/0?e=1594252800&v=beta&t=whJ4msOd9JEQ88rAe4a9hFdzc9qqzKztrlDyR87qhsM'),
                                    maxRadius: 40,
                                  ),
                                ),

                                  ],
                                ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 7.5,left: 70),
                                child: IconButton(
                                  icon: Icon(MaterialCommunityIcons.square_edit_outline),
                                  color: Colors.white,
                                  iconSize: 30,
                                  onPressed: (){Navigator.of(context).pushNamed('/screen2');},
                                ),
                              ),
                            ],
                          ),
                        ],
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 170),
                        child: Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.5,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 7.5),
                        child: Text(
                          exp+" years experience",
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 7.5),
                        child: Text(
                          desg,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Icon(Octicons.location,color: Colors.white,size: 20,),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              child: Text(
                                loc,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://media-exp1.licdn.com/dms/image/C5103AQFd2tLgS8s6TA/profile-displayphoto-shrink_200_200/0?e=1594252800&v=beta&t=whJ4msOd9JEQ88rAe4a9hFdzc9qqzKztrlDyR87qhsM'
                                  ),
                                  maxRadius: 10,
                                )
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Text(
                                hos,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(20, 405, 20, 110),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 15,),
                            Container(
                              child: Icon(Icons.dashboard,color: Color(0xff0069B1),size: 30,),
                            ),
                            SizedBox(width: 15),
                            Container(
                              child: Text(
                                  'My dashboard',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff062545),
                                    fontFamily: 'Poppins',
                                    fontSize: 17,
                                  )
                              ),
                            ),
                            SizedBox(width: 107),
                            Container(
                              child: Icon(Icons.arrow_forward_ios,color:Colors.black12),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        //padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 15,),
                            Container(
                              child: Icon(Icons.notifications,color: Color(0xff0069B1),size: 30,),
                            ),
                            SizedBox(width: 15),
                            Container(
                              child: Text(
                                  'Notifications',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff062545),
                                    fontSize: 17,
                                    fontFamily: 'Poppins',
                                  )
                              ),
                            ),
                            SizedBox(width: 80),
                            CustomSwitch(
                              activeColor: Color(0xff0069B1),
                              value: status,
                              onChanged: (value) {
                                setState(() {
                                  status = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        //padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 15,),
                            Container(
                              child: Icon(MaterialIcons.info_outline,color: Color(0xff0069B1),size: 30,),
                            ),
                            SizedBox(width: 15),
                            Container(
                              child: Text(
                                  'About',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff062545),
                                    fontSize: 17,
                                    fontFamily: 'Poppins',
                                  )
                              ),
                            ),
                            SizedBox(width: 170),
                            Container(
                              child: Icon(Icons.arrow_forward_ios,color:Colors.black12),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        //padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 18,),
                            Container(
                              child: Icon(AntDesign.logout,color: Color(0xff0069B1),size: 25,),
                            ),
                            SizedBox(width: 18),
                            Container(
                              child: Text(
                                  'Log Out',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff062545),
                                    fontSize: 17,
                                    fontFamily: 'Poppins',
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    ),
    );
  }
}