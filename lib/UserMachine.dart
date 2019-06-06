import 'package:flutter/material.dart';
import 'package:ium_led/sucess.dart';
import 'package:ium_led/Error.dart';
import 'package:http/http.dart' as http;

class UserMachine extends StatefulWidget {
  @override
  _UserMachineState createState() => _UserMachineState();
}

class _UserMachineState extends State<UserMachine> {
  String selectedEmoticon = 'assets/emoticon/feliz.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: new EdgeInsets.all(4.0),
                  child: new Image.asset(
                    selectedEmoticon,
                    fit: BoxFit.fill,
                    height: 150,
                    width: 150,
                  ),
                ),
                EmoticonPicker(
                  onEmoticonSelect: (String image) {
                    setState(() {
                      selectedEmoticon = image;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmoticonPicker extends StatelessWidget {
  const EmoticonPicker({this.onEmoticonSelect});

  final EmoticonCallback onEmoticonSelect;

  @override
  Widget build(BuildContext context) {
   // String urlPost = 'https://httpbin.org/post';
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // RaisedButton(

                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          onEmoticonSelect('assets/emoticon/feliz.png');
                        },
                        child: Image.asset(
                          'assets/emoticon/feliz.png',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          onEmoticonSelect('assets/emoticon/surpreso.png');
                        },
                        child: Image.asset(
                          'assets/emoticon/surpreso.png',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          onEmoticonSelect('assets/emoticon/inrritado.png');
                        },
                        child: Image.asset(
                          'assets/emoticon/inrritado.png',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          onEmoticonSelect('assets/emoticon/sono.png');
                        },
                        child: Image.asset(
                          'assets/emoticon/sono.png',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          onEmoticonSelect('assets/emoticon/mal.png');
                        },
                        child: Image.asset(
                          'assets/emoticon/mal.png',
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        onEmoticonSelect('assets/emoticon/piscando.png');
                      },
                      child: Image.asset(
                        'assets/emoticon/piscando.png',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        onEmoticonSelect('assets/emoticon/triste.png');
                      },
                      child: Image.asset(
                        'assets/emoticon/triste.png',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        onEmoticonSelect('assets/emoticon/beijo.png');
                      },
                      child: Image.asset(
                        'assets/emoticon/beijo.png',
                      ),
                    ),
                  ),
                ),
              ]),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              height: 60.0,
              child: RaisedButton(
                onPressed: () async {
                  Map<String, String> header = new Map<String, String>();
                  header["Content-type"] = "application/json";
                  header["Accept"] = "aplication/json";
                  String body = '{"take":50, "skip":0}';
                  var resp = await http.post('https://httpbin.org/get', body: body, headers: header);
                  //print("resp.statusCode:");
                  print(resp.statusCode);
                  //print(resp.body);
                  if (resp.statusCode == 200) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Sucess();
                    }));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Error();
                    }));
                  }
                },
                child: Text("Enviar", style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              ),
            ),
          ),
        ]);
  }
}

typedef EmoticonCallback = void Function(String image);
