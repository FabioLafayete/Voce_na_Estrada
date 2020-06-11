import 'package:flutter/material.dart';
import 'package:hackbr/timer/clock.dart';
import 'package:hackbr/timer/clock_food.dart';
import 'package:hackbr/timer/clock_pause.dart';
import 'package:hackbr/timer/clock_sleep.dart';
import 'package:hackbr/timer/food_timer.dart';
import 'package:hackbr/timer/pause_timer.dart';
import 'package:hackbr/timer/sleep_timer.dart';
import 'package:hackbr/timer/timer_service.dart';
import 'package:provider/provider.dart';

class ColumnTimer extends StatelessWidget {

  final String text;
  final IconData icon;
  final Color colorIcon;
  final Color colorColumn;
  final dynamic type;

  const ColumnTimer({
    this.text,
    this.icon,
    this.colorIcon,
    this.colorColumn,
    this.type
  });

  @override
  Widget build(BuildContext context) {

    dynamic service;

    if (type == SleepTimer){
      service = ClockSleep();
    } else if (type == FoodTimer){
      service = ClockFood();
    }  else if (type == PauseTimer){
      service = ClockPause();
    } else if (type == TimerService){
      service = Clock();
    }

    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      color: colorColumn,
      height: 50,
      child: Row(
        children: <Widget>[
          Icon(icon, color: colorIcon),
          SizedBox(width: 15),
          Container(
            width: 100,
            child: Text(
                '${text}: ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                )
            ),
          ),
          SizedBox(width: 10),
          service
        ],
      ),
    );
  }
}
