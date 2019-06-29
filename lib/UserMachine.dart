import 'package:flutter/material.dart';
import 'package:ium_led/sucess.dart';
import 'package:ium_led/Error.dart';
import 'package:http/http.dart' as http;

bool postErro = false;

class emoticon {
  static String expression = 'feliz';
  static String urlPost = "http://localhost:5000/stream/output";

  static void printString() {
    print(expression);
  }
}

class UserMachine extends StatefulWidget {
  @override
  _UserMachineState createState() => _UserMachineState();
}

class _UserMachineState extends State<UserMachine> {
  String selectedEmoticon = 'assets/emoticon/feliz.png';
  //static String emoticonExpression = "feliz";

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
                          emoticon.expression = "feliz";
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
                          emoticon.expression = "surpreso";
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
                          emoticon.expression = "raiva";
                          onEmoticonSelect('assets/emoticon/raiva.png');
                        },
                        child: Image.asset(
                          'assets/emoticon/raiva.png',
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
                          emoticon.expression = "nojo";
                          onEmoticonSelect('assets/emoticon/nojo.png');
                        },
                        child: Image.asset(
                          'assets/emoticon/nojo.png',
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
                          emoticon.expression = "medo";
                          onEmoticonSelect('assets/emoticon/medo.png');
                        },
                        child: Image.asset(
                          'assets/emoticon/medo.png',
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
                        emoticon.expression = "triste";
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
                        emoticon.expression = "neutro";
                        onEmoticonSelect('assets/emoticon/neutro.png');
                      },
                      child: Image.asset(
                        'assets/emoticon/neutro.png',
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //   child: CircleAvatar(
                //     backgroundColor: Colors.white,
                //     child: GestureDetector(
                //       onTap: () {
                //         onEmoticonSelect('assets/emoticon/beijo.png');
                //       },
                //       child: Image.asset(
                //         'assets/emoticon/beijo.png',
                //       ),
                //     ),
                //   ),
                // ),
              ]),
          postErro
              ? TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: emoticon.urlPost, //'Please enter a search term',
                  ),
                  onChanged: (String str) {
                    emoticon.urlPost = str;
                    postErro = false;
                  },
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: ButtonTheme(
              minWidth: MediaQuery.of(context).size.width,
              height: 60.0,
              child: RaisedButton(
                //   _uploadEmoicon
                onPressed: () async {
                  print(emoticon.expression);
                  print(emoticon.urlPost);
                  Map<String, String> headers = new Map<String, String>();
                  headers["Content-type"] = "application/json";
                  String body = emoticon.expression;
                  await http
                      .post(emoticon.urlPost, body: body, headers: headers)
                      .then((res) {
                    postErro = false;
                    print(res.statusCode);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Sucess();
                    }));
                  }).catchError((err) {
                    postErro = true;
                    print("erro");
                    print(err);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Error();
                    }));
                  });
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
