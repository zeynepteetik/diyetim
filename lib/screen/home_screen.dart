import 'package:flutter/material.dart';
import 'package:flutter_login_register/path_provider/path_provider.dart';
import 'package:flutter_login_register/screen/deneme2/bagis_yap.dart';
import 'package:flutter_login_register/screen/grafik.dart';
import 'package:flutter_login_register/screen/hareket.dart';
import 'package:flutter_login_register/screen/kvkk.dart';
import 'package:flutter_login_register/screen/login.dart';
import 'package:flutter_login_register/screen/motivasyon.dart';
import 'package:flutter_login_register/screen/profil.dart';
import 'package:flutter_login_register/screen/yemek.dart';
import 'package:flutter_login_register/toDo/ToDo/pages/home_page.dart';
import 'kitle.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
 
  List<String> imagePaths = [
    'assets/images/fitness.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
    'assets/images/image4.jpg',
    'assets/images/image5.jpg',
    'assets/images/image6.jpg',
    'assets/images/image7.jpg',
    'assets/images/image8.jpg',
    'assets/images/image9.jpg',
    'assets/images/image10.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Text('DİYETİM'),
          backgroundColor: Color.fromARGB(255, 255, 235, 59),
          actions: [],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(147, 255, 235, 59),
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
                title: Text('Liste Oluştur'),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return ProviderModel();
                    }),
                  );
                },
              ),
              ListTile(
                title: Text('Grafik'),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return GrafikScreen();
                    }),
                  );
                },
              ),
              ListTile(
                title: Text('Motivasyonum'),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return MotivasyonScreen();
                    }),
                  );
                },
              ),
              ListTile(
                title: Text('KVKK'),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return KVKKScreen();
                    }),
                  );
                },
              ),
              ListTile(
                title: Text('Profil'),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return ProfilePage();
                    }),
                  );
                },
              ),
              ListTile(
                title: Text('Çıkış yap'),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(20.0),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 20),
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
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
                    MaterialPageRoute(builder: (context) => HareketScreen()),
                  );
                  break;
                case 4:
                  // Sepet öğesine tıklandığında sepet sayfasına yönlendirme yapılabilir
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
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
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Sepet',
              ),
            ],
          ),
        ),
      ),
    );
  }
}