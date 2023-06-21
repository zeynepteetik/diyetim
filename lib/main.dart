import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_register/firebase_options.dart';
import 'package:flutter_login_register/screen/home_screen.dart';
import 'package:flutter_login_register/screen/login.dart';
import 'package:hive_flutter/hive_flutter.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
