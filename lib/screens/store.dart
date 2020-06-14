import 'package:flutter/material.dart';
import 'package:hackbr/screens/cart_screen.dart';
import 'package:hackbr/utils/button.dart';
import 'package:hackbr/utils/list_itens.dart';

class Store extends StatefulWidget {
  final Map<String, dynamic> snapshot;

  Store({this.snapshot});

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {

  double cash;
  List<Map<String, dynamic>> list;

  @override
  void initState() {
    super.initState();
    cash = 0.0;
    list = [];
    widget.snapshot['itens'].forEach((i){
      if(i['is_buy'] == true){
        setState(() {
          cash += i['price'];
          list.add(i);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      appBar: AppBar(
        title: Text(widget.snapshot['title']),
        backgroundColor: Color.fromRGBO(36, 36, 36, 1),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: widget.snapshot['itens'].length,
              shrinkWrap: true,
              itemBuilder: (context, index){
                return ListItens(
                    snapshot: widget.snapshot['itens'][index],
                    add: (add){
                      setState(() {
                        cash += add['price'];
                        list.add(add);
                      });
                    },
                    rm: (rm){
                      setState(() {
                        cash -= rm['price'];
                        list.removeWhere((i){
                          if(i['id'] == rm['id']){
                            return i['id'] == rm['id'];
                          } else {
                            return false;
                          }
                        });
                      });
                    },
                    );
              },
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 60,
            padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            child: CustomButton.defaultButton(
                color: Colors.green.withOpacity(0.3),
                borderSideColor: Colors.green,
                widthBorder: 1,
                borderRadius: 7,
                elevation: 4,
                fontSize: 10,
                textColor: Colors.white,
                disabledColor: Colors.white.withOpacity(0.6),
                disabledTextColor: Colors.green,
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.shopping_cart, color: Colors.white),
                    SizedBox(width: 20),
                    Text('VER CARRINHO'),
                    Container(
                        width: 80,
                        padding: EdgeInsets.only(left: 10),
                        child: Text('R\$ ${cash.toStringAsFixed(2)}')
                    )
                  ],
                ),
                onPress: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CartScreen(
                          list: list,
                          rm: (rm){
                            setState(() {
                              widget.snapshot['itens'].where((i){
                                if(i['id'] == rm['id']){
                                  return i['id'] == rm['id'];
                                } else {
                                  return false;
                                }
                              });
                              cash -= rm['price'];
                            });
                          }
                          )
                  )
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
