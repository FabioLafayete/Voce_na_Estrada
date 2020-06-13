import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
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
                        Tab(
                          icon: Icon(FontAwesomeIcons.solidChartBar),
                        ),
                        Tab(icon: Icon(FontAwesomeIcons.chartPie)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
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
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Porcentagem de atividades',
                          style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold)
                        ),
                        SizedBox(height: 10.0),
                        Expanded(
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
                                      color: charts.MaterialPalette.purple.shadeDefault,
                                      fontFamily: 'Georgia',
                                      fontSize: 18),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 100,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition: charts.ArcLabelPosition.inside)
                                  ])),
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
