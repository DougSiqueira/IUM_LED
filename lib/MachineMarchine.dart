import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:ium_led/sucess.dart';
import 'package:ium_led/Error.dart';

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
              Padding(
                padding: const EdgeInsets.all(20),
                child: ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: image == null
                        ? null
                        : () async {
                            Map<String, String> headers = new Map<String, String>();
                            headers["Content-type"] = "application/json";
                            headers["Accept"] = "aplication/json";
                            String body = '{"take":50, "skip":0}'; //jsonEncode({})
                            var resp = await http.post('https://httpbin.org/gett', body: body, headers: headers);
                            print("resp.statusCode:");
                            print(resp.statusCode);
                            print(resp.body);
                            if (resp.statusCode == 200) {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Sucess();
                              }));
                            } else {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Error();
                              }));
                            }
                          },
                    child:
                        Text("Enviar", style: TextStyle(color: Colors.white)),
                    color: Colors.blue,
                  ),
                ),
              )
            ])),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: getImage(ImageSource.camera),
      //   tooltip: 'Escolha a imagem',
      //   child: Icon(Icons.add_a_photo),
      // ),
    );
  }
}
