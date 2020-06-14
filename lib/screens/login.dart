import 'package:flutter/material.dart';
import 'package:hackbr/screens/home.dart';
import 'package:hackbr/utils/button.dart';
import 'package:hackbr/utils/textfild.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(45, 45, 45, 1),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50),
            Stack(
              children: <Widget>[
                Container(
                  width: 450,
                  height: 200,
                  color: Colors.white.withOpacity(0.15),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'lib/images/logo.png',
                    height: 200,
                    width: 300,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    CustomTextFild.defaultTextField(
                      hint: " E-mail",
                      colorBorder: Colors.white,
                      colorCursor: Colors.white,
                      colorHint: Colors.white,
                      colorIcon: Color.fromRGBO(143, 43, 10, 1),
                      colorText: Colors.white,
                      icon: Icons.email,
                      obscure: false,
                    ),
                    SizedBox(height: 10),
                    CustomTextFild.defaultTextField(
                      hint: " Senha",
                      colorBorder: Colors.white,
                      colorCursor: Colors.white,
                      colorHint: Colors.white,
                      colorIcon: Color.fromRGBO(143, 43, 10, 1),
                      colorText: Colors.white,
                      icon: Icons.lock_outline,
                      obscure: true,
                    ),
                    SizedBox(height: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        CustomButton.defaultButton(
                            heightButton: 45,
                            widthButton: 140,
                            color: Color.fromRGBO(143, 43, 10, 1).withOpacity(0.5),
                            borderSideColor: Color.fromRGBO(143, 43, 10, 1),
                            widthBorder: 1.5,
                            borderRadius: 7,
                            elevation: 4,
                            text: "CANCELAR",
                            fontSize: 15,
                            textColor: Colors.white,
                            disabledColor: Colors.white.withOpacity(0.6),
                            disabledTextColor: Colors.green,
                            onPress: (){
                              Navigator.of(context).pop();
                            }
                        ),
                        CustomButton.defaultButton(
                            heightButton: 45,
                            widthButton: 140,
                            color: Colors.green.withOpacity(0.3),
                            borderSideColor: Colors.green.shade400,
                            widthBorder: 1.5,
                            borderRadius: 7,
                            elevation: 4,
                            text: "ENTRAR",
                            fontSize: 15,
                            textColor: Colors.white,
                            disabledColor: Colors.white.withOpacity(0.6),
                            disabledTextColor: Colors.green,
                            onPress: (){
                              Navigator.of(context).pop();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context)=> Home()));
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
