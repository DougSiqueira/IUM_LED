import 'package:flutter/material.dart';

class SucessState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Sucess extends StatefulWidget {
  @override
  _SucessState createState() => _SucessState();
}

class _SucessState extends State<Sucess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green[300],
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              Container(
                  alignment: Alignment.centerLeft,
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },

                      child: Icon(
                        Icons.close, color: Colors.grey[200],
                        size: 45, 
                      ),
                    ),
                  )),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 5),
                  child: Container(
                    height: 180,
                    width: 180,
                    alignment: Alignment.center,
                    child: Material(
                      color: Colors.white,
                      elevation: 7,
                      borderRadius: BorderRadius.circular(100),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.check_circle,
                              size: 180,
                              color: Colors.green,
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Enviado!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        //fontWeight: FontWeight.bold,
                        fontSize: 40),
                  )),
            ]),
      ),
    );
  }
}
