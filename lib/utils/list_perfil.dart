import 'package:flutter/material.dart';

class ListPerfil {
  static listPerfil ({
    String text,
    IconData icon,
    Color colorIcon,
    double sizeText,
    double sizeIcon,
    Color colorText
}){
    return Row(
      children: <Widget>[
        Icon(icon, color: colorIcon, size: sizeIcon),
        SizedBox(width: 20),
        Text(text, style: TextStyle(color: colorText, fontSize: sizeText))
      ],
    );
  }
}