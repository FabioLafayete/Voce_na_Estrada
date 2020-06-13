import 'package:flutter/material.dart';
import 'package:hackbr/utils/list_itens.dart';

class Store extends StatefulWidget {
  final Map<String, dynamic> snapshot;

  Store({this.snapshot});

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(51, 51, 51, 1),
      appBar: AppBar(
        title: Text(widget.snapshot['title']),
        backgroundColor: Color.fromRGBO(36, 36, 36, 1),
      ),
      body: ListView.builder(
        itemCount: widget.snapshot['itens'].length,
        shrinkWrap: true,
        itemBuilder: (context, index){
          return ListItens(snapshot: widget.snapshot['itens'][index]);
        },
      ),
    );
  }
}
