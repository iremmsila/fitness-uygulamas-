import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


Future<User?> signInWithGoogle() async{
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication gAuth = await gUser!.authentication;

  final credential = GoogleAuthProvider.credential(accessToken: gAuth.accessToken, idToken: gAuth.idToken);

  final UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);

  return userCredential?.user;
}