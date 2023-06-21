import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';


class ProviderModel extends StatefulWidget {
  const ProviderModel({super.key});


  @override
  State<ProviderModel> createState() => _PathProvState();
}

class _PathProvState extends State<ProviderModel> {
  final textController = TextEditingController();
  String text = "";

  Future<void> createFile(String text) async {
//provides directory path.
    final directory = await getApplicationDocumentsDirectory();
//creates text_file in the provided path.
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
      appBar: AppBar(title: Text("örnek metin")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: TextField(
              textAlign: TextAlign.center, //input aligns to center
              controller: textController, //assigns TextEditingController
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text('dosya oluştur'),
            onPressed: () => createFile(
                textController.text), //calls createFile() when //button pressed
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              await readFile(); //calls readFile()
              setState(() {}); //rebuilds the UI.
            },
            child: Text('dosya oku'),
          ),
          const SizedBox(
            height: 18,
          ),
          if (text != null) Text('$text') //text set if it's not null.
        ],
      ),
    );
  }
}