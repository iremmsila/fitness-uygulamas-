import 'package:flutter/material.dart';
import 'package:saglikasistani/view/food/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  const FoodTile({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.only(left: 25, bottom: 250 ),
      padding: EdgeInsets.fromLTRB(45, 32, 45, 2),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            food.imagePath,
          height: 60,),

          Text(food.name,
          style: TextStyle(fontSize: 20),),

          Text(food.calories),

          
        ],
      ),
    );
  }
}