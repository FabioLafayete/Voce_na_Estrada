import 'package:flutter/material.dart';
import 'package:hackbr/screens/store.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceTile extends StatelessWidget {

  final Map<String, dynamic> snapshot;

  PlaceTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Store(snapshot: snapshot)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 100.0,
              child: Image.network(snapshot["image"], fit: BoxFit.cover),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    snapshot["title"],
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text(
                    snapshot["address"],
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text("Ver no Mapa"),
                  textColor: Colors.blue,
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    launch("https://www.google.com/maps/search/?api=1&query=${snapshot["lat"]},"
                        "${snapshot["long"]}");
                  },
                ),
                FlatButton(
                  child: Text("Ligar"),
                  textColor: Colors.blue,
                  padding: EdgeInsets.zero,
                  onPressed: (){
                    launch("tel: ${snapshot["phone"]}");
                  },
                )
              ],
            )
          ],
        ),
      ),
    );

  } // build
} // PlaceTile
