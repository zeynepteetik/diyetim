import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_register/firebase_options.dart';
import 'package:flutter_login_register/screen/login.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); //flutter başlatılıyor
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, //firebase başlatılıyor
);

  await Hive.initFlutter(); //hive veri tabanı başlatılıyor

  var box = await Hive.openBox('mybox'); //kutu açtık
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { //build:arayüz
    return MaterialApp(
      home:  LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
