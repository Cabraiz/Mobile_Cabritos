import 'package:page_transition/page_transition.dart';

import 'conexao.dart';

import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';

import 'package:postgres/postgres.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(alignment: Alignment.center, children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFF020202), Color(0xFF3e3e3e)])),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.width / 2, left: 50, right: 50),
          width: double.infinity,
          height: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0.1, blurRadius: 5)
              ]),
          child: Column(
            children: [
              TextField(
                  decoration: InputDecoration(
                      hintText: "Login",
                      prefixIcon: Icon(Icons.login),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              SizedBox(
                height: 10,
              ),
              TextField(
                  obscureText: hide,
                  decoration: InputDecoration(
                      hintText: "Senha",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hide = !hide;
                          });
                        },
                        icon: hide
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Esqueceu-se?"),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  call();
                },
                child: Ink(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Color(0xFF020202), Color(0xFF3e3e3e)]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 9, left: 10, right: 10, bottom: 10),
                    constraints: BoxConstraints(minWidth: 88.0),
                    child: Text("ENTRAR",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: <Color>[
                                  Color(0xFF996c35),
                                  Color(0xFFcbb272),
                                  Color(0xFFf1e69f),
                                  Color(0xFFcbb272),
                                  Color(0xFF996c35)
                                ],
                              ).createShader(Rect.fromLTWH(125, 0, 120, 100)))),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Curioso? Clique Aqui: "),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300),
                                child: RegisterScreen()));
                      },
                      child: Text("Registrar"))
                ],
              )
            ],
          ),
        ),
        Positioned(
            top: 40,
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                Text("SUBORDINADOS",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 33.0,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: <Color>[
                              Color(0xFF996c35),
                              Color(0xFFcbb272),
                              Color(0xFFf1e69f),
                              Color(0xFFcbb272),
                              Color(0xFF996c35)
                            ],
                          ).createShader(Rect.fromLTWH(50, 0, 280, 100)))),
                Text(
                  "S S & S M",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      letterSpacing: 1.5,
                      fontFamily: 'Paneuropa',
                      fontSize: 24.0,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: <Color>[
                            Color(0xFF996c35),
                            Color(0xFFcbb272),
                            Color(0xFFf1e69f),
                            Color(0xFFcbb272),
                            Color(0xFF996c35)
                          ],
                        ).createShader(Rect.fromLTWH(110, 0, 140, 100))),
                ),
              ],
            ))
      ]),
    );
  }
}

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(alignment: Alignment.center, children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFF020202), Color(0xFF3e3e3e)])),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.width / 2, left: 50, right: 50),
          width: double.infinity,
          height: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0.1, blurRadius: 5)
              ]),
          child: Column(
            children: [
              TextField(
                  decoration: InputDecoration(
                      hintText: "Login",
                      prefixIcon: Icon(Icons.login),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              SizedBox(
                height: 10,
              ),
              TextField(
                  obscureText: hide,
                  decoration: InputDecoration(
                      hintText: "Confirmar Senha",
                      hintStyle: TextStyle(fontSize: 13),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hide = !hide;
                          });
                        },
                        icon: hide
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              SizedBox(
                height: 10,
              ),
              TextField(
                  obscureText: hide,
                  decoration: InputDecoration(
                      hintText: "Senha",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hide = !hide;
                          });
                        },
                        icon: hide
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)))),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: null,
                child: Ink(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Color(0xFF020202), Color(0xFF3e3e3e)]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 9, left: 10, right: 10, bottom: 10),
                    constraints: BoxConstraints(minWidth: 88.0),
                    child: Text("REGISTRAR",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: <Color>[
                                  Color(0xFF996c35),
                                  Color(0xFFcbb272),
                                  Color(0xFFf1e69f),
                                  Color(0xFFcbb272),
                                  Color(0xFF996c35)
                                ],
                              ).createShader(Rect.fromLTWH(125, 0, 120, 100)))),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Já tenho uma conta"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 300),
                                child: LoginScreen()));
                      },
                      child: Text("Entrar"))
                ],
              )
            ],
          ),
        ),
        Positioned(
            top: 40,
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                Text("SUBORDINADOS",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 33.0,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: <Color>[
                              Color(0xFF996c35),
                              Color(0xFFcbb272),
                              Color(0xFFf1e69f),
                              Color(0xFFcbb272),
                              Color(0xFF996c35)
                            ],
                          ).createShader(Rect.fromLTWH(50, 0, 280, 100)))),
                Text(
                  "S S & S M",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      letterSpacing: 1.5,
                      fontFamily: 'Paneuropa',
                      fontSize: 24.0,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: <Color>[
                            Color(0xFF996c35),
                            Color(0xFFcbb272),
                            Color(0xFFf1e69f),
                            Color(0xFFcbb272),
                            Color(0xFF996c35)
                          ],
                        ).createShader(Rect.fromLTWH(110, 0, 140, 100))),
                ),
              ],
            ))
      ]),
    );
  }
}
