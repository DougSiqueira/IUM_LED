import 'package:flutter/material.dart';
import 'package:ium_led/homePage.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//pegar texto digitado

  final user = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    // limpa o controlador de texto quando recarregar o widget
    user.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        //backgroundColor: Colors.indigo,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/background9.png"),
            //image: AssetImage("assets/background0.jpg"),
            //image: new AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: user,
                      autofocus: true,
                      //keyboardType: TextInputType.number,
                      keyboardType: TextInputType.text,
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                          //labelText: "CPF",
                          labelText: "Usuário",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    Divider(),
                    TextFormField(
                      controller: password,
                      autofocus: true,
                      obscureText: true, //esconder senha
                      keyboardType: TextInputType.text,
                      style: new TextStyle(color: Colors.white, fontSize: 20),
                      decoration: InputDecoration(
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.white)),
                    ),
                    Divider(),
                    ButtonTheme(
                      height: 60.0,
                      child: RaisedButton(
                        onPressed: () {
                          if (user.text == "tien" && password.text == "tien") {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return HomePage();
                            }));
                          } else {
                            // noficação login incorreto
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Informação"),
                                  content: Text("Usuário ou senha incorreto"),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Ok"),
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: Text("Entrar",
                            style: TextStyle(color: Colors.blue)),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

/*
         return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            // Recupera el texto que el usuario ha digitado utilizando nuestro
                            // TextEditingController
                            content: Text(myController.text),
                          );
                        },
                      );

                      */
