import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackbr/Tab/inicio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PageController _pageController;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }


  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            page == 0 ? "Inicio" :
            page == 1 ? 'Gráfico' :
            page == 2 ? "Viagens" : 'Definições',
            style: TextStyle(
                color: Colors.amber,
                fontSize: 23
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.black26,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: Colors.grey[850],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.black26,
              primaryColor: Colors.amber,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(
                      color: Colors.white38
                  )
              )
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.amber,
            currentIndex: page,
            onTap: (p){
              _pageController.animateToPage(
                  p,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease
              );
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.tachometerAlt),
                  title: Text(" Inicio")
              ),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.chartPie),
                  title: Text("Gráfico")
              ),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.road),
                  title: Text(" Viagens")
              ),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.wrench),
                  title: Text("Definições")
              )
            ],
          ),
        ),
        body: SafeArea(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (p){
              setState(() {
                page = p;
              });
            },
            controller: _pageController,
            children: <Widget>[
              InicioTab(),
              Container(color: Colors.orangeAccent),
              Container(color: Colors.yellow),
              Container(color: Colors.red)
            ],
          ),
        ),
      ),
    );
  }
}
