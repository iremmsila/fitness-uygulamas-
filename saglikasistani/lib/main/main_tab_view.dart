import 'package:flutter/material.dart';
import 'package:saglikasistani/common_widget/tab_button.dart';
import 'package:saglikasistani/profile/profile_view.dart';
import 'package:saglikasistani/table/table.dart';
import 'package:saglikasistani/view/food/foods_menu.dart';
import 'package:saglikasistani/view/home/home_view.dart';
import 'package:saglikasistani/view/timer/timer.dart';
import 'package:saglikasistani/workout_tracker_view.dart/workout_tracker_view.dart';

class MainTabView extends StatefulWidget {
  var userResult;
  MainTabView(this.userResult, {Key? key}) : super(key: key);

  List categoryArr = [
    {
      "name": "Salata",
      "image": "assets/img/c_1.png",
      //"route":"/lib/view/food/foods_menu.dart",
    },
    {
      "name": "Kek",
      "image": "assets/img/c_2.png",
      "route":"C:/Users/Lenovo/Desktop/flutter/saglikasistani/lib/view/food/foods_menu.dart",
    },
    {
      "name": "Turta",
      "image": "assets/img/c_3.png",
      "route":"C:/Users/Lenovo/Desktop/flutter/saglikasistani/lib/view/food/foods_menu.dart",
    },
    {
      "name": "Smoothie'ler",
      "image": "assets/img/c_4.png",
      "route":"C:/Users/Lenovo/Desktop/flutter/saglikasistani/lib/view/food/foods_menu.dart",
    },
    {
      "name": "Salata",
      "image": "assets/img/c_1.png",
      //"route":"/lib/view/food/foods_menu.dart",
    },
    {
      "name": "Kek",
      "image": "assets/img/c_2.png",
      "route":"C:/Users/Lenovo/Desktop/flutter/saglikasistani/lib/view/food/foods_menu.dart",
    },
    {
      "name": "Turta",
      "image": "assets/img/c_3.png",
      "route":"C:/Users/Lenovo/Desktop/flutter/saglikasistani/lib/view/food/foods_menu.dart",
    },
    {
      "name": "Smoothie'ler",
      "image": "assets/img/c_4.png",
      "route":"C:/Users/Lenovo/Desktop/flutter/saglikasistani/lib/view/food/foods_menu.dart",
    },
  ];



  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _selectTab = 0;
  late Widget _currentTab;

  @override
  void initState() {
    super.initState();
    _currentTab = HomeView(widget.userResult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //backgroundColor: Colors.transparent,
      body: _currentTab,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 110,
        
        padding: EdgeInsets.fromLTRB(20, 0, 20, 35),
        
        //elevation: 10.0, //????????????
        surfaceTintColor: Colors.transparent,
        color: Colors.transparent,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            elevation: 600,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              TabButton(
                icon: "assets/img/home_tab.png",
                selectIcon: "assets/img/home_tab_select.png",
                isActive: _selectTab == 0,
                onTap: () {
                  _selectTab = 0;
                  _currentTab = HomeView(widget.userResult);
                  setState(() {});
                },
              ),
              TabButton(
                icon: "assets/img/activity_tab.png",
                selectIcon: "assets/img/activity_tab_select.png",
                isActive: _selectTab == 1,
                onTap: () {
                  _selectTab = 1;
                  _currentTab = WorkoutTrackerView(widget.userResult);
                  setState(() {});
                },
              ),
              TabButton(
                icon: "assets/img/football1.png",
                selectIcon: "assets/img/football.png",
                isActive: _selectTab == 2,
                onTap: () {
                  _selectTab = 2;
                  _currentTab = TableView();//myList: widget.categoryArr);
                  setState(() {});
                },
              ),
              // Diğer sekmeler buraya eklenebilir
              TabButton(
                icon: "assets/img/profile_tab.png",
                selectIcon: "assets/img/profile_tab_select.png",
                isActive: _selectTab == 3,
                onTap: () {
                  _selectTab = 3;
                  _currentTab = ProfileView(widget.userResult);
                  setState(() {});
                },
              ),
              TabButton(
                icon: "assets/img/fork.png",
                selectIcon: "assets/img/fork1.png",
                isActive: _selectTab == 4,
                onTap: () {
                  _selectTab = 4;
                  _currentTab = MenuPage();
                  setState(() {});
                },
              ),

              /*TabButton(
                icon: "assets/img/fork.png",
                selectIcon: "assets/img/fork1.png",
                isActive: _selectTab == 5,
                onTap: () {
                  _selectTab = 5;
                  _currentTab = Notifications();
                  setState(() {});
                },
              ),*/

              TabButton(
                icon: "assets/img/stopwatch.png",
                selectIcon: "assets/img/stopwatch1.png",
                isActive: _selectTab == 6,
                onTap: () {
                  _selectTab = 6;
                  _currentTab = TimerPickerExample(widget.userResult);//myList: widget.categoryArr);
                  setState(() {});
                },
              ),

            ],
            ))
          ),
        ),
      //),
    );
  }
}
