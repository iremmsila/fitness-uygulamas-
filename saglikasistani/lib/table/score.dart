import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final String userId; // Kullanıcının giriş yaptığı ID
  final int point;
  Score({required this.userId, required this.point});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Kullanıcının giriş yaptığı ID ile eşleşen belgeyi Firestore'dan al
            FirebaseFirestore.instance.collection('Users').doc(userId).get().then((doc) {
              if (doc.exists) {
                // Belge bulunduğunda, belgeyi güncelleyerek yeni veriyi kaydet
                FirebaseFirestore.instance.collection('Users').doc(userId).update({
                  'score': point, // Yeni alan ve değeri
                }).then((_) {
                  print('Veri başarıyla güncellendi.');
                }).catchError((error) {
                  print('Hata: $error');
                });
              } else {
                print('Belge bulunamadı.');
              }
            }).catchError((error) {
              print('Hata: $error');
            });
          },
          child: Text('Veriyi Kaydet'),
        ),
      ),
    );
  }
}
