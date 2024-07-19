
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/common_widget/round_button.dart';
import 'package:saglikasistani/view/login/welcome_view.dart';

class WhatYourGoalView extends StatefulWidget {
  var userResult;
  WhatYourGoalView({super.key, required this.userResult});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  CarouselController buttonCarouselController = CarouselController();
  final formkey = GlobalKey<FormState>();
  List goalArr = [
    {
      "image": "assets/img/goal_1.png",
      "title": "Şekillenmek",
      "subtitle":
          "Vücut yağım az ve daha fazla\n kas geliştirmem gerekiyor istiyorum"
    },
    {
      "image": "assets/img/goal_2.png",
      "title": "Oransal",
      "subtitle":
          "Ben “zayıf şişmanım”. ince görünüyor ama şekli yok.\n Öğrenme kaslarını doğru şekilde\neklemek istiyorum"
    },
    {
      "image": "assets/img/goal_3.png",
      "title": "Yağ Kaybetmek",
      "subtitle":
          "Kaybedecek 20 kilodan fazla var. Bütün bu\n yağları eritmek ve kas kütlesi kazanmak istiyorum"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
          child: Form(
            key: formkey,
            child: Stack(
        children: [
          Center(
            child: CarouselSlider(
              items: goalArr
                  .map(
                    (gObj) => Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: TColor.primaryG,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: media.width * 0.1, horizontal: 10),
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Column(
                          children: [
                            Image.asset(
                              gObj["image"].toString(),
                              width: media.width * 0.88,
                              fit: BoxFit.fitWidth,
                            ),
                            SizedBox(
                              height: media.width * 0.1,
                            ),
                            Text(
                              gObj["title"].toString(),
                              style: TextStyle(
                                  color: TColor.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                              width: media.width * 0.3,
                              height: 1,
                              color: TColor.white,
                            ),
                            SizedBox(
                              height: media.width * 0.02,
                            ),
                            Text(
                              gObj["subtitle"].toString(),
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: TColor.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.70,
                aspectRatio: 0.90,
                initialPage: 0,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            width: media.width,
            child: Column(
              children: [
                SizedBox(
                  height: media.width * 0.04,
                ),
                Text(
                  "Hedeflerin ne ?",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Sizin için en iyi\nprogramı seçmemize yardımcı olacak",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: TColor.gray, fontSize: 14),
                ),
                const Spacer(),
                RoundButton(
                    title: "Onayla!",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeView(widget.userResult)
                              ));
                    }),
                    SizedBox(height: 25)
              ],
            ),
          )
        ],
      ))),
    );
  }
}