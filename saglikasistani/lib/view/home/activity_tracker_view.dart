import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/common_widget/today_target_cell.dart';
import 'package:saglikasistani/view/login/signup_firebase.dart';


class ActivityTrackerView extends StatefulWidget {
  var userResult;
  ActivityTrackerView(this.userResult, {Key? key}) : super(key: key);

  @override
  State<ActivityTrackerView> createState() => _ActivityTrackerViewState();
}

class _ActivityTrackerViewState extends State<ActivityTrackerView> {
    int touchedIndex = -1;
    final TextEditingController _textEditingController = TextEditingController();
    String water="0";
    String steps="0";

  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var name1 = widget.userResult;
    water = await readField(name1,"water");
    steps = await readField(name1,"steps");
    setState(() {
      water = water;
      steps = steps;
    });
  }

  List latestArr = [
    {
      "image": "assets/img/pic_4.png",
      "title": "Drinking 300ml Water",
      "time": "About 1 minutes ago"
    },
    {
      "image": "assets/img/pic_5.png",
      "title": "Eat Snack (Fitbar)",
      "time": "About 3 hours ago"
    },
  ];

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
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Activity Tracker",
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
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),


      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.blue.withOpacity(0.3),
                    Colors.blueAccent.withOpacity(0.3)
                  ]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Bugün Hedefi",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue, Colors.blueAccent],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: MaterialButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('Günlük Aktivite Girişi'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: _textEditingController,
                                              decoration: InputDecoration(
                                                labelText: 'Ne kadar su içtin? (LT)',
                                              ),
                                            ),
                                            TextField(
                                              controller: _textEditingController,
                                              decoration: InputDecoration(
                                                labelText: 'Kaç adım attın?',
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('İptal'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              String waterData = _textEditingController.text;
                                              String stepsData = _textEditingController.text;
                                              setState(() {
                                                saveWater(waterData, widget.userResult);
                                                saveFoot(stepsData, widget.userResult);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Tamam'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                padding: EdgeInsets.zero,
                                height: 30,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                textColor: Colors.white,
                                minWidth: double.maxFinite,
                                elevation: 0,
                                color: Colors.transparent,
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TodayTargetCell(
                            icon: "assets/img/water.png",
                            value: "$water L",
                            title: "Su alımı",
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TodayTargetCell(
                            icon: "assets/img/foot.png",
                            value: "$steps",
                            title: "Adım Sayısı",
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: Image.asset('assets/img/dog.png', height: 100)),
                        SizedBox(width: 20),
                        Expanded(child: Image.asset('assets/img/walk.png', height: 100)),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      
                        SizedBox(width: 20),
                        Expanded(child: Image.asset('assets/img/drink1.png', height: 100)),
                        SizedBox(width: 20),
                        Expanded(child: Image.asset('assets/img/drink2.png', height: 100)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      
    );
  }

}
