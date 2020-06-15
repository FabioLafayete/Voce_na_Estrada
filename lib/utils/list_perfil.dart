import 'package:flutter/material.dart';

class ListPerfil {
  static listPerfil ({
    String text,
    IconData icon,
    Color colorIcon,
    double sizeText,
    double sizeIcon,
    Color colorText,
    Function function
}){
    return GestureDetector(
      onTap: function,
      child: Row(
        children: <Widget>[
          Icon(icon, color: colorIcon, size: sizeIcon),
          SizedBox(width: 20),
          Text(text, style: TextStyle(color: colorText, fontSize: sizeText))
        ],
      ),
    );
  }
}