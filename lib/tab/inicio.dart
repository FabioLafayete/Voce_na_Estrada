import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackbr/global/global.dart';
import 'package:hackbr/timer/food_timer.dart';
import 'package:hackbr/timer/pause_timer.dart';
import 'package:hackbr/timer/sleep_timer.dart';
import 'package:hackbr/timer/timer_service.dart';
import 'package:hackbr/utils/column_timer.dart';
import 'package:hackbr/utils/radial_menu.dart';
import 'package:provider/provider.dart';

class InicioTab extends StatefulWidget{

  InicioTab({
    Key key,
  }) : super(key: key);

  @override
  _InicioTabState createState() => _InicioTabState();
}

class _InicioTabState extends State<InicioTab> with AutomaticKeepAliveClientMixin{

  int totalMessage = 0;
  int nowMessage = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      totalMessage = mensagens.length - 1;
    });
  }


  Future<String> getMessages () async {

    if(totalMessage == nowMessage){
      setState(() {
        nowMessage = 0;
      });
    }
    await Future.delayed(Duration(seconds: 300), (){});
    String result = mensagens[nowMessage];
    setState(() {
      nowMessage++;
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final timeService = TimerService();
    final pauseService = PauseTimer();
    final sleepService = SleepTimer();
    final foodService = FoodTimer();

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        SizedBox(height: 10),
        Center(
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.white.withOpacity(0.05),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(left: 10, right: 10),
              child: FutureBuilder<String>(
                future: getMessages(),
                initialData: 'Hey!! \n\nLembre-se de beber água 💦',
                builder: (context, snapshot) {
                  return Text(snapshot.data,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  );
                }
              ),
            )
        ),
        SizedBox(height: 20),
        Container(
          height: 290,
          width: MediaQuery.of(context).size.width,
          child: MultiProvider(
              providers: [
                ChangeNotifierProvider<TimerService>.value(value:  timeService),
                ChangeNotifierProvider<PauseTimer>.value(value: pauseService),
                ChangeNotifierProvider<FoodTimer>.value(value: foodService),
                ChangeNotifierProvider<SleepTimer>.value(value: sleepService)
               ],
              child: RadialMenu(context: context)
          ),
        ),
        SizedBox(height: 20),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ChangeNotifierProvider<PauseTimer>.value(
              value: pauseService,
              child: ColumnTimer(
                colorIcon: Colors.blue,
                colorColumn: Colors.white.withOpacity(0.1),
                icon: Icons.access_time,
                text: 'Descanso',
                type: PauseTimer,
              ),
            ),
            ChangeNotifierProvider<FoodTimer>.value(
              value: foodService,
              child: ColumnTimer(
                colorIcon: Colors.green,
                colorColumn: Colors.transparent,
                icon: FontAwesomeIcons.utensils,
                text: 'Refeição',
                type: FoodTimer,
              ),
            ),
            ChangeNotifierProvider<SleepTimer>.value(
              value: sleepService,
              child: ColumnTimer(
                colorIcon: Colors.grey,
                colorColumn: Colors.white.withOpacity(0.1),
                icon: Icons.airline_seat_flat,
                text: 'Dormir',
                type: SleepTimer,
              ),
            ),
            ChangeNotifierProvider<TimerService>.value(
              value: timeService,
              child: ColumnTimer(
                colorIcon: Color.fromRGBO(166, 39, 6, 1),
                colorColumn: Colors.transparent,
                icon: FontAwesomeIcons.truckMoving,
                text: 'Dirigindo',
                type: TimerService,
              ),
            )
          ],
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
