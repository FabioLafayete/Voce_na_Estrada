import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hackbr/utils/list_perfil.dart';

class PerfilTab extends StatefulWidget {
  @override
  _PerfilTabState createState() => _PerfilTabState();
}

class _PerfilTabState extends State<PerfilTab> {

  double saldo = 07.26;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          SizedBox(height: 40),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Card(
              color: Color.fromRGBO(35, 35, 35, 1),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.green.shade400,
                      width: 1.0
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(7.0) //         <--- border radius here
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Text('Meu saldo:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('R\$ ${saldo}',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 100),
          ListPerfil.listPerfil(
              icon: Icons.person_outline,
              colorIcon: Colors.white,
              colorText: Colors.white,
              sizeIcon: 20,
              sizeText: 18,
              text: 'Conta'
          ),
          SizedBox(height: 25),
          ListPerfil.listPerfil(
              icon: Icons.shopping_cart,
              colorIcon: Colors.white,
              colorText: Colors.white,
              sizeIcon: 20,
              sizeText: 18,
              text: 'Minhas compras'
          ),
          SizedBox(height: 25),
          ListPerfil.listPerfil(
              icon: Icons.settings,
              colorIcon: Colors.white,
              colorText: Colors.white,
              sizeIcon: 20,
              sizeText: 18,
              text: 'Configuração'
          ),
          SizedBox(height: 25),
          ListPerfil.listPerfil(
              icon: Icons.help_outline,
              colorIcon: Colors.white,
              colorText: Colors.white,
              sizeIcon: 20,
              sizeText: 18,
              text: 'Ajuda'
          ),
          SizedBox(height: 25),
          ListPerfil.listPerfil(
              icon: Icons.info_outline,
              colorIcon: Colors.white,
              colorText: Colors.white,
              sizeIcon: 20,
              sizeText: 18,
              text: 'Sobre'
          ),
          SizedBox(height: 45),
          ListPerfil.listPerfil(
              icon: FontAwesomeIcons.doorOpen,
              colorIcon: Colors.red,
              colorText: Colors.red,
              sizeIcon: 20,
              sizeText: 18,
              text: 'Sair'
          ),
          //Divider(color: Colors.white.withOpacity(0.4))
        ],
      ),
    );
  }
}
