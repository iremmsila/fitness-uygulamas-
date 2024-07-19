import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:saglikasistani/view/login/complete_profileview.dart';


class stepCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> _signInWithGoogle(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    try {
      // Google ile giriş yap
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult = await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
        return user;
      }
    } catch (error) {
      print('Google ile giriş yaparken hata oluştu: $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google ile Giriş')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final User? user = await _signInWithGoogle(context);
            if (user != null) {
              // Giriş başarılı, başka bir sayfaya yönlendir
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CompleteProfileView(userResult: user,)),
              );
            } else {
              // Giriş başarısız
              print('Giriş başarısız');
            }
          },
          child: Text('Google ile Giriş Yap'),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ana Sayfa')),
      body: Center(
        child: Text('Hoş geldiniz, ${user.displayName}!'),
      ),
    );
  }
}


/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(stepCounter());
}

class stepCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Google Adım Sayar Verileri')),
        body: Center(
          child: ElevatedButton(
            onPressed: () => signInWithGoogle(context),
            child: const Text('Google ile Giriş Yap'),
          ),
        ),
      ),
    );
  }

  Future<void> signInWithGoogle(BuildContext context) async {
  try {
    // Google ile giriş yap
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult = await _firebaseAuth.signInWithCredential(credential);
      final User? user = authResult.user;
      if (user != null) {
        // Kullanıcının bilgilerini Firestore'a kaydet
        await _saveUserDataToFirestore(user);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WelcomeView(user.uid)),
          );
      }
    }
  } catch (error) {
    print('Google ile giriş yaparken hata oluştu: $error');
  }
}

Future<void> _saveUserDataToFirestore(User user) async {
  // Firestore'a kullanıcı bilgilerini kaydet
  await _firestore.collection('Users').doc(user.uid).set({
    'uid': user.uid,
    'email': user.email,
    // Diğer kullanıcı bilgilerini buraya ekleyebilirsiniz
  });
}

/*
  Future<void> _listenToSteps(User user) async {
    // Adım sayacını başlat
    final Stream<StepCount> stepCountStream = Pedometer.stepCountStream;
    StreamSubscription<StepCount>? _subscription;
    _subscription = stepCountStream.listen((StepCount event) async {
      print('Adım sayısı: ${event.steps}');

      // Firestore'a adım sayısını kaydet
      await FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
        'step_count': event.steps,
        'timestamp': FieldValue.serverTimestamp(),
      });
    });
  }*/
}
*/