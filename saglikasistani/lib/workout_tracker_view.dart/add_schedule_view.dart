/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';

import '../../common/common.dart';
import '../../common_widget/icon_title_next_row.dart';
import '../../common_widget/round_button.dart';

class AddScheduleView extends StatefulWidget {
  final DateTime date;
  final String ttitle;
  final String userResult;
  const AddScheduleView({Key? key, required this.date, required this.ttitle, required this.userResult}) : super(key: key);

  @override
  State<AddScheduleView> createState() => _AddScheduleViewState();
}

class _AddScheduleViewState extends State<AddScheduleView> {
  DateTime selectedDateTime = DateTime.now();
  late int selectedHour;
  late int selectedMinute;
  late int selectedDay;
  late int selectedMonth;
  late int selectedYear;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TColor.lightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/img/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Program Ekle",
          style: TextStyle(color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: TColor.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/img/date.png",
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  dateToString(widget.date, formatStr: "E, dd MMMM yyyy"),
                  style: TextStyle(color: TColor.black, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Zaman",
              style: TextStyle(color: TColor.black, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: media.width * 0.45,
              child: CupertinoDatePicker(
                onDateTimeChanged: (newDate) {
                  setState(() {
                    selectedDateTime = newDate.toLocal();
                    selectedHour = selectedDateTime.hour;
                    selectedMinute = selectedDateTime.minute;
                    selectedDay = selectedDateTime.day;
                    selectedMonth = selectedDateTime.month;
                    selectedYear = selectedDateTime.year;
                    //selectedTime = selectedDateTime.toLocal()
                  });
                },
                initialDateTime: DateTime.now(),
                use24hFormat: false,
                minuteInterval: 1,
                mode: CupertinoDatePickerMode.time,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Antrenman Ayrıntıları",
              style: TextStyle(color: TColor.black, fontSize: 19, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 22),
            IconTitleNextRow(
              icon: "assets/img/choose_workout.png",
              title: "Antrenmanı Seçin",
              time: "Üst Vücut",
              color: TColor.secondaryColor1.withOpacity(0.3),
              timeOptions: const ["Üst Vücut", 'Alt Vücut', 'Karın'],
              onPressed: () {
              },
              
            ),
            const SizedBox(height: 20),
            IconTitleNextRow(
              icon: "assets/img/difficulity.png",
              title: "Zorluk",
              time: "Acemi",
              color: TColor.primaryColor1.withOpacity(0.3),
              timeOptions: const ['Acemi','Gelişmiş'],
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Spacer(),
            RoundButton(
              title: "Kaydet",
              onPressed: () {
                // Firestore'a veri ekleyen metodu çağır
                _addScheduleToFirestore( widget.userResult, widget.ttitle, selectedMinute, selectedHour, selectedDay, selectedMonth,selectedYear); //!!!

//

                //String userId = 'exampleUserId';
  DateTime date = DateTime.now();
  List<Map<String, dynamic>> activities = [
    {'name':  widget.ttitle, 'duration': selectedDateTime, },
  ];

  // Aktiviteleri ekleyin
  //firebaseService.addActivity(widget.userResult, selectedDateTime, activities,widget.ttitle);
  
/*
  // Kullanıcının aktivitelerini alın
  Stream<DocumentSnapshot> userActivitiesStream = firebaseService.getUserActivities(widget.userResult, date);
  userActivitiesStream.listen((DocumentSnapshot snapshot) {
    if (snapshot.exists) {
      print('Kullanıcının aktiviteleri: ${snapshot.data()}');
    } else {
      print('Kullanıcının bu tarih için aktiviteleri yok.');
    }
  });*/
                // Yönlendirme işlemi
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutScheduleView(
                      selectedTime: "$selectedHour:$selectedMinute PM",
                      selected: widget.title, userResult: '',
                    ),
                  ),
                );*/
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  

/////////
  Future<void> addActivity(String userId, DateTime date, List<Map<String, dynamic>> activities,String title) async {
    try {
      // Kullanıcının aktivitelerini içeren belgeyi oluşturun veya güncelleyin
      await _firestore.collection('Date').doc(userId).collection('activities').doc(_getDateId(date)).set({
        'date': date,
        'title': title,
        'activities': activities,
      });
      print('Aktiviteler başarıyla kaydedildi.');
    } catch (error) {
      print('Aktiviteler kaydedilirken hata oluştu: $error');
    }
  }

  String _getDateId(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  Stream<DocumentSnapshot> getUserActivities(String userId, DateTime date) {
    // Kullanıcının belirli bir tarihteki aktivitelerini izlemek için bir akış döndürün
    return _firestore.collection('Date').doc(userId).collection('activities').doc(_getDateId(date)).snapshots();
  }

/////////////////////////////////777
 /*   Future<void> _addScheduleToFirestore(String userId, String title, int selectedMinute, int selectedHour, int selectedDay, int selectedMonth, int selectedYear) async {
    
  try {
      FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
    await _firestore.collection("Date")
    .doc(userId)
    .set({
      'start_time': "$selectedDay/$selectedMonth/$selectedYear $selectedHour:$selectedMinute",
      //'hour': hour,
      //'minute': minute,
      'name': title,
      'userID': widget.userResult,
    });
    print("$selectedDay/$selectedMonth/$selectedYear $selectedHour:$selectedMinute");


    print('Program başarıyla eklendi');
  } catch (error) {
    print('Firestore\'a veri eklenirken hata oluştu: $error');
  }
}*/

// Future<void> _addScheduleToFirestore(String userId, String title, int selectedMinute, int selectedHour, int selectedDay, int selectedMonth, int selectedYear) async {
//   try {
//     FirebaseFirestore _firestore = FirebaseFirestore.instance;

//     // Firestore'da bir koleksiyon referansı oluşturun
//     CollectionReference schedules = _firestore.collection('schedules');

//     // Belirli bir kullanıcı için yeni bir belge oluşturun
//     await schedules.add({
//       'start_time': DateTime(selectedYear, selectedMonth, selectedDay, selectedHour, selectedMinute),
//       'name': title,
//       'userID': userId,
//     });

//     print('Program başarıyla eklendi');
//   } catch (error) {
//     print('Firestore\'a veri eklenirken hata oluştu: $error');
//   }
// }


Future<void> _addScheduleToFirestore(String userId, String title, int selectedMinute, int selectedHour, int selectedDay, int selectedMonth, int selectedYear, String timePeriod) async {
  try {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Firestore'da bir koleksiyon referansı oluşturun
    CollectionReference schedules = _firestore.collection('schedules');

    // Tarih ve saat bilgisini belirtilen formatta oluşturun
    String formattedDate = "$selectedDay/${selectedMonth.toString().padLeft(2, '0')}/$selectedYear";
    String formattedTime = "${selectedHour.toString().padLeft(2, '0')}:${selectedMinute.toString().padLeft(2, '0')} $timePeriod";

    // Belirli bir kullanıcı için yeni bir belge oluşturun
    await schedules.add({
      'start_time': "$formattedDate $formattedTime",
      'name': title,
      'userID': userId,
    });

    print('Program başarıyla eklendi');
  } catch (error) {
    print('Firestore\'a veri eklenirken hata oluştu: $error');
  }
}
}*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/common_widget/icon_title_next_row.dart';

import '../../common/common.dart';
import '../../common_widget/round_button.dart';

class AddScheduleView extends StatefulWidget {
  final DateTime date;
  final String ttitle;
  final String userResult;
  const AddScheduleView({
    Key? key,
    required this.date,
    required this.ttitle,
    required this.userResult,
  }) : super(key: key);

  @override
  State<AddScheduleView> createState() => _AddScheduleViewState();
}

class _AddScheduleViewState extends State<AddScheduleView> {
  DateTime selectedDateTime = DateTime.now();
  late int selectedHour;
  late int selectedMinute;
  late int selectedDay;
  late int selectedMonth;
  late int selectedYear;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: TColor.lightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/img/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Program Ekle",
          style: TextStyle(color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: TColor.white,
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/img/date.png",
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  dateToString(widget.date, formatStr: "E, dd MMMM yyyy"),
                  style: TextStyle(color: TColor.black, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Zaman",
              style: TextStyle(color: TColor.black, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: media.width * 0.45,
              child: CupertinoDatePicker(
                onDateTimeChanged: (newDate) {
                  setState(() {
                    selectedDateTime = newDate.toLocal();
                    selectedHour = selectedDateTime.hour;
                    selectedMinute = selectedDateTime.minute;
                    selectedDay = selectedDateTime.day;
                    selectedMonth = selectedDateTime.month;
                    selectedYear = selectedDateTime.year;
                  });
                },
                initialDateTime: DateTime.now(),
                use24hFormat: false,
                minuteInterval: 1,
                mode: CupertinoDatePickerMode.time,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Antrenman Ayrıntıları",
              style: TextStyle(color: TColor.black, fontSize: 19, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 22),
            Expanded(
              
              child: IconTitleNextRow(
              icon: "assets/img/choose_workout.png",
              title: "Antrenman",
              time: widget.ttitle,
              color: TColor.secondaryColor1.withOpacity(0.3),
              timeOptions: [widget.ttitle],
              onPressed: () {},
            ), ),
            const SizedBox(height: 20),
            IconTitleNextRow(
              icon: "assets/img/difficulity.png",
              title: "Zorluk",
              time: "Acemi",
              color: TColor.primaryColor1.withOpacity(0.3),
              timeOptions: const ["Acemi"],
              onPressed: () {},
            ),
            const SizedBox(height: 10),
            Spacer(),
            RoundButton(
              title: "Kaydet",
              onPressed: () {
                // Firestore'a veri ekleyen metodu çağır
                _addScheduleToFirestore(widget.userResult, widget.ttitle, selectedMinute, selectedHour, selectedDay, selectedMonth, selectedYear);
              },
            ),
          ],
        ),
      ),
    );
  }

  /*Future<void> _addScheduleToFirestore(String userId, String title, int selectedMinute, int selectedHour, int selectedDay, int selectedMonth, int selectedYear) async {
  try {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Saatin "AM" veya "PM" olup olmadığını kontrol edin
    String timePeriod = selectedHour < 12 ? 'AM' : 'PM';

    // Saat 12'den büyükse saat formatını düzeltin
    if (selectedHour > 12) {
      selectedHour -= 12;
    }

    // Firestore'da bir koleksiyon referansı oluşturun
    CollectionReference schedules = _firestore.collection('schedules');

    // Tarih ve saat bilgisini belirtilen formatta oluşturun
    String formattedDate = "$selectedDay/${selectedMonth.toString().padLeft(2, '0')}/$selectedYear";
    String formattedTime = "${selectedHour.toString().padLeft(2, '0')}:${selectedMinute.toString().padLeft(2, '0')} $timePeriod";

    // Belirli bir kullanıcı için yeni bir belge oluşturun
    await schedules.add({
      'start_time': "$formattedDate $formattedTime",
      'name': title,
      'userID': userId,
    });

    print('Program başarıyla eklendi');
  } catch (error) {
    print('Firestore\'a veri eklenirken hata oluştu: $error');
  }
}
*/

Future<void> _addScheduleToFirestore(String userId, String title, int selectedMinute, int selectedHour, int selectedDay, int selectedMonth, int selectedYear) async {
  try {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Saatin "AM" veya "PM" olup olmadığını kontrol edin
    String timePeriod = selectedHour < 12 ? 'AM' : 'PM';

    // Saat 12'den büyükse saat formatını düzeltin
    if (selectedHour > 12) {
      selectedHour -= 12;
    }

    // Gece yarısı saatini "12 AM" ve öğle saatini "12 PM" olarak düzeltin
    if (selectedHour == 0) {
      selectedHour = 12;
      timePeriod = 'AM';
    } else if (selectedHour == 12) {
      timePeriod = 'PM';
    }

    // Firestore'da bir koleksiyon referansı oluşturun
    CollectionReference schedules = _firestore.collection('schedules');

    // Tarih ve saat bilgisini belirtilen formatta oluşturun
    String formattedDate = "${selectedDay.toString().padLeft(2, '0')}/${selectedMonth.toString().padLeft(2, '0')}/$selectedYear";
    String formattedTime = "${selectedHour.toString().padLeft(2, '0')}:${selectedMinute.toString().padLeft(2, '0')} $timePeriod";

    // Belirli bir kullanıcı için yeni bir belge oluşturun
    await schedules.doc(userId).collection('userSchedules').add({
      'start_time': "$formattedDate $formattedTime",
      'name': title,
    });

    print('Program başarıyla eklendi');
  } catch (error) {
    print('Firestore\'a veri eklenirken hata oluştu: $error');
  }
}





}

