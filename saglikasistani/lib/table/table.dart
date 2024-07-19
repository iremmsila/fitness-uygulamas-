import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';

class TableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Lig Durumu'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<DocumentSnapshot> myList = snapshot.data!.docs;

            // Sort the list by score in descending order
            myList.sort((a, b) {
              var aScore = (a.data() as Map<String, dynamic>)['score'] ?? 0;
              var bScore = (b.data() as Map<String, dynamic>)['score'] ?? 0;
              return bScore.compareTo(aScore);
            });

            return SizedBox(
              height: 600,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                scrollDirection: Axis.vertical,
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  var cObj = myList[index].data() as Map<String, dynamic>;
                  String categoryName = cObj['firstName'] ?? ''; // Kategori adını al
                  int score = cObj['score'] ?? 0; // Skoru al ve null ise 0 yap
                  Color color = index % 2 == 0
                      ? TColor.primaryColor1.withOpacity(0.6)!
                      : TColor.secondaryColor1.withOpacity(0.6)!;
                  return InkWell(
                    onTap: () {
                      // Her bir kategori öğesi için tıklama işlemi
                      if (categoryName.isNotEmpty) {
                        // Kategoriye tıklama işlemleri burada gerçekleştirilir
                      } else {
                        print("Hata: Kategori adı bulunamadı veya null.");
                      }
                    },
                    child: Container(
                      // Container'ı indeksin tek ya da çift olmasına göre farklı renkte yapmak için color değişkenini kullanıyoruz
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: color,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // İlk üç veri için iconlar
                              if (index < 3) ...[
                                Icon(Icons.emoji_events, color: Colors.yellow), // Örnek icon
                                SizedBox(width: 8), // Boşluk ekleyin
                              ],
                              Text(categoryName, style: TextStyle(fontSize: 18)),
                            ],
                          ),
                          Text(score.toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
