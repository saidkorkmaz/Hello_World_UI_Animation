import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_test/styles/colors.dart';
import 'package:ui_test/widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double _height;
  double _width;
  double _logoOpacity = 0.0;
  double _logoBgSize = 0.0;
  double _textFieldOpacity = 0.0;
  double _loginButtonOpacity = 0.0;
  double _loginButtonWidth = 300;
  Widget _loginButtonChild = Text(
    "Login",
    style: TextStyle(
        color: colorLightTint, fontSize: 25, fontFamily: "Lexend-L"),
  );
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2200),(){
      setState(() {
        _textFieldOpacity = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 2700),(){
      setState(() {
        _loginButtonOpacity = 1.0;
      });
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _logoBgSize = 100;
      });
    });
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        _logoOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: colorLight,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg_blur.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: _width * .125),
              child: Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Container(
                  height: double.infinity,
                  width: 12,
                  color: colorPrimary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _width * .125, vertical: _height * .125),
              child: Container(
                // Shadow
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                    boxShadow: [
                      BoxShadow(
                          color: colorMedium.withOpacity(.1),
                          blurRadius: 20,
                          offset: Offset(0, 20))
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                  child: BackdropFilter(
                    // Cam efekti
                    filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                    child: Container(
                      // Content
                      width: _width * .75,
                      height: _height * .75,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: colorLightTint.withOpacity(.7)),
                        color: colorLightTint.withOpacity(.3),
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: Center(
                                        child: AnimatedContainer(
                                          duration: Duration(seconds: 1),
                                          curve: Curves.bounceOut,
                                          height: _logoBgSize,
                                          width: _logoBgSize,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            color: colorPrimary,
                                            boxShadow: [BoxShadow(color: colorMedium.withOpacity(.3), blurRadius: 10)]
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        height: 100,
                                        width: 100,
                                        child: AnimatedOpacity(
                                          duration: Duration(seconds: 2),
                                          opacity: _logoOpacity,
                                          child: Center(
                                              child: Image.asset(
                                            "assets/images/logo.png",
                                            height: 75,
                                          )),
                                        ))
                                  ],
                                ),
                              ),
                              AnimatedOpacity(
                                duration: Duration(milliseconds: 700),
                                opacity: _textFieldOpacity,
                                child: customTextField(
                                    icon: Icons.person_rounded,
                                    hint: "User Name",
                                    controller: userNameController),
                              ),
                              AnimatedOpacity(
                                duration: Duration(milliseconds: 700),
                                opacity: _textFieldOpacity,
                                child: customTextField(
                                    icon: Icons.vpn_key_rounded,
                                    hint: "Password",
                                    controller: userPasswordController),
                              ),
                              AnimatedOpacity(
                                  duration: Duration(milliseconds: 700),
                                  opacity: _loginButtonOpacity,
                                  child: animatedLogInButton()),
                              AnimatedOpacity(
                                  duration: Duration(milliseconds: 700),
                                  opacity: _loginButtonOpacity,
                                  child: signInMethodsWidget())
                            ],
                          ),
                          registerButton()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget animatedLogInButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: (){
          setState(() {
            _loginButtonWidth = 60;
            _loginButtonChild = CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(colorLightTint),);
            Future.delayed(Duration(seconds: 2),(){
              setState(() {
                _loginButtonWidth = 300;
                _loginButtonChild = Text(
                  "Login",
                  style: TextStyle(
                      color: colorLightTint, fontSize: 25, fontFamily: "Lexend-L"),
                );
              });

            });
          });

        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 60,
          width: _loginButtonWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: colorSecondary.withOpacity(.8),
          ),
          child: Container(
            child: Center(
                child: _loginButtonChild),
          ),
        ),
      ),
    );
  }

  Widget signInMethodsWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/images/google.png", height: 60),
          Container(
            height: 50,
            width: .5,
            color: colorMedium,
          ),
          Image.asset(
            "assets/images/face.png",
            height: 60,
          ),
        ],
      ),
    );
  }

  Widget registerButton(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        "Register",
        style: TextStyle(
            fontSize: 16,
            fontFamily: "Lexend-SB",
            color: colorMedium),
      ),
    );
  }
}
