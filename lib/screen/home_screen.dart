import 'package:flutter/material.dart';
import 'package:flutter_login_register/path_provider/path_provider.dart';
import 'package:flutter_login_register/screen/bagis_yap/bagis_yap.dart';
import 'package:flutter_login_register/screen/profil.dart';
import 'package:flutter_login_register/screen/weight_list/weight_process.dart';
import 'package:flutter_login_register/screen/yemek.dart';
import 'package:pie_chart/pie_chart.dart';
import 'kitle.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  double size = 0.3;

  Map<String, double> dataMap = {
    "Kadın Kullanıcı (98.524)": 98524,
    "Erkek Kullanıcı (26.300)": 26300,
  };

@override
void initState() {
  super.initState(); // Geçersiz kılınan yöntemi çağırma

  Future.delayed(const Duration(seconds: 1), () {
    setState(() {
      size = 0.3;
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
        title: Text('DİYETİM'),
        backgroundColor: Color.fromARGB(147, 255, 235, 59),
        actions: [],
      ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.grey,
    image: DecorationImage(
      image: AssetImage("assets/images/drawer.jpg"),
      fit: BoxFit.cover,
    ),
  ),
  child: Text(
    'Menü',
    style: TextStyle(
      color: Colors.white,
      fontSize: 24,
    ),
  ),
),

            ListTile(
              title: Text('bağış yap'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return ProviderModel();
                }));
              },
            ),
            ListTile(
              title: Text('Randevu Oluştur'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
              },
            ),
            ListTile(
              title: Text('Projeler'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return ProjeScreen();
                }));
              },
            ),
          ],
        ),
      ),

        body: Center(
          child: ListView(
            padding: EdgeInsets.all(20.0),
            children: [

              SizedBox(height: 40),
              
              GestureDetector(
                onTap: () {
                  // İlk tıklanabilir resim için tetiklenecek işlemler
                },
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset("assets/images/fitness.jpg"),
                ),
              ),
             
              SizedBox(height: 160),
              AnimatedContainer(
                duration: Duration(seconds: 1),
                width: MediaQuery.of(context).size.width * size,
                height: MediaQuery.of(context).size.width * size,
                child: PieChart(
                  dataMap: dataMap,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.green,
            textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(color: Colors.white),
                ),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });

              switch (index) {
                case 0:
                  // Profil öğesine tıklandığında profil sayfasına yönlendirme yapılabilir
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                  break;
                case 1:
                  // BMI öğesine tıklandığında BMI sayfasına yönlendirme yapılabilir
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BMIScreen()),
                  );
                  break;
                case 2:
                  // Ekle öğesine tıklandığında ekleme sayfasına yönlendirme yapılabilir
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjeScreen()),
                  );
                  break;
                case 3:
                  // Halter öğesine tıklandığında halter sayfasına yönlendirme yapılabilir
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomeScreen()),
                  );
                  break;
              }
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'BMI',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Ekle',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center),
                label: 'Halter',
              ),
            ],
          ),
        ),
      ),
    );
  }
}



