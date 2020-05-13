import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class Screen2 extends StatefulWidget{
  Screen2State createState() => Screen2State();
}
String tit,nam,mob,gen,dob;
class Screen2State extends State<Screen2>{
  File _image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  RegExp regExp = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;

    });
  }
  Widget build(BuildContext){
    return Scaffold(
      backgroundColor: Color(0xff0069B1),
      body: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 35, left: 20),
                    child: IconButton(
                      icon: Icon(Icons.keyboard_backspace),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: (){Navigator.pop(context);},
                    ),
                  ),
                ],

              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 50, left: 63),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://media-exp1.licdn.com/dms/image/C5103AQFd2tLgS8s6TA/profile-displayphoto-shrink_200_200/0?e=1594252800&v=beta&t=whJ4msOd9JEQ88rAe4a9hFdzc9qqzKztrlDyR87qhsM'),
                        maxRadius: 40,
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 13, left: 63),
                        child: Text(
                          "User ID: ABC123",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 75, left: 170),
            child: MaterialButton(
              onPressed: getImage,
              color: Colors.white,
              child: Icon(SimpleLineIcons.camera,color: Color(0xff0069B1),size: 25,),
              padding: EdgeInsets.all(8),
              shape: CircleBorder(),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 185),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListView(
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 35, right: 35),
                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Please enter the Title';
                              }
                            },
                            style: TextStyle(
                              height: 0.75,
                              color: Colors.black26,
                              fontFamily: 'Poppins',
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Title',
                                labelStyle: TextStyle(
                                  color: Colors.black26,
                                  fontFamily: 'Poppins',
                                )
                            ),
                            onSaved: (input) => tit=input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 35, right: 35),
                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Please enter the Name';
                              }
                            },
                            style: TextStyle(
                              height: 0.75,
                              color: Colors.black26,
                              fontFamily: 'Poppins',
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  color: Colors.black26,
                                  fontFamily: 'Poppins',
                                )
                            ),
                            onSaved: (input) => nam=input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 35, right: 35),
                          child: TextFormField(
                            validator: (input) {
                              if (input.length == 0) {
                                return 'Please enter the Mobile Number';
                              }
                              else if (!regExp.hasMatch(input)) {
                                return 'Please enter Valid Mobile Number';
                              }
                            },
                            style: TextStyle(
                              height: 0.75,
                              color: Colors.black26,
                              fontFamily: 'Poppins',
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Mobile no.',
                                labelStyle: TextStyle(
                                  color: Colors.black26,
                                  fontFamily: 'Poppins',
                                )
                            ),
                            onSaved: (input) => mob=input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 35, right: 35),
                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Please select the Gender';
                              }
                            },
                            style: TextStyle(
                              height: 0.75,
                              color: Colors.black26,
                              fontFamily: 'Poppins',
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'Gender',
                                labelStyle: TextStyle(
                                  color: Colors.black26,
                                  fontFamily: 'Poppins',
                                )
                            ),
                            onSaved: (input) => gen=input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 35, right: 35),
                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Please enter the DOB';
                              }
                            },
                            style: TextStyle(
                              height: 0.75,
                              color: Colors.black26,
                              fontFamily: 'Poppins',
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: 'DOB',
                                labelStyle: TextStyle(
                                  color: Colors.black26,
                                  fontFamily: 'Poppins',
                                )
                            ),
                            onSaved: (input) => dob=input,
                          ),
                        ),
                        SizedBox(height: 35,),
                        Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 25,
                                  height: 3,
                                  child: Text("-"),
                                  color: Color(0xff062545),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  child: Icon(Octicons.primitive_dot,color: Color(0xff062545),size: 10,),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: MaterialButton(
                            onPressed: check,
                            child: Text('Next',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Color(0xff4FBDCC),
                            elevation: 0,
                            minWidth: 150,
                            height: 50,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
  void check() async{
    final formState = _formKey.currentState;
    if(formState.validate()) {
      formState.save();

      Navigator.of(context).pushNamed('/screen3');
    }
  }
}