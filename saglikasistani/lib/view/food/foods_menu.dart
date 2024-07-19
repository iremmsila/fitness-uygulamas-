import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/view/food/deails.dart';
import 'package:saglikasistani/view/food/food.dart';
import 'package:saglikasistani/view/food/food_tile.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  List foodMenu = [
    
    Food(name: "armut", calories: "145 cal", imagePath: "assets/img/pear.png"),
    Food(name: "elma", calories: "145 cal", imagePath: "assets/img/apple.png"),
    Food(name: "muz", calories: "145 cal", imagePath: "assets/img/banana.png"),
    Food(name: "çikolata", calories: "145 cal", imagePath: "assets/img/chocolate.png"),
    Food(name: "bitter çikolata", calories: "145 cal", imagePath: "assets/img/chocolate1.png"),
    Food(name: "çilek", calories: "145 cal", imagePath: "assets/img/strawberry.png"),
    Food(name: "tavuk", calories: "145 cal", imagePath: "assets/img/chickenleg.png"),
    Food(name: "sosis", calories: "145 cal", imagePath: "assets/img/sausage.png"),
    Food(name: "et", calories: "145 cal", imagePath: "assets/img/meat.png"),
    Food(name: "kurabiye", calories: "145 cal", imagePath: "assets/img/cookie.png"),
    Food(name: "dondurma", calories: "145 cal", imagePath: "assets/img/icecream.png"),
    Food(name: "bubble tea", calories: "145 cal", imagePath: "assets/img/bubbletea.png"),
    Food(name: "çay", calories: "145 cal", imagePath: "assets/img/tea.png"),
    Food(name: "yoğurt", calories: "145 cal", imagePath: "assets/img/yogurt.png"),
    Food(name: "salata", calories: "145 cal", imagePath: "assets/img/c_1.png"),
    Food(name: "pankek", calories: "145 cal", imagePath: "assets/img/c_2.png"),
    Food(name: "turta", calories: "145 cal", imagePath: "assets/img/c_3.png"),
    Food(name: "portakal", calories: "145 cal", imagePath: "assets/img/c_4.png"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.lightGray,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
       // leading: Icon(
         // Icons.menu,
          //color: Colors.black,
     //   ),
        title: Text(
          'DİYETTE KAL!',
          style: TextStyle(color: TColor.black),
        ),
      ),
      body: Expanded(child:
      Column(
        children: [
          Container(
            decoration: BoxDecoration(color: TColor.primaryColor1.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30)),
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.all(35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("İYİ BESLEN! \n KENDİNE BİR İYİLİK YAP!", style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),),
                  SizedBox(height: 16,),
                  Container(
                    decoration: BoxDecoration(color: TColor.primaryColor1,
                    borderRadius: BorderRadius.circular(20)),
                    child: TextButton(onPressed: (){
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MealFoodDetails(),
                            ),
                          );
                    },
                  child: Row(
                    children: [
                      Text("Daha Fazla", ),
                      Icon(Icons.arrow_forward)
                    ],
                  ))
                  )
                ],
              ),
              SizedBox(width: 16,),
              Expanded(child: Image.asset('assets/img/diet4.png',
              height: 100,),),
            ],),
          ),
          SizedBox(height: 22,),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 25),
          //   child: TextField(
          //     decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //       borderSide: BorderSide(color: TColor.gray),
          //       borderRadius: BorderRadius.circular(12)),
          //     focusedBorder: OutlineInputBorder(
          //       borderSide: BorderSide(color: TColor.gray),
          //       borderRadius: BorderRadius.circular(22)
          //       ),
          //       enabledBorder: OutlineInputBorder(
          //         borderSide: BorderSide(color: TColor.gray),
          //       borderRadius: BorderRadius.circular(22)),
          //       hintText: "search",
          //       ),
          //     ),
          //   ),
            SizedBox(height: 12,),

            Text("Önerilen yiyecekler", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ),),
            SizedBox(height: 12,),
            Expanded(child:
            ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
              itemBuilder: (context, index) => FoodTile(
              food: foodMenu[index],
            ),)),
        ],
      ),)
      
    );
  }
}/*
Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(22)
            ),
            margin: EdgeInsets.only(left: 22, right: 22),
            padding: EdgeInsets.all(22),
            child: Row(
              children: [
                Image.asset('assets/img/f_2.png', height: 10,),
                Column(
                  children: [
                    Text('lkdsjflkfd')


                  ],
                )
              ],
            ),
          )*/