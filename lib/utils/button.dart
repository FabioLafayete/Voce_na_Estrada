import 'package:flutter/material.dart';

class CustomButton {
  static Widget defaultButton ({
    VoidCallback onPress,
    String text,
    Widget widget,
    bool loading = false,
    double elevation,
    double borderRadius,
    double heightButton,
    double widthButton,
    Color color,
    Color textColor,
    Color disabledColor,
    Color disabledTextColor,
    Color borderSideColor,
    double fontSize,
    double widthBorder}) {
    return SizedBox(
        height: heightButton,
        width: widthButton,
        child: RaisedButton(
            color: color,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: borderSideColor, width: widthBorder),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            elevation: elevation,
            child: widget == null ? loading == false ? Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize
                )
            ) : Container(
              height: 30,
              width: 30,
              child: Center(child: CircularProgressIndicator()),
            )  : widget,
            textColor: textColor,
            disabledColor: disabledColor,
            disabledTextColor: disabledTextColor,
            onPressed: onPress
        )
    );
  }
}