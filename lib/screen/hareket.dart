import 'package:flutter/material.dart';
import 'package:flutter_login_register/screen/home_screen.dart';

class HareketScreen extends StatelessWidget {
  List<String> imagePaths = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
    'assets/images/9.png',
    'assets/images/10.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow, 
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Container(
        color: Colors.green, 
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.primaryVelocity! < 0) {
                  print('Sola kaydırıldı');
                } else if (details.primaryVelocity! > 0) {
                  print('Sağa kaydırıldı');
                }
              },
              child: Padding(
                padding: EdgeInsets.all(120.0),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.contain, 
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
