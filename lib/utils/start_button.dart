import 'package:flutter/material.dart';
import 'package:hackbr/timer/food_timer.dart';
import 'package:hackbr/timer/pause_timer.dart';
import 'package:hackbr/timer/sleep_timer.dart';
import 'package:hackbr/timer/timer_service.dart';
import 'package:hackbr/timer/clock.dart';
import 'package:provider/provider.dart';

class StartButton extends StatefulWidget {
  final Function function;

  const StartButton(
      Function function
      ):
        this.function = function;

  @override
  _StartButtonState createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {


  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<TimerService>(context);

    return Center(
          child: MaterialButton(
            height: 100,
            color: provider.currentDuration == Duration(microseconds: 0) ?
                Colors.greenAccent.shade400 :
            provider.isRunning == false ? Colors.redAccent :
                Colors.greenAccent.shade400,
            onPressed: (){
              if(!provider.isRunning){
                Provider.of<TimerService>(context, listen: false).start();
                Provider.of<SleepTimer>(context, listen: false).stop();
                Provider.of<FoodTimer>(context, listen: false).stop();
                Provider.of<PauseTimer>(context, listen: false).stop();
              } else {
                widget.function();
              }
            },
            //textColor: Colors.white,
            child: provider.currentDuration == Duration(microseconds: 0) ?
            Text('Iniciar Viagem',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                )
            ) : provider.isRunning == false ?
            Icon(Icons.pause, color: Colors.white) :
            Clock(),
            //padding: EdgeInsets.all(70),
            shape: CircleBorder(),
            elevation: 10,
          ),
      );
  }
}