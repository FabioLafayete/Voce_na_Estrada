import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackbr/utils/resume_chart.dart';

class ChartTab extends StatefulWidget {
  final Widget child;

  ChartTab({Key key, this.child}) : super(key: key);

  _ChartTabState createState() => _ChartTabState();
}

class _ChartTabState extends State<ChartTab> {
  List<charts.Series<Travels, String>> _seriesData;
  List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {
    var data1 = [
      new Travels(1980, '', 50),
    ];
    var data2 = [
      new Travels(1985, '', 90),
    ];
    var data3 = [
      new Travels(1985, '', 130),
    ];

    var piedata = [
      new Task('Dirigindo', 45.8, Color.fromRGBO(166, 39, 6, 1)),
      new Task('Dormindo', 25.3, Colors.grey),
      new Task('Alimentando', 8.3, Colors.green),
      new Task('Descansando', 10.6, Colors.blue),
    ];


    _seriesData.add(
      charts.Series(
        domainFn: (Travels pollution, _) => pollution.place,
        measureFn: (Travels pollution, _) => pollution.quantity,
        id: '2017',
        colorFn: (Travels pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Travels pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Travels pollution, _) => pollution.place,
        measureFn: (Travels pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        colorFn: (Travels pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Travels pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Travels pollution, _) => pollution.place,
        measureFn: (Travels pollution, _) => pollution.quantity,
        id: '2019',
        data: data3,
        colorFn: (Travels pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Travels pollution, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'percent',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue} %',
      ),
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<Travels, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Container(
              color: Color.fromRGBO(36, 36, 36, 1),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(child: Container()),
                    TabBar(
                      indicatorColor: Color.fromRGBO(143, 43, 10, 1),
                      tabs: [
                        Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                        Tab(icon: Icon(FontAwesomeIcons.solidChartBar)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      Text(
                          'Porcentagem de atividades',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.40,
                        child: charts.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 1),
                            behaviors: [
                              new charts.DatumLegend(
                                outsideJustification: charts.OutsideJustification.endDrawArea,
                                horizontalFirst: false,
                                desiredMaxRows: 2,
                                cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                                entryTextStyle: charts.TextStyleSpec(
                                    color: charts.MaterialPalette.black,
                                    fontFamily: 'Georgia',
                                    fontSize: 18
                                ),
                              )
                            ],
                            defaultRenderer: new charts.ArcRendererConfig(
                                arcWidth: 150,
                                arcRendererDecorators: [
                                  new charts.ArcLabelDecorator(
                                      labelPosition: charts.ArcLabelPosition.inside)
                                ])),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        //color: Color.fromRGBO(45, 45, 45, 1).withOpacity(0.3),
                        width: MediaQuery.of(context).size.width,
                        //height: MediaQuery.of(context).size.height * 0.2,
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Resumo',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                            ),
                            SizedBox(height: 10),
                            Resume.resumeChart(
                              title: 'Dirigindo:',
                              icon: FontAwesomeIcons.truckMoving,
                              colorIcon: Color.fromRGBO(166, 39, 6, 1),
                              maxLine: 5,
                              text: 'Você tem dirigido acima da média recomendada. Considere administrar melhor o tempo nas suas viagens para descansar mais.'
                            ),
                            Divider(color: Colors.black),
                            Resume.resumeChart(
                                title: 'Dormindo:',
                                icon: FontAwesomeIcons.bed,
                                colorIcon: Colors.grey,
                                maxLine: 5,
                                text: 'Sua média de sono esta OK.'
                            ),
                            Divider(color: Colors.black),
                            Resume.resumeChart(
                                title: 'Refeição:',
                                icon: FontAwesomeIcons.utensils,
                                colorIcon: Colors.green,
                                maxLine: 5,
                                text: 'Horario de refeição é bem mais do que só comer, aproveite o momento para relaxar também.'
                            ),
                            Divider(color: Colors.black),
                            Resume.resumeChart(
                                title: 'Descanso:',
                                icon: FontAwesomeIcons.clock,
                                colorIcon: Colors.blue,
                                maxLine: 5,
                                text: 'Sua média de descanso pode ser melhor. Aproveite para fazer alongamentos.'
                            ),
                            Divider(color: Colors.black),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Número de viagens por ano',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold)
                        ),
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class Travels {
  String place;
  int year;
  int quantity;

  Travels(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}
