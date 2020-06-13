import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackbr/utils/button.dart';

class ListItens extends StatefulWidget {

  final Map<String, dynamic> snapshot;

  ListItens({this.snapshot});

  @override
  _ListItensState createState() => _ListItensState();
}

class _ListItensState extends State<ListItens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Card(
        elevation: 10,
        color: Color.fromRGBO(33, 33, 33, 1),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  widget.snapshot['image'],
                  height: 120,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                            'Cashback: ',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 18
                            )
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 23,
                          width: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.green[700], Colors.green[400]]
                            ),
                            border: Border.all(
                                color: Colors.green.shade400,
                                width: 2.0
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0) //         <--- border radius here
                            ),

                          ),
                          child: Center(
                            child: Text(
                                '${widget.snapshot['cashback'].toStringAsFixed(0)} %',
                                style: TextStyle(color: Colors.white, fontSize: 16)
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        widget.snapshot['title'],
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('R\$ ${widget.snapshot['price'].toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        SizedBox(width: 75),
                        CustomButton.defaultButton(
                            heightButton: 30,
                            color: Colors.green.withOpacity(0.3),
                            borderSideColor: Colors.green,
                            widthBorder: 1,
                            borderRadius: 7,
                            elevation: 4,
                            text: "ADICIONAR",
                            fontSize: 12,
                            textColor: Colors.white,
                            disabledColor: Colors.white.withOpacity(0.6),
                            disabledTextColor: Colors.green,
                            onPress: (){
                              Navigator.of(context).pop();
                            }
                        )
                      ],
                    )
                  ],
                )
              ]
          ),
        ),
      ),
    );
  }
}
