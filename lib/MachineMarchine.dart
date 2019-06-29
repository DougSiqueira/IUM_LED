import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ium_led/sucess.dart';
import 'package:ium_led/Error.dart';

bool erroPost = false;
String urlPost = "http://localhost:5000/stream/output";

class MachineMachine extends StatefulWidget {
  @override
  _MachineMachineState createState() => _MachineMachineState();
}

class _MachineMachineState extends State<MachineMachine> {
  File image;
  Future getImage(ImageSource source) async {
    File picture = await ImagePicker.pickImage(
        source: source,
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height);
    setState(() {
      image = picture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Center(
            child: Column(
                //mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: image == null
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        child: Icon(Icons.filter,
                            size: 200,
                            color: Colors
                                .white), //child: Text('Envie uma imagem...', style: TextStyle(fontSize: 20),)
                        color: Colors.black,
                      )
                    : Container(
                        color: Colors.black,
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        child: Image.file(image)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.camera),
                          const Text("câmera", style: TextStyle(fontSize: 20)),
                        ]),
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.filter),
                        Text(
                          "Fotos",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                  )
                ],
              ),
              erroPost
                  ? TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: urlPost, //'Please enter a search term',
                      ),
                      onChanged: (String str) {
                        urlPost = str;
                        erroPost = false;
                      },
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: image != null? 
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: _uploadImage,
                    child:
                        Text("Enviar", style: TextStyle(color: Colors.white)),
                    color: Colors.blue,
                  ),
                ):
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 60.0,
                  child: RaisedButton(
                    color: Colors.black,
                    //onPressed: _uploadImage,
                    child:
                        Text("Escolha uma imagem!", style: TextStyle(color: Colors.white)),
                    //color: Colors.blue,
                  ),
                ),
              )
            ])),
      ),
    );
  }

  void _uploadImage() async {
    String base64Image = base64Encode(image.readAsBytesSync());
    //String fileName = image.path.split("/").last;
    String imageJson = jsonEncode(base64Image);
    Map<String, String> headers = new Map<String, String>();
    headers["Content-type"] = "application/json";
    String body = imageJson;
    await http.post(urlPost, body: body, headers: headers).then((res) {
      erroPost = false;
      print(res.statusCode);
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Sucess();
      }));
    }).catchError((err) {
      erroPost = true;
      print("erro");
      print(err);
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Error();
      }));
    });
  }
}
