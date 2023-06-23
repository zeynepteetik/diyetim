import 'package:flutter/material.dart';
import 'package:flutter_login_register/screen/home_screen.dart';

class KVKKScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('KVKK'),
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'KVKK (Kişisel Verilerin Korunması Kanunu), kişisel verilerin işlenmesi, saklanması ve korunmasıyla ilgili Türkiyede uygulanan bir kanundur. Bu kanun, kişisel verilerin toplanması, işlenmesi, kullanılması ve paylaşılması sırasında bireylerin haklarını ve gizliliğini korumayı amaçlar. Bu nedenle, diyetinizle ilgili kişisel verilerinizin gizliliğini ve güvenliğini sağlamak için gerekli önlemleri almak önemlidir.\n\nLütfen diyetinizle ilgili kişisel verilerinizi paylaşırken KVKKnın gerekliliklerine uyun ve verilerinizin güvenliğini sağlamak için uygun önlemleri alın.\n',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
