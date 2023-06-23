import 'package:flutter/material.dart';
import 'package:flutter_login_register/screen/home_screen.dart';
import 'package:flutter_login_register/screen/login.dart';

class User {
  final String name;
  final String surname;
  final String address;
  final String email;
  final String phone;

  User({
    required this.name,
    required this.surname,
    required this.address,
    required this.email,
    required this.phone,
  });
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User user = User(
    name: 'Zeynep',
    surname: 'Tetik',
    address: 'Keçiören Ankara',
    email: '203311108@selcuk.edu.tr',
    phone: '505 978 8839',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
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
      body: Container(
        color: Colors.green, 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("assets/images/vesikalık.JPG"),
              ),
              SizedBox(height: 100),
              Text(
                '${user.name} ${user.surname}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                user.address,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                user.email,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 10),
              Text(
                user.phone,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text('Çıkış Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
