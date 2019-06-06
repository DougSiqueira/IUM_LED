import 'package:flutter/material.dart';
import 'package:ium_led/sucess.dart';
import 'package:http/http.dart' as http;

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String selectedEmoticon = 'assets/emoticon/feliz.png';
  String urlPost = 'https://httpbin.org/post';

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
                FlatButton(
                  child: Text("Get"),
                  onPressed: () async {
                    Map<String, String> headers = new Map<String, String>();
                    headers["Content-type"] = "application/json";
                    headers["Accept"] = "aplication/json";

                    var resp = await http.get('https://httpbin.org/get',
                        headers: headers);
                    print("resp.statusCode::::::::::::::::::::");
                    print(resp.statusCode);
                    print(resp.body);
                  },
                ),
                FlatButton(
                  child: Text("Post"),
                  onPressed: () async {
                    Map<String, String> headers = new Map<String, String>();
                    headers["Content-type"] = "application/json";
                    headers["Accept"] = "aplication/json";
                    String str = '{"take":50, "skip":0}';
                    var resp = await http.post(
                        urlPost,
                        //'https://httpbin.org/post',
                        //'http://1992.168.0.11:5000/api/mob/GerMob/GetEsquemas',
                        body: str,
                        headers: headers);
                    print("resp.statusCode::::::::::::::::::::");
                    print(resp.statusCode);
                    print(resp.body);
                  },
                ),
                Container(
                  color: Colors.blue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class EmoticonPicker extends StatelessWidget {
//   const EmoticonPicker({this.onEmoticonSelect});

//   final EmoticonCallback onEmoticonSelect;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding:
//                 const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 8),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   // RaisedButton(

//                   Expanded(
//                     flex: 1,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: GestureDetector(
//                         onTap: () {
//                           onEmoticonSelect('assets/emoticon/feliz.png');
//                         },
//                         child: Image.asset(
//                           'assets/emoticon/feliz.png',
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: GestureDetector(
//                         onTap: () {
//                           onEmoticonSelect('assets/emoticon/surpreso.png');
//                         },
//                         child: Image.asset(
//                           'assets/emoticon/surpreso.png',
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: GestureDetector(
//                         onTap: () {
//                           onEmoticonSelect('assets/emoticon/inrritado.png');
//                         },
//                         child: Image.asset(
//                           'assets/emoticon/inrritado.png',
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: GestureDetector(
//                         onTap: () {
//                           onEmoticonSelect('assets/emoticon/sono.png');
//                         },
//                         child: Image.asset(
//                           'assets/emoticon/sono.png',
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 1,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: GestureDetector(
//                         onTap: () {
//                           onEmoticonSelect('assets/emoticon/mal.png');
//                         },
//                         child: Image.asset(
//                           'assets/emoticon/mal.png',
//                         ),
//                       ),
//                     ),
//                   ),
//                 ]),
//           ),
//           Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Expanded(
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: GestureDetector(
//                       onTap: () {
//                         onEmoticonSelect('assets/emoticon/piscando.png');
//                       },
//                       child: Image.asset(
//                         'assets/emoticon/piscando.png',
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: GestureDetector(
//                       onTap: () {
//                         onEmoticonSelect('assets/emoticon/triste.png');
//                       },
//                       child: Image.asset(
//                         'assets/emoticon/triste.png',
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: GestureDetector(
//                       onTap: () {
//                         onEmoticonSelect('assets/emoticon/beijo.png');
//                       },
//                       child: Image.asset(
//                         'assets/emoticon/beijo.png',
//                       ),
//                     ),
//                   ),
//                 ),
//               ]),
//           Padding(
//             padding: const EdgeInsets.only(top: 80),
//             child: ButtonTheme(
//               minWidth: MediaQuery.of(context).size.width,
//               height: 60.0,
//               child: RaisedButton(
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (BuildContext context) {
//                     return Sucess();
//                   }));
//                 },
//                 child: Text("Enviar", style: TextStyle(color: Colors.white)),
//                 color: Colors.blue,
//               ),
//             ),
//           ),
//         ]);
//   }
// }

// typedef EmoticonCallback = void Function(String image);
