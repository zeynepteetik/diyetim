import 'package:flutter/material.dart';
import 'package:flutter_login_register/screen/home_screen.dart';
import 'package:pie_chart/pie_chart.dart';

class GrafikScreen extends StatefulWidget {
  @override
  _GrafikScreenState createState() => _GrafikScreenState();
}

class _GrafikScreenState extends State<GrafikScreen> {
  double size = 0.6; // Grafik boyutunu 0.6 olarak güncellendi

  Map<String, double> dataMap = {
    "Kadın kullanıcı (98.524)": 98524,
    "Erkek kullanıcı (26.300)": 26300,
  };

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
        title: Text('Grafik Screen'),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            width: MediaQuery.of(context).size.width * size,
            height: MediaQuery.of(context).size.width * size,
            child: PieChart(
              dataMap: dataMap,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width * 0.5,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 32.0,
              centerText: "Kullanıcılar",
              legendOptions: LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.right,
                showLegends: true,
                legendTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                showChartValues: true,
                showChartValuesInPercentage: false,
                showChartValuesOutside: false,
                decimalPlaces: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
