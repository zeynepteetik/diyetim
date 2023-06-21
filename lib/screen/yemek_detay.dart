import 'package:flutter/material.dart';

class YemekDetaySayfasi extends StatelessWidget {
  final String yemekAdi;
  final int ortalamaKalori;

  const YemekDetaySayfasi({
    Key? key,
    required this.yemekAdi,
    required this.ortalamaKalori,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yemek Detayı'),
      ),
      body: Container(
        color: Colors.green, // Arka plan rengi yeşil
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                yemekAdi,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Ortalama Kalori: $ortalamaKalori',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
