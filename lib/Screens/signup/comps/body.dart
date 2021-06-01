import 'package:flutter/material.dart';
import 'package:snappfood/Screens/login/comps/back.dart';
import 'package:snappfood/Screens/login/loginsc.dart';
import 'package:snappfood/cursorchanger/alreadysignedupcheck.dart';
import 'package:snappfood/cursorchanger/button.dart';
import 'package:snappfood/cursorchanger/phonenumberfield.dart';
import 'package:snappfood/cursorchanger/addressfield.dart';
import 'package:snappfood/cursorchanger/foodcatfield.dart';
import 'package:snappfood/cursorchanger/passfield.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/images/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Phone number",
              onChanged: (value) {},
            ),
             AddressInputField(
              hintText: "Your address",
              onChanged: (value) {},
            ),
            FoodCategoreyInputField(
              hintText: "food category",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
              ],
            )
        ),
    );
  }
}