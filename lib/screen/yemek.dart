import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_login_register/screen/yemek_detay.dart';

class ProjeScreen extends StatelessWidget {
  final List<String> diyetYemekleri = [
    'Yulaf ezmesi',
    'Mevsim salatası',
    'Taze meyve suyu',
    'Izgara tavuk',
    'Buharda pişmiş sebzeler',
    'Ton balıklı sandviç',
    'Yoğurt ve granola',
    'Dana eti ve brokoli',
    'Mercimek çorbası',
    'Yumurta beyazı omlet',
    'Avokado salatası',
    'Mısır gevreği ve süt',
    'Fırında somon',
    'Yeşil smoothie',
    'Köri soslu sebzeler',
    'Taze sebze suyu',
    'Kinoa salatası',
    'Badem sütü',
    'Taze meyve salatası',
    'Sebzeli omlet',
    'Tam buğday ekmeği ve peynir'
  ];

   ProjeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proje Takip Sistemi'),
        backgroundColor: Colors.yellow, 
      ),
      body: Container(
        color: Colors.green, // Arka plan rengi yeşil
        child: ListView.builder(
          itemCount: 20, // Öğe sayısını 20'ye yükselt
          itemBuilder: (BuildContext context, int index) {
            final randomIndex = Random().nextInt(diyetYemekleri.length);
            final yemekAdi = diyetYemekleri[randomIndex];
            final ortalamaKalori = Random().nextInt(500); // Rastgele bir kalori değeri

            return GestureDetector(
              onDoubleTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YemekDetaySayfasi(
                      yemekAdi: yemekAdi,
                      ortalamaKalori: ortalamaKalori,
                    ),
                  ),
                );
              },
              child: Container(
                height: 100,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.network(
                      'https://picsum.photos/100?random=$index',
                      width: 70,
                      height: 70,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          yemekAdi,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Diyet Yemeği',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        // Detay sayfasına yönlendirme işlemleri buraya gelebilir
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


