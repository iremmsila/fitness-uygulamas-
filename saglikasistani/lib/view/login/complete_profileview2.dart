import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/common_widget/round_button.dart';
import 'package:saglikasistani/common_widget/round_textField.dart';
import 'package:saglikasistani/view/login/signup_firebase.dart';
import 'package:saglikasistani/view/login/what_your_goal_view.dart';

// ignore: must_be_immutable
class CompleteProfileViewTwo extends StatefulWidget {
  var userResult;
  CompleteProfileViewTwo({super.key, required this.userResult});

  @override
  State<CompleteProfileViewTwo> createState() => _CompleteProfileViewTwoState();
}

class _CompleteProfileViewTwoState extends State<CompleteProfileViewTwo> {
  TextEditingController txtDate = TextEditingController();
  TextEditingController txtDate2 = TextEditingController();
  late String s_weight="";
  late String s_height="";
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formkey,
              child: Column(
              children: [
                Image.asset(
                  "assets/img/complete_profile.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Profilinizi tamamlayalım",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Hakkınızda daha fazla bilgi edinmemize yardımcı olacak!",
                  style: TextStyle(color: TColor.gray, fontSize: 12),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              
                              controller: txtDate,
                              hitText: "60",
                              icon: "assets/img/weight.png",
                              validator: (value){
                    if(value!.isEmpty){
                      return "bilgileri eksiksiz doldurunuz";
                    }
                    else{}
                  },
                  onSaved: (value){
                    s_weight = value!;
                  },
                            ),
                          ),
                          //await saveSelectedHeight(txtDate as String, widget.userResult),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.secondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "KG",
                              style:
                                  TextStyle(color: TColor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              
                              controller: txtDate2,
                              hitText: "1.70",
                              icon: "assets/img/hight.png",
                              validator: (value){
                    if(value!.isEmpty){
                      return "bilgileri eksiksiz doldurunuz";
                    }
                    else{}
                  },
                  onSaved: (value){
                    s_height = value!;
                  },
                            ),
                          ),
                          //saveSelectedHeight(txtDate as String, widget.userResult),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: TColor.secondaryG,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "CM",
                              style:
                                  TextStyle(color: TColor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      RoundButton(
                        title: "Sonraki >",
                        onPressed: () async {
                  if(formkey.currentState!.validate()){
                        formkey.currentState!.save();
                        try {
                          saveSelectedHeight(s_height, widget.userResult);
                          saveSelectedWeight(s_weight, widget.userResult);
                          print(widget.userResult);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content:
                            Text("Kayıt işlemi başarı ile gerçekleştirildi!"),),
                          );
                          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WhatYourGoalView(userResult:widget.userResult,)));
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                      else
                      {}
                }),
                    ],)
                  ),
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
