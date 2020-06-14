import 'package:flutter/material.dart';

class ListItemCart extends StatefulWidget {

  final Map<String, dynamic> snapshot;
  final Function rm;
  final Function update;

  const ListItemCart({
    this.snapshot,
    this.rm,
    this.update
  });

  @override
  _ListItemCartState createState() => _ListItemCartState();
}

class _ListItemCartState extends State<ListItemCart> {

  int total;

  @override
  void initState() {
    super.initState();
    setState(() {
      total = widget.snapshot['count'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
                  fit: BoxFit.fitHeight,
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
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        widget.snapshot['title'],
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('R\$ ${widget.snapshot['price'].toStringAsFixed(2)}',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(width: 30),
                        IconButton(
                            icon: Icon(Icons.remove),
                            color: Theme.of(context).primaryColor,
                            disabledColor: Colors.grey,
                            onPressed: total < 2 ? null :
                                (){
                              setState(() {
                                total -= 1;
                                widget.snapshot['count'] --;
                                widget.update(widget.snapshot);
                              });
                            }
                        ),
                        Text(total.toString(), style: TextStyle(color: Colors.white)),
                        IconButton(
                          icon: Icon(Icons.add),
                          color: Theme.of(context).primaryColor,
                          onPressed: (){
                            setState(() {
                              total += 1;
                              widget.snapshot['count'] ++;
                              widget.update(widget.snapshot);
                            });
                          },
                        ),
                        SizedBox(width: 20,),
                        FlatButton(
                          child: Text("Remover"),
                          textColor: Colors.white,
                          onPressed: (){
                            setState(() {
                              widget.snapshot['is_buy'] = false;
                              widget.rm(widget.snapshot);
                            });
                          },
                        )
                      ],
                    )
                  ],
                )
              ]
          ),
        ),
      )
    );
  }
}
