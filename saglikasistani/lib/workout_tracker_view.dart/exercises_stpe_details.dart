import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:video_player/video_player.dart';

import '../../common_widget/round_button.dart';

class ExercisesStepDetails extends StatefulWidget {
  final Map dObj;
  final String userResult;
  ExercisesStepDetails({super.key, required this.dObj, required this.userResult});

  @override
  State<ExercisesStepDetails> createState() => _ExercisesStepDetailsState();
}

class _ExercisesStepDetailsState extends State<ExercisesStepDetails> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _updateScoreInFirestore() async {
    final DocumentReference userDoc = _firestore.collection('Users').doc(widget.userResult);

    await _firestore.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(userDoc);

      if (!snapshot.exists) {
        transaction.set(userDoc, {'score': 0});
      } else {
        int currentScore = snapshot['score'];
        transaction.update(userDoc, {'score': currentScore + 25});
      }
    });

    // Skoru güncelledikten sonra videoya yönlendir
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(videoUrl: widget.dObj["url"]),
      ),
    );
  }

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
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/img/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
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
                "assets/img/more.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      widget.dObj["image2"],
                      width: media.width,
                      height: media.width,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.55,
                    decoration: BoxDecoration(
                        color: TColor.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                "HEHEY",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                "Kolay | 390 Kalori Yakar",
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Açıklamalar",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              ReadMoreText(
                'Çalışan Kaslar: Tüm Vücut ▸ Süre: 25 Dakika + soğuma esnemeleri ▸ Ekipman: Yalnızca Vücut Ağırlığı, Hayır Ekipman Antrenmanı: ▸ 1. Tur: 40 saniye açık, 10 saniye kapalı Ayakta Vale 4 Mekik + 4 Çömelme Darbesi Squat Yürüyerek Uzan Yukarı ve Aşağı Plank Yan Basamaklar Yukarı Şınav + Çocuk Pozu Bölünmüş Squat R Bölünmüş Squat L Bir Adım Geri Burpee Plank Toe Tap Squat + Crunch Yavaş Tırmanışlar Squat + 3 saniye tutma Omuz Vuruşları Süpermen Şınav Alçak Plank Bacak Kaldırma ▸ 2. Tur: 30 saniye açık, 10 saniye kapalı Egzersiz Sırta Yaslanma Vücut Bükülmeleri Uzanma + Diz Sarılma Bacakları Yukarı Aşağı Ab Tutma 1 Bacak Kalça Köprüsü R 1 Bacak Kalça Köprüsü Darbeleri R 1 Bacak Kalça Köprüsü Darbeleri L 1 Bacak Kalça Köprüsü Darbeleri L Geri Adım Burpee + 2 Yumruk Bacak Kaldırma + Şınav R Bacak Kaldırma + Şınav L Plank Ön Arka Yürüyüş Düşük Plank Dips Düşük Plank Tutma ▸ Soğuma 30 sn açık, 10 saniye kapalı Çocuk Duruşu Derin Hamle R Derin Hamle L Nefes Alın Nefes Verin Lütfen hepimizin farklı olduğunu ve bunu kendi antrenmanınız haline getirebileceğinizi unutmayın ♡ İhtiyaç duyduğunuzda daha uzun bir ara verin.',
                trimLines: 4,
                colorClickableText: TColor.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Devamını oku...',
                trimExpandedText: ' Az oku',
                style: TextStyle(
                  color: TColor.gray,
                  fontSize: 12,
                ),
                moreStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 15),
              SizedBox(height: media.width * 0.1),
              SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: media.width * 0.05),
                    RoundButton(
                      title: "Başla!",
                      onPressed: _updateScoreInFirestore,
                    ),
                    SizedBox(height: media.width * 0.1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown after the video is initialized.
      }).catchError((error) {
        print('Video initialization error: $error');
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Oynatıcı'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
