import 'package:flutter/material.dart';
import 'package:hackbr/timer/food_timer.dart';
import 'package:hackbr/timer/pause_timer.dart';
import 'package:hackbr/timer/sleep_timer.dart';
import 'package:hackbr/timer/timer_service.dart';
import 'package:hackbr/utils/show_dialog.dart';
import 'package:hackbr/utils/start_button.dart';
import 'package:provider/provider.dart';
import 'dart:math';
import 'package:vector_math/vector_math.dart' show radians, Vector3;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RadialMenu extends StatefulWidget {
  final BuildContext context;

  const RadialMenu({this.context});

  createState() => _RadialMenuState();
}

class _RadialMenuState extends State<RadialMenu> with SingleTickerProviderStateMixin {

  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return RadialAnimation(controller: controller, contextt: widget.context);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


class RadialAnimation extends StatelessWidget {
  final BuildContext contextt;

  RadialAnimation({ Key key, this.controller, this.contextt }) :

        translation = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.elasticOut
          ),
        ),

        scale = Tween<double>(
          begin: 1.5,
          end: 0.0,
        ).animate(
          CurvedAnimation(
              parent: controller,
              curve: Curves.fastOutSlowIn
          ),
        ),

        rotation = Tween<double>(
          begin: 0.0,
          end: 360.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0, 0.7,
              curve: Curves.decelerate,
            ),
          ),
        ),

        super(key: key);

  final AnimationController controller;
  final Animation<double> rotation;
  final Animation<double> translation;
  final Animation<double> scale;

  @override
  Widget build(BuildContext context) {

    Provider.of<PauseTimer>(context);
    Provider.of<SleepTimer>(context);
    Provider.of<FoodTimer>(context);

    return AnimatedBuilder(
        animation: controller,
        builder: (context, widget) {
          return Transform.rotate(
              angle: radians(rotation.value),
              child: Stack(
                  alignment: Alignment.center,

                  children: <Widget>[
                    _buildButton(
                        0,
                        color: Colors.blueAccent,
                        icon: Icons.access_time,
                        text: 'Descanço',
                      function: (){
                        Provider.of<TimerService>(context, listen: false).stop();
                        Provider.of<PauseTimer>(context, listen: false).start();
                      }
                    ),
                    _buildButton(
                        90,
                        color: Colors.redAccent,
                        icon: Icons.stop,
                        text: 'Encerrar viagem',
                      function: (){
                        Provider.of<TimerService>(context, listen: false).reset();
                        Provider.of<SleepTimer>(context, listen: false).reset();
                        Provider.of<FoodTimer>(context, listen: false).reset();
                        Provider.of<PauseTimer>(context, listen: false).reset();
                        showDialog(
                            context: contextt,
                            builder: (context){
                              return Showdialog();
                            }
                        );
                      }
                    ),
                    _buildButton(
                        180,
                        color: Colors.green,
                        icon: FontAwesomeIcons.utensils,
                        text: 'Refeição',
                        function: (){
                          Provider.of<TimerService>(context, listen: false).stop();
                          Provider.of<FoodTimer>(context, listen: false).start();
                        }
                    ),
                    _buildButton(
                        270,
                        color: Colors.grey,
                        icon: FontAwesomeIcons.bed,
                        text: 'Dormir',
                        function: (){
                          Provider.of<TimerService>(context, listen: false).stop();
                          Provider.of<SleepTimer>(context, listen: false).start();
                        }
                    ),
                    Transform.scale(
                      scale: scale.value - 1.2,
                      child: FloatingActionButton(
                          child: Icon(FontAwesomeIcons.timesCircle),
                          onPressed: _close,
                          backgroundColor: Colors.red
                      ),
                    ),
                    Transform.scale(
                      scale: scale.value,
                      child: Center(
                        child: Container(
                            child: StartButton(_open)
                        )
                      )
                    )

                  ])
          );
        });
  }

  _open() {
    controller.forward();
  }

  _close() {
    controller.reverse();
  }

  _buildButton(double angle, { Color color, IconData icon, String text, Function function}) {
    final double rad = radians(angle);
    return Transform(
      alignment: Alignment.center,
        transform: Matrix4.identity()..translate(
            (translation.value) * cos(rad),
            (translation.value) * sin(rad)
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
                child: Icon(icon),
                backgroundColor: color,
                onPressed: (){
                  _close();
                  function();
                },
                elevation: 5
            ),
            SizedBox(height: 7),
            Text(text, style: TextStyle(color: Colors.white))
          ],
        )
    );
  }
}