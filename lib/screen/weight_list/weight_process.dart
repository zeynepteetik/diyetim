import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/weight_info.dart';
import 'list_weights.dart';

class WeightHome extends StatefulWidget {
  const WeightHome({Key? key}) : super(key: key);

  @override
  _WeightHomeState createState() => _WeightHomeState();
}

class _WeightHomeState extends State<WeightHome> {
  TextEditingController weightIdController = TextEditingController();
  TextEditingController weightAdController = TextEditingController();
  TextEditingController weightTarihController = TextEditingController();

  late Future<Database> database;

  List<WeightInfo> weightList = [];

  _onPressedUpdate() async {
    final enik = WeightInfo(
      id: int.parse(weightIdController.text),
      name: weightAdController.text,
      weight: int.parse(weightTarihController.text),
    );
    utils.updateWeightGroup(enik);
    weightList = await utils.members();
    getData();
  }

  _onPressedAdd() async {
    final enik = WeightInfo(
      id: int.parse(weightIdController.text),
      name: weightAdController.text,
      weight: int.parse(weightTarihController.text),
    );
    utils.insertWeightGroup(enik);
    weightList = await utils.members();

    getData();
  }

  _deleteWeightGroupTable() {
    utils.deleteTable();
    weightList = [];
    getData();
  }

  void getData() async {
    await utils.members().then((result) => {
          setState(() {
            weightList = result;
          })
        });
    print(weightList);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqlite Örneği',
      home: Scaffold(
        appBar: AppBar(title: const Text("Sqlite Örneği")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3)
                  ],
                  controller: weightIdController,
                  decoration: InputDecoration(
                    hintText: 'ID Giriniz',
                    filled: true,
                    fillColor: Color.fromARGB(255, 166, 253, 171),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 15, 73, 33),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: weightAdController,
                  decoration: InputDecoration(
                    hintText: 'Adınızı Giriniz',
                    filled: true,
                    fillColor: Color.fromARGB(255, 166, 253, 171),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 15, 73, 33),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: weightTarihController,
                  decoration: InputDecoration(
                    hintText: 'Kilonuzu Giriniz',
                    filled: true,
                    fillColor: Color.fromARGB(255, 166, 253, 171),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 15, 73, 33),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: _onPressedAdd, child: Text("Veriyi Ekle")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: _onPressedUpdate,
                        child: Text("Veriyi Güncelle")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: _deleteWeightGroupTable,
                        child: const Text("Tüm Verileri Sil")),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListWeightGroup()),
                          );
                        },
                        child: Text("Tüm Verileri Göster")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          getData();
                        },
                        child: Text("Listeyi Yenile")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
