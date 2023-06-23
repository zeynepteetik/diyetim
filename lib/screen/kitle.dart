import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String gender = 'Male';
  double bmiResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300], // Arka plan rengi: Gri
      appBar: AppBar(
        backgroundColor: Colors.green, // AppBar rengi: Yeşil
        title: Text('Vücut Kitle Hesaplama'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            Text(
              'Boy (cm)',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(
              controller: heightController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            Text(
              'Kilo (kg)',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(
              controller: weightController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            Text(
              'Yaş',
              style: TextStyle(fontSize: 16.0),
            ),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            Text(
              'Cinsiyet',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                Text('Erkek'),
                SizedBox(width: 20.0),
                Radio(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                Text('Kadın'),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Hesaplama butonu rengi: Yeşil
              ),
              child: Text('Hesapla'),
            ),
            SizedBox(height: 20.0),
            Text(

              'Vücut Kitle İndeksi : $bmiResult',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);
    int age = int.parse(ageController.text);

    double heightInMeters = height / 100; // Boyu metreye çevirme
    double bmi = weight / (heightInMeters * heightInMeters); // BMI hesaplama

    setState(() {
      bmiResult = bmi;
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: BMIScreen(),
  ));
}