import 'package:flutter/cupertino.dart';

class Resume {
  static resumeChart ({
    String text,
    String title,
    IconData icon,
    Color colorIcon,
    int maxLine
}){
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(icon, color: colorIcon),
            SizedBox(width: 15),
            Text(title, style: TextStyle(fontSize: 19),)
          ],
        ),
        SizedBox(height: 5),
        Row(children: <Widget>[
          Expanded(
              child: Text(text,
                  style: TextStyle(fontSize: 17),
                  maxLines: maxLine
              )
          )
        ])
      ],
    );
  }
}