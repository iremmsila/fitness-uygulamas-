import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/common_widget/notification_row.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  List notificationArr = [
    {"image": "assets/img/Workout1.png", "title": "Hey, öğle yemeği zamanı", "time": "Yaklaşık 1 dakika önce"},
    {"image": "assets/img/Workout2.png", "title": "Alt vücut antrenmanınızı kaçırmayın", "time": "Yaklaşık 3 saat önce"},
    {"image": "assets/img/Workout3.png", "title": "Hey, hadi senin için biraz yemek ekleyelim", "time": "Yaklaşık 3 saat önce"},
    {"image": "assets/img/Workout1.png", "title": "Tebrikler, A'yı bitirdiniz..", "time": "29 Mayıs"},
    {"image": "assets/img/Workout2.png", "title": "Hey, öğle yemeği zamanı", "time": "8 Nisan"},
    {"image": "assets/img/Workout3.png", "title": "Ups, Lowerbo'yu kaçırdın...", "time": "8 Nisan"},
  ];

  @override
  Widget build(BuildContext context) {
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
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Bildirim",
          style: TextStyle(
              color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: TColor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        itemBuilder: ((context, index) {
          var nObj = notificationArr[index] as Map? ?? {};
          return NotificationRow(nObj: nObj);
      }), separatorBuilder: (context, index){
        return Divider(color: TColor.gray.withOpacity(0.5), height: 1, );
      }, itemCount: notificationArr.length),
    );
  }
}
