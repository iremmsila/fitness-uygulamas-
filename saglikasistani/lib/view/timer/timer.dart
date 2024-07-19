import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:saglikasistani/view/home/finished_workout_view.dart';
import 'package:saglikasistani/view/login/signup_firebase.dart';
import 'package:vibration/vibration.dart';

class TimerPickerExample extends StatefulWidget {
  var userResult;
  TimerPickerExample(this.userResult, {Key? key}) : super(key: key);

  @override
  _TimerPickerExampleState createState() => _TimerPickerExampleState();
}

class _TimerPickerExampleState extends State<TimerPickerExample> {
  int selectedMinutes = 1;
  Timer? _timer;
  int remainingSeconds = 0;
  AudioPlayer audioPlayer = AudioPlayer();
  bool _showAnimation = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _startTimer() {
    setState(() {
      remainingSeconds = selectedMinutes * 60;
      _showAnimation = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
        _navigateToFinishedWorkoutView();
        _playCompletionSound();
        _vibrate();
        _showCompletionAnimation();
        saveScore(selectedMinutes * 5, widget.userResult);
        //_updateScoreInFirestore();
      }
    });
  }

  void _navigateToFinishedWorkoutView() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => FinishedWorkoutView()),
    );
  }

  void _playCompletionSound() async {
    await audioPlayer.play(AssetSource('sounds/completion_sound.mp3'));
  }

  void _vibrate() {
    if (Vibration.hasVibrator() != null) {
      Vibration.vibrate(duration: 1000);
    }
  }

  void _showCompletionAnimation() {
    setState(() {
      _showAnimation = true;
    });
  }

Future<void> _updateScoreInFirestore() async {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DocumentReference userDoc = _firestore.collection('Users').doc(widget.userResult);

  await _firestore.runTransaction((transaction) async {
    DocumentSnapshot snapshot = await transaction.get(userDoc);

    if (!snapshot.exists) {
      transaction.set(userDoc, {'score': 0});
    } else {
      int currentScore = int.parse(snapshot['score'].toString()); // Score alanını int'e çevirin
      transaction.update(userDoc, {'score': (currentScore + selectedMinutes * 5)}); // Score'u String olarak güncelleyin
    }
  });
}



  @override
  void dispose() {
    _timer?.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ÖZEL TEKRARLAR'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: Image.asset('assets/img/gymnast.png', height: 100)),
                        SizedBox(width: 20),
                        Expanded(child: Image.asset('assets/img/sport-girl.png', height: 100)),
                        SizedBox(width: 20),
                        Expanded(child: Image.asset('assets/img/pull-up.png', height: 100)),
                        SizedBox(width: 20),
                        Expanded(child: Image.asset('assets/img/sport-girl (1).png', height: 100)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: CupertinoPicker.builder(
                  itemExtent: 40,
                  selectionOverlay: Container(
                    width: double.maxFinite,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
                        bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
                      ),
                    ),
                  ),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedMinutes = index + 1;
                    });
                  },
                  childCount: 60,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/burn.png",
                          width: 15,
                          height: 15,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          " ${(index + 1) * 15} Kalori Yak",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          " ${index + 1} ",
                          style: TextStyle(color: Colors.grey, fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          " dakika",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _startTimer,
                child: Text('Sayaç Başlat (${selectedMinutes} dakika)'),
              ),
              SizedBox(height: 20),
              Text(
                'Kalan Süre: ${remainingSeconds ~/ 60}:${(remainingSeconds % 60).toString().padLeft(2, '0')}',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          if (_showAnimation)
            Center(
              child: Container(
                width: 200,
                height: 200,
                child: RiveAnimation.asset(
                  'assets/animations/completion_animation.json',
                  fit: BoxFit.cover,
                  onInit: (_) => setState(() {
                    Future.delayed(Duration(seconds: 3), () {
                      setState(() {
                        _showAnimation = false;
                      });
                    });
                  }),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
