import 'package:flutter/material.dart';
import 'package:hackbr/screens/cadastro.dart';
import 'package:hackbr/screens/login.dart';
import 'package:hackbr/utils/button.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class WellcomePage extends StatefulWidget {
  @override
  _WellcomePageState createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {

  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        description: "Conectando caminhoneiros ao melhor que existe nas estradas!",
        backgroundImage: "lib/images/01.jpg",
        backgroundOpacity: 0.5,
        marginTitle: EdgeInsets.only(top: 40),
        widgetTitle: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    width: 550,
                    height: 200,
                    color: Colors.white.withOpacity(0.15),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'lib/images/logo.png',
                    height: 200,
                    width: 300,
                  ),
                ),
              ],
            ),
            Container(height: 300)
          ],
        ),
        backgroundColor: Colors.blue,
      ),
    );
    slides.add(
      new Slide(
        //title: "Você na Estrada",
        description: "Informamos você sobre os melhores hábitos e comportamentos saudáveis",
        backgroundImage: "lib/images/02.jpg",
        centerWidget: Container(height: 380),
        backgroundColor: Colors.blue,
      ),
    );
    slides.add(
      new Slide(
        //title: "Você na Estrada",
        description: "Venha se juntar conosco, queremos viajar com você na estrada!",
        backgroundImage: "lib/images/03.jpg",
        centerWidget: Container(height: 80),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void onDonePress() {
    // TODO: go to next screen
  }

  void onSkipPress() {
    // TODO: go to next screen
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.89,
          child: IntroSlider(
            nameNextBtn: 'PRÓXIMO',
            namePrevBtn: 'VOLTAR',
            isShowDoneBtn: false,
            isShowSkipBtn: false,
            isShowPrevBtn: true,
            colorDot: Colors.white,
            colorActiveDot: Colors.black12,
            slides: this.slides,
            onDonePress: this.onDonePress,
            onSkipPress: this.onSkipPress,
          ),
        ),
        Container(
          color: Color.fromRGBO(45, 45, 45, 1),
          height: MediaQuery.of(context).size.height * 0.11,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomButton.defaultButton(
                  heightButton: 45,
                  widthButton: 140,
                  color: Colors.white.withOpacity(0.86),
                  borderSideColor: Colors.white,
                  widthBorder: 1.5,
                  borderRadius: 7,
                  elevation: 4,
                  text: "CADASTRAR",
                  fontSize: 15,
                  textColor: Colors.green,
                  disabledColor: Colors.white.withOpacity(0.6),
                  disabledTextColor: Colors.green,
                  onPress: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Cadastro()));
                  }
              ),
              CustomButton.defaultButton(
                  heightButton: 45,
                  widthButton: 140,
                  color: Colors.green.withOpacity(0.3),
                  borderSideColor: Colors.green.shade400,
                  widthBorder: 1.5,
                  borderRadius: 7,
                  elevation: 4,
                  text: "ENTRAR",
                  fontSize: 15,
                  textColor: Colors.white,
                  disabledColor: Colors.white.withOpacity(0.6),
                  disabledTextColor: Colors.green,
                  onPress: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Login()));
                  }
              ),
            ],
          ),
        )
      ],
    );
  }
}
