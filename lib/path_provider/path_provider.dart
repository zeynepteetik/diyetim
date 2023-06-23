import 'package:flutter/material.dart';
import 'package:flutter_login_register/screen/home_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ProviderModel extends StatefulWidget {
  const ProviderModel({Key? key}) : super(key: key);

  @override
  State<ProviderModel> createState() => _PathProvState();
}

class _PathProvState extends State<ProviderModel> {
  final textController = TextEditingController();
  String text = "";

  Future<void> createFile(String text) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/text_file.txt');
    await file.writeAsString(text);
  }

  Future<void> readFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/text_file.txt');
      text = await file.readAsString();
    } catch (e) {
      print('exception');
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("örnek diyet listesi"),
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
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: TextField(
              textAlign: TextAlign.center,
              controller: textController,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text('Diyet listeyi oluştur'),
            onPressed: () => createFile(textController.text),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              await readFile();
              setState(() {});
            },
            child: Text('Diyet Listeyi oku'),
          ),
          const SizedBox(
            height: 18,
          ),
          if (text != null) Text('$text'),
        ],
      ),
    );
  }
}
