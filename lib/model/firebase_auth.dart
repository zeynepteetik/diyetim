import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService { 
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyonu
  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }



  //kayıt ol fonksiyonu
  Future<User?> createPerson(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword( //girilendeğer ile auth a değer oluşturur
        email: email, password: password);

    await _firestore
        .collection("Person")
        .doc(user.user!.uid)
        .set({'userName': name, 'email': email});

    return user.user;
  }

  register(String text, String text2) {}
}