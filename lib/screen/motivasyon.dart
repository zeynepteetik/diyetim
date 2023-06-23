import 'package:flutter/material.dart';
import 'package:flutter_login_register/screen/home_screen.dart';

class MotivasyonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        backgroundColor: Color.fromARGB(255, 255, 235, 59),
      ),
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/sen.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sevgili Diyet Yapan Arkadaşım,\n\n'
              'Öncelikle seninle gurur duymak istiyorum! Diyet yapmak, sağlıklı bir yaşam tarzına adım atmak ve vücudunla ilgilenmek gerçekten büyük bir başarıdır. Bu yolda yürümeye karar verdiğin için kendini tebrik etmelisin...\n',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
