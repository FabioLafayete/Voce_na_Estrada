import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackbr/Tab/inicio.dart';
import 'package:hackbr/tab/chart.dart';
import 'package:hackbr/tab/stores.dart';

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
            page == 2 ? "Lojas" : 'Perfil',
            style: TextStyle(
                color: Color.fromRGBO(166, 39, 6, 1),
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
              primaryColor: Color.fromRGBO(166, 39, 6, 1),
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
            selectedItemColor: Color.fromRGBO(166, 39, 6, 1),
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
                  title: Text(" Inicio", style: TextStyle(fontSize: 17))
              ),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.chartPie),
                  title: Text("Gráfico", style: TextStyle(fontSize: 17))
              ),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.storeAlt),
                  title: Text("  Lojas", style: TextStyle(fontSize: 17))
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 30,),
                  title: Text("Perfil", style: TextStyle(fontSize: 17))
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
              ChartTab(),
              StoresTab(),
              Container(color: Colors.red)
            ],
          ),
        ),
      ),
    );
  }
}
