import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'screen2.dart';
import 'main.dart';
String exp,des,hos,city,state;
class Screen3 extends StatefulWidget{
  Screen3State createState() => Screen3State();
}
class Screen3State extends State<Screen3>{
  File _image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                                return 'Please enter the Experience';
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
                                labelText: 'Experience',
                                labelStyle: TextStyle(
                                  color: Colors.black26,
                                  fontFamily: 'Poppins',
                                )
                            ),
                            onSaved: (input) => exp=input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 35, right: 35),
                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Please enter the Designation';
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
                                labelText: 'Designation',
                                labelStyle: TextStyle(
                                  color: Colors.black26,
                                  fontFamily: 'Poppins',
                                )
                            ),
                            onSaved: (input) => des=input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 35, right: 35),
                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Please enter the Hospital';
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
                                labelText: 'Hospital',
                                labelStyle: TextStyle(
                                  color: Colors.black26,
                                  fontFamily: 'Poppins',
                                )
                            ),
                            onSaved: (input) => hos=input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 35, right: 35),
                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Please enter the City';
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
                                labelText: 'City',
                                labelStyle: TextStyle(
                                  color: Colors.black26,
                                  fontFamily: 'Poppins',
                                )
                            ),
                            onSaved: (input) => city=input,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20, left: 35, right: 35),
                          child: TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Please enter the State, Country';
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
                                labelText: 'State, Country',
                                labelStyle: TextStyle(
                                  color: Colors.black26,
                                  fontFamily: 'Poppins',
                                )
                            ),
                            onSaved: (input) => state=input,
                          ),
                        ),
                        SizedBox(height: 35,),
                        Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Icon(Octicons.primitive_dot,color: Color(0xff062545),size: 10,),
                                ),
                                SizedBox(width: 5),
                                Container(
                                  width: 25,
                                  height: 3,
                                  child: Text("-"),
                                  color: Color(0xff062545),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: MaterialButton(
                            onPressed: save,
                            child: Text('Save',
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
  void save() async{
    final formState = _formKey.currentState;
    if(formState.validate()) {
      formState.save();
      Firestore.instance.collection("Data").document("Details").updateData(
          {'Title':tit,
            'State':state,
            'Experience':exp,
            'City':city,
            'Designation':des,
            'Hospital':hos,
            'Name':nam,
            'DOB':dob,
            'Gender':gen,
            'Mobile':mob
          });
      Firestore.instance.collection("Data").document("Details").get().then((value){
        setState(() {
          name=value.data["Name"];
          exp=value.data["Experience"];
          desg=value.data["Designation"];
          loc=value.data["City"];
          hos=value.data["Hospital"];
        });
      });
      Navigator.of(context).pushNamed('/main');
    }
  }
}