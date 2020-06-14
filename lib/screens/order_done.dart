import 'dart:async';

import 'package:flutter/material.dart';

class OrderDone extends StatefulWidget {
  @override
  _OrderDoneState createState() => _OrderDoneState();
}

class _OrderDoneState extends State<OrderDone> {

  bool show = false;

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            (){
          setState(() {
            show = true;
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {

    TextStyle style = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 17
    );
    TextStyle style2 = TextStyle(
        color: Colors.white,
        fontSize: 17
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      appBar: AppBar(
        title: Text('Meu Carrinho'),
        backgroundColor: Color.fromRGBO(36, 36, 36, 1),
      ),
      body: show == true ? Center(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Icon(Icons.check, color: Colors.green, size: 50,),
              ),
              SizedBox(height: 20),
              Text('Ordem realizada com sucesso!', style: style2),
              SizedBox(height: 20),
              Text('Ordem: ', style: style2),
              SizedBox(height: 5),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '5f15216c03daf40f1384d0e4c90856aa',
                      style: style,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ) : Center(
        child: CircularProgressIndicator(backgroundColor: Colors.white),
      )
    );
  }
}
