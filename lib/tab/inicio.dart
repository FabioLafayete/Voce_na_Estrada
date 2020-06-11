import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackbr/timer/clock_pause.dart';
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
  String text = 'MENSAGEM AQUI kwdkjawh wkjehkjqwh vnvvhgv';

  bool is_active = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final timeService = TimerService();
    final pauseService = PauseTimer();
    final sleepService = SleepTimer();
    final foodService = FoodTimer();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black12,
      child: ListView(
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
                child: Expanded(
                  child: Text(text,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
          ),
          SizedBox(height: 20),
          Container(
            height: 290,
            child: MultiProvider(
                providers: [
                  ChangeNotifierProvider<TimerService>(create: (_) => timeService),
                  ChangeNotifierProvider<PauseTimer>(create: (_) => pauseService),
                  ChangeNotifierProvider<FoodTimer>(create: (_) => foodService),
                  ChangeNotifierProvider<SleepTimer>(create: (_) => sleepService)
                 ],
                child: RadialMenu()
            ),
          ),
          SizedBox(height: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ChangeNotifierProvider<PauseTimer>(
                create: (_) => pauseService,
                child: ColumnTimer(
                  colorIcon: Colors.blue,
                  colorColumn: Colors.white.withOpacity(0.1),
                  icon: Icons.access_time,
                  text: 'Descanço',
                  type: PauseTimer,
                ),
              ),
              ChangeNotifierProvider<FoodTimer>(
                create: (_) => foodService,
                child: ColumnTimer(
                  colorIcon: Colors.red,
                  colorColumn: Colors.transparent,
                  icon: Icons.fastfood,
                  text: 'Refeição',
                  type: FoodTimer,
                ),
              ),
              ChangeNotifierProvider<SleepTimer>(
                create: (_) => sleepService,
                child: ColumnTimer(
                  colorIcon: Colors.grey,
                  colorColumn: Colors.white.withOpacity(0.1),
                  icon: Icons.airline_seat_flat,
                  text: 'Dormir',
                  type: SleepTimer,
                ),
              ),
              ChangeNotifierProvider<TimerService>(
                create: (_) => timeService,
                child: ColumnTimer(
                  colorIcon: Colors.green,
                  colorColumn: Colors.transparent,
                  icon: FontAwesomeIcons.truck,
                  text: 'Dirigindo',
                  type: TimerService,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
