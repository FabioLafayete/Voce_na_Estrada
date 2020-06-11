import 'package:flutter/material.dart';
import 'package:hackbr/timer/pause_timer.dart';
import 'package:provider/provider.dart';

class ClockPause extends StatelessWidget {

  const ClockPause({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final currentDuration = Provider.of<PauseTimer>(context).currentDuration;
    final seconds = currentDuration.inSeconds;
    final minutes = currentDuration.inMinutes;
    final hours = currentDuration.inHours;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(createNumberTime(hours), style: TextStyle(color: Colors.white, fontSize: 18)),
          Container(
              margin: EdgeInsets.only(bottom: 3, left: 2, right: 2),
              child: Text(
                  ':',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white)
              )
          ),
          Text(createNumberTime(minutes), style: TextStyle(color: Colors.white, fontSize: 18)),
          Container(
              margin: EdgeInsets.only(bottom: 3, left: 2, right: 2),
              child: Text(
                  ':',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white)
              )
          ),
          Text(createNumberTime(seconds), style: TextStyle(color: Colors.white, fontSize: 18)),
        ],
      ),
    );
  }

  String createNumberTime(int numberTime) {
    final parsedNumberTime = numberTime % 60;
    final isNumberTimeTwoDigits = isNumberTwoDigits(parsedNumberTime);
    final firstNumber = firstDigit(parsedNumberTime);
    final tenDigit = isNumberTimeTwoDigits ? firstNumber : 0;
    final digit = isNumberTimeTwoDigits
        ? int.parse(parsedNumberTime.toString()[1])
        : firstNumber;

    return '${tenDigit}${digit}';
  }

  bool isNumberTwoDigits(int number) {
    return number.toString().length == 2;
  }

  int firstDigit(int number) {
    return int.parse(number.toString()[0]);
  }

}
