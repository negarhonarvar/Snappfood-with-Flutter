import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:snappfood/Screens/home/homepage.dart';
import 'package:snappfood/Screens/login/comps/back.dart';
import 'package:snappfood/Screens/signup/signupsc.dart';
import 'package:snappfood/cursorchanger/alreadysignedupcheck.dart';
import 'package:snappfood/cursorchanger/button.dart';
import 'package:snappfood/cursorchanger/phonenumberfield.dart';
import 'package:snappfood/cursorchanger/passfield.dart';
import 'package:snappfood/MainPanel.dart';

class Body extends StatelessWidget {
  final String title;
  final Socket channel;

  Body({Key key, @required this.title, @required this.channel})
      : super(key: key);
 /* const Body({
    Key key,
  }) : super(key: key);*/
  String _name;
  String _pass;
  /*final Socket channel;*/
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    String show = "";
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            /*SvgPicture.asset(
              "assets/images/signup_top.png",
              height: size.height * 0.35,
            ),*/
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your phone number",
              onChanged: (value) {
                _name=value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _pass=value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainPanel();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  void _sendMessage(context) async {
    if (_name.isNotEmpty && _pass.isNotEmpty) {
      await Socket.connect('192.168.109.183', 8080)
          .then((serverSocket) {
        print('connected');
        serverSocket.writeln("login");
        serverSocket.writeln("A"); //username
        serverSocket.writeln("99243064"); //password
        serverSocket.listen((socket) {
          String response = String.fromCharCodes(socket).trim();
          print("response is " + response);
          if(response=="true"){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
          }
          else{

          }
          /*  show = String.fromCharCodes(socket).trim();
          print(show);
          setState(() {

          });*/
        });
      });
    }
    @override
    void dispose() {

      channel.close();
      /*super.dispose();*/
    }
  }

}
