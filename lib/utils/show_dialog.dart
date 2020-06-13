import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackbr/timer/food_timer.dart';
import 'package:hackbr/timer/pause_timer.dart';
import 'package:hackbr/timer/sleep_timer.dart';
import 'package:hackbr/timer/timer_service.dart';
import 'package:hackbr/utils/button.dart';
import 'package:provider/provider.dart';

class Showdialog extends StatelessWidget {
  final Function encerra;

  const Showdialog({this.encerra});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Card(
            color: Color.fromRGBO(60, 60, 60, 1),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
              ),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.28,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30),
                  Center(
                      child: Text(
                          'Encerrar viagem',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          )
                      )
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                        'Deseja realmente encerrar a viagem?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        )
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CustomButton.defaultButton(
                          heightButton: 45,
                          color: Colors.redAccent.withOpacity(0.3),
                          borderSideColor: Colors.red,
                          widthBorder: 1,
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
                          color: Colors.green.withOpacity(0.3),
                          borderSideColor: Colors.green.shade400,
                          widthBorder: 1,
                          borderRadius: 7,
                          elevation: 4,
                          text: "ENCERRAR",
                          fontSize: 15,
                          textColor: Colors.white,
                          disabledColor: Colors.white.withOpacity(0.6),
                          disabledTextColor: Colors.green,
                          onPress: (){
                            encerra();
                            Navigator.of(context).pop();
                          }
                      ),
                    ],
                  )

//                  Container(
//                    padding: EdgeInsets.only(right: 10, left: 10),
//                    child: Row(
//                      children: <Widget>[
//                        Icon(
//                            FontAwesomeIcons.tachometerAlt,
//                            color: Colors.white,
//                          size: 20,
//                        ),
//                        SizedBox(width: 10),
//                        Text(
//                            'Km percorridos: ',
//                            style: TextStyle(fontSize: 18, color: Colors.white)
//                        ),
//                        SizedBox(width: 10),
//                        Container(
//                          width: 42,
//                          padding: EdgeInsets.only(bottom: 25),
//                          child: TextField(
//                            style: TextStyle(color: Colors.white),
//                            inputFormatters: [
//                              WhitelistingTextInputFormatter.digitsOnly,
//                              LengthLimitingTextInputFormatter(4)
//                            ],
//                            decoration: InputDecoration(
//                              contentPadding: EdgeInsets.only(top: 25),
//                              focusedBorder: UnderlineInputBorder(
//                                borderSide: BorderSide(color: Colors.white)
//                              )
//                            ),
//                          ),
//                        ),
//                        SizedBox(width: 5),
//                        Text(
//                            'Km',
//                            style: TextStyle(fontSize: 18, color: Colors.white)
//                        ),
//                      ],
//                    ),
//                  ),
//                  Container(
//                    padding: EdgeInsets.only(right: 10, left: 10),
//                    child: Row(
//                      children: <Widget>[
//                        Icon(
//                          FontAwesomeIcons.mapMarked,
//                          color: Colors.white,
//                          size: 20,
//                        ),
//                        SizedBox(width: 10),
//                        Text(
//                            'Cidade de partida: ',
//                            style: TextStyle(fontSize: 18, color: Colors.white)
//                        ),
//                      ],
//                    ),
//                  ),
//                  Container(
//                    width: MediaQuery.of(context).size.width,
//                    alignment: Alignment.centerLeft,
//                    padding: EdgeInsets.only(bottom: 25, left: 10, right: 10, top: 10),
//                    child: TextField(
//                      style: TextStyle(color: Colors.white),
//                      decoration: InputDecoration(
//                          border: OutlineInputBorder(
//                              borderSide: BorderSide(color: Colors.white.withOpacity(0.8))
//                          ),
//                          focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color: Colors.white)
//                          )
//                      ),
//                    ),
//                  ),
//                  Container(
//                    padding: EdgeInsets.only(right: 10, left: 10),
//                    child: Row(
//                      children: <Widget>[
//                        Icon(
//                          FontAwesomeIcons.mapMarkedAlt,
//                          color: Colors.white,
//                          size: 20,
//                        ),
//                        SizedBox(width: 10),
//                        Text(
//                            'Cidade de destino: ',
//                            style: TextStyle(fontSize: 18, color: Colors.white)
//                        )
//                      ],
//                    ),
//                  ),
//                  Container(
//                    width: MediaQuery.of(context).size.width,
//                    alignment: Alignment.centerLeft,
//                    padding: EdgeInsets.only( left: 10, right: 10, top: 10),
//                    child: TextField(
//                      style: TextStyle(color: Colors.white),
//                      decoration: InputDecoration(
//                          border: OutlineInputBorder(
//                              borderSide: BorderSide(color: Colors.white.withOpacity(0.8))
//                          ),
//                          focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color: Colors.white)
//                          )
//                      ),
//                    ),
//                  ),
//                  Container(
//                    padding: EdgeInsets.only(right: 10, left: 10),
//                    child: Row(
//                      children: <Widget>[
//                        Icon(
//                          FontAwesomeIcons.truckLoading,
//                          color: Colors.white,
//                          size: 20,
//                        ),
//                        SizedBox(width: 10),
//                        Text(
//                            'Peso em Kg: ',
//                            style: TextStyle(fontSize: 18, color: Colors.white)
//                        ),
//                        SizedBox(width: 10),
//                        Container(
//                          width: 60,
//                          padding: EdgeInsets.only(bottom: 25),
//                          child: TextField(
//                            style: TextStyle(color: Colors.white),
//                            inputFormatters: [
//                              WhitelistingTextInputFormatter.digitsOnly,
//                              LengthLimitingTextInputFormatter(6)
//                            ],
//                            decoration: InputDecoration(
//                                contentPadding: EdgeInsets.only(top: 25),
//                                focusedBorder: UnderlineInputBorder(
//                                    borderSide: BorderSide(color: Colors.white)
//                                )
//                            ),
//                          ),
//                        ),
//                        SizedBox(width: 5),
//                        Text(
//                            'Kg',
//                            style: TextStyle(fontSize: 18, color: Colors.white)
//                        ),
//                      ],
//                    ),
//                  ),

                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
