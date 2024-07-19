import 'package:cloud_firestore/cloud_firestore.dart';


void addDataToFirestore(var user,String firstname, String lastname, String email, String password) async{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
    await _firestore.collection("Users")
    .doc(user.user?.uid)
    .set({
      'firstName' : firstname,
      'lastName' : lastname,
      'email' : email,
      'password' : password,

    });
  }


void saveSelectedGender(dynamic gender, var user) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentReference documentReference = _firestore.collection('Users').doc(user);

    await documentReference.update({
      'gender': gender
    });

  }


  
void saveScore(dynamic newScore, var user) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentReference documentReference = _firestore.collection('Users').doc(user);

  // Firestore'dan mevcut skoru al
  DocumentSnapshot snapshot = await documentReference.get();

  if (snapshot.exists) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    var currentScore = data?['score'] ?? 0;

    // Yeni skoru mevcut skora ekle
    var updatedScore = currentScore + newScore;

    // Güncellenmiş skoru Firestore'a kaydet
    await documentReference.update({
      'score': updatedScore
    });
  } else {
    // Eğer doküman yoksa, yeni bir doküman oluştur ve skoru ayarla
    await documentReference.set({
      'score': newScore
    });
  }
}



void  saveSelectedDate(String date, var user) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentReference documentReference = _firestore.collection('Users').doc(user);

    await documentReference.update({
      'date': date,
    });

  }

  void  saveSelectedWeight(String weight, var user) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentReference documentReference = _firestore.collection('Users').doc(user);

    await documentReference.update({
      'weight': weight,
    });
  }

void saveSelectedHeight(String height, var user) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentReference documentReference = _firestore.collection('Users').doc(user);

    await documentReference.update({
      'height': height,
    });
  }

  Future<String> readField(var user, String field) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String fieldName="1";

    try {
      // Firestore koleksiyonundan belirli bir belgeyi okuma
      DocumentSnapshot documentSnapshot =
          await firestore.collection('Users').doc(user).get();

      // Belge içindeki belirli bir alanı çekme
      fieldName = documentSnapshot[field];

      if (fieldName != null) {
        // Çekilen alanı kullan
        print('Çekilen Alan: $fieldName');
      } else {
        print('Belge veya alan bulunamadı.');
        fieldName = "1";
      }
    } catch (e) {
      print('Hata oluştu: $e');
    }
    return fieldName;
  }

  
  Future<String> readindex(var user) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    double index;
    String endeks = "";
    String weight="";
    String height="";

    try {
      // Firestore koleksiyonundan belirli bir belgeyi okuma
      DocumentSnapshot documentSnapshot =
          await firestore.collection('Users').doc(user).get();

      // Belge içindeki belirli bir alanı çekme
      weight = documentSnapshot['weight'];
      height = documentSnapshot['height'];
      print(weight);
      print(height);
      int weight_ = int.parse(weight);
      double height_ = double.parse(height);
      double total;

      total = height_*height_;
      index = (weight_/total);
      print(index);
      endeks = index.toStringAsFixed(2);
      if (weight != null) {
        // Çekilen alanı kullan
        print('Çekilen Alan: $weight');
        if (height != null) {
        // Çekilen alanı kullan
        print('Çekilen Alan: $height');
      } else {
        print('Belge veya alan bulunamadı.');
      }
      } else {
        print('Belge veya alan bulunamadı.');
      }
    } catch (e) {
      print('Hata oluştu: $e');
    }
    return endeks;
  }


  String readindextext(String endeks){
  String endeksText="";
  double? endeks_ = double.tryParse(endeks);
  if(endeks_ != null){
    if(endeks_ < 18.5){
      endeksText="İdeal kilo altında";
    }
    else if(endeks_ < 24.9){
      endeksText="İdeal kiloda";
    }
    else if(endeks_ < 29.9){
      endeksText="İdeal kilonun üstü";
    }
    else if(endeks_ < 39.9){
      endeksText="İdeal kilonun aşırı üstü (obez)";
    }
    else{
      endeksText="İdeal kilonun çok üstü (morbid obez)";
    }
  }
  else {
    endeksText = "Geçersiz endeks değeri";
  }
  return endeksText;
}


void saveWater(String water, var user) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentReference documentReference = _firestore.collection('Users').doc(user);

    await documentReference.update({
      'water': water,
    });

  }

  void saveFoot(String steps, var user) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DocumentReference documentReference = _firestore.collection('Users').doc(user);

    await documentReference.update({
      'steps': steps,
    });

  }
/*
  final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<User?> signInWithGoogle() async {
  try {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    assert(!user!.isAnonymous);
    assert(await user!.getIdToken() != null);

    final User? currentUser = _auth.currentUser;
    assert(user!.uid == currentUser!.uid);

    return user;
  } catch (error) {
    print("Google sign in error: $error");
    return null;
  }
}



Future<User?> registerWithGoogle() async {
  try {
    // Google hesabıyla giriş yap
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;

    // Firebase Authentication için Google kimlik bilgilerini al
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    // Firebase Authentication ile kullanıcıyı kayıt olma işlemi
    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    // Yeni kayıt olan kullanıcının bilgileri burada işlenebilir

    return user;
  } catch (error) {
    print("Google ile kayıt olurken hata oluştu: $error");
    return null;
  }
}

*/