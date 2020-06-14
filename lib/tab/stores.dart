import 'package:flutter/material.dart';
import 'package:hackbr/utils/place_tile.dart';

class StoresTab extends StatefulWidget {
  @override
  _StoresTabState createState() => _StoresTabState();
}

class _StoresTabState extends State<StoresTab> {

  Future<List<Map<String, dynamic>>> getStores () async {
    return [{
        'address': 'Rod. Régis Bittencourt, Km 313 - 5 - Paiol do Meio, São Lourenço da Serra - SP, 06890-000',
        'image': 'https://lh3.ggpht.com/p/AF1QipMReT1o-MIwg1Prg6M3WSlSPaAn_oTA6xTq6uaZ=s1024',
        'lat': '-23.8906788',
        'long': '-46.9832226',
        'phone': '+551146870606',
        'title': 'COSTELASUL58',
        'ponto': true,
        'itens' : [
          {
            'id': 1,
            'title': 'Coma a vontade por um preço fixo',
            'image': 'https://lh3.ggpht.com/p/AF1QipMReT1o-MIwg1Prg6M3WSlSPaAn_oTA6xTq6uaZ=s1536',
            'price': 21.90,
            'cashback': 2.0,
            'is_buy': false,
            'count': 1
          },
          {
            'id': 2,
            'title': 'Lata coca cola',
            'image': 'https://www.imigrantesbebidas.com.br/bebida/images/products/full/1984_Refrigerante_Coca_Cola_Lata_350_ml.jpg',
            'price': 4.50,
            'cashback': 1.0,
            'is_buy': false,
            'count': 1
          },
          ]
      },
      {
        'address': 'Jardim das Palmeiras, Juquitiba - State of São Paulo, 06950-000',
        'image': 'https://lh5.googleusercontent.com/p/AF1QipMQe9DfoToNigovt1mJcPJNn5hBFZQC6F_KVnGx=s1031-k-no',
        'lat': '-23.9305206',
        'long': '-47.0071751',
        'phone': '+5511971773858',
        'title': 'Baitaca Burgers',
        'ponto': false,
        'itens': [
          {
            'id': 1,
            'title': 'Hamburguer no prato',
            'image': 'https://lh5.googleusercontent.com/p/AF1QipOt_frCKD_HO-QArEE4i8o2ByDS5Il9pt3RPXi0=s1354-k-no',
            'price': 18.90,
            'cashback': 2.0,
            'is_buy': false,
            'count': 1
          },
          {
            'id': 2,
            'title': 'X - Salada com bebida',
            'image': 'https://lh5.googleusercontent.com/p/AF1QipMyapIauaXl-M1NwoITCE0PfuwD-ULr4IPWNIlV=w203-h253-k-no',
            'price': 12.00,
            'cashback': 1.0,
            'is_buy': false,
            'count': 1
          },
          {
            'id': 3,
            'title': 'Lata coca cola',
            'image': 'https://www.imigrantesbebidas.com.br/bebida/images/products/full/1984_Refrigerante_Coca_Cola_Lata_350_ml.jpg',
            'price': 4.50,
            'cashback': 1.0,
            'is_buy': false,
            'count': 1
          },
        ]
      },
      {
        'address': 'Campina Grande do Sul - State of Paraná, 83430-000',
        'image': 'https://lh3.ggpht.com/p/AF1QipPaR4sHi0YSfDSbUF5I7c62IEsLCyQBxl5xaQzQ=s1024',
        'lat': '-25.1074189',
        'long': '-48.7942217',
        'phone': '',
        'title': 'Pelanda',
        'ponto': true,
        'itens' : []
      },
      ];
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getStores(),
      initialData: [],
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
              children: snapshot.data.map(
                      (doc)=> PlaceTile(doc)
              ).toList()
          );
        }
      },
    );
  }
}
