import 'package:flutter/material.dart';
import 'package:hackbr/screens/order_done.dart';
import 'package:hackbr/utils/button.dart';
import 'package:hackbr/utils/list_itens_cart.dart';

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> list;
  final Function rm;

  const CartScreen({this.list, this.rm});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  TextStyle textStyle = TextStyle(color: Colors.white);
  double cashback = 0.0;
  double price = 0.0;

  @override
  void initState() {
    super.initState();
    setState(() {
      cashback = getCashback();
      price = getTotal();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      appBar: AppBar(
        title: Text('Meu Carrinho'),
        backgroundColor: Color.fromRGBO(36, 36, 36, 1),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 15.0),
            child: Text('${widget.list.length} ${widget.list.length == 1 ? 'Item' : 'Itens'}',
                style: TextStyle(fontSize: 17, color: Colors.white)
            )
          )
        ],
      ),
      body: widget.list.length > 0 ? ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListView.builder(
              itemCount: widget.list.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return ListItemCart(
                    snapshot: widget.list[index],
                  rm: (rm){
                      setState(() {
                        widget.list.removeWhere((i){
                          if(i['id'] == rm['id']){
                            return i['id'] == rm['id'];
                          } else {
                            return false;
                          }
                        });
                        widget.rm(rm);
                        cashback = getCashback();
                        price = getTotal();
                      });
                  },
                  update: (update) {
                      setState(() {
                        widget.list.where((i){
                          if(i['id'] == update['id']){
                            return i['id'] == update['id'];
                          } else {
                            return false;
                          }
                        });
                        cashback = getCashback();
                        price = getTotal();
                      });
                  },
                );
              }
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Card(
                elevation: 10,
                color: Color.fromRGBO(33, 33, 33, 1),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Resumo do Pedido",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Expande o conteúdo
                        children: <Widget>[
                          Text("Cashback", style: textStyle),
                          Text("R\$ ${cashback.toStringAsFixed(2)}", style: textStyle),
                        ],
                      ),
                      Divider(color: Colors.white),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Expande o conteúdo
                        children: <Widget>[
                          Text("Total a pagar",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              )
                          ),
                          Text("R\$ ${price.toStringAsFixed(2)}", style: textStyle),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomButton.defaultButton(
                          heightButton: 45,
                          widthButton: MediaQuery.of(context).size.width * 0.9,
                          color: Colors.green.withOpacity(0.3),
                          borderSideColor: Colors.green,
                          widthBorder: 1,
                          borderRadius: 7,
                          elevation: 4,
                          text: 'FINALIZAR COMPRA',
                          fontSize: 17,
                          textColor: Colors.white,
                          disabledColor: Colors.white.withOpacity(0.6),
                          disabledTextColor: Colors.green,
                          onPress: (){
                            widget.list.forEach((i) {
                              i['is_buy'] = false;
                            });
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OrderDone()));
                          }
                      )
                    ],
                  ),
                ),
              )
          ),
        ],
      ) : Center(
        child: Text(
          "Nenhum produto no carrinho! 😕",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
          textAlign: TextAlign.center,
        ),
      )
    );
  }

  double getCashback (){
    double result = 0.0;

    widget.list.forEach((i){
      double price = i['price'];
      double cash = i['cashback'];
      int count = i['count'];

      result += ((price * count) * cash) / 100;
    });

    return result;
  }

  double getTotal (){
    double result = 0.0;

    widget.list.forEach((i){
      double price = i['price'];
      double cash = i['cashback'];
      int count = i['count'];

      result += (price * count);
    });

    return result;
  }


}
