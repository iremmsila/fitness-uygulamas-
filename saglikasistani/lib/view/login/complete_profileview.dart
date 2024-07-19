import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/common_widget/round_button.dart';
import 'package:saglikasistani/common_widget/round_textField.dart';
import 'package:saglikasistani/view/login/complete_profileview2.dart';
import 'package:saglikasistani/view/login/signup_firebase.dart';

// ignore: must_be_immutable
class CompleteProfileView extends StatefulWidget {
  var userResult;
  CompleteProfileView({super.key, required this.userResult});

  @override
  State<CompleteProfileView> createState() => _CompleteProfileViewState();
}

class _CompleteProfileViewState extends State<CompleteProfileView> {
  TextEditingController txtDate = TextEditingController();
  String selectedGender = "Erkek";
  final formkey = GlobalKey<FormState>();
  late String date = "";

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
                      Container(
                          decoration: BoxDecoration(
                              color: TColor.lightGray,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: 50,
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(horizontal: 15),
                                  
                                  child: Image.asset(
                                    "assets/img/gender.png",
                                    width: 20,
                                    height: 20,
                                    fit: BoxFit.contain,
                                    color: TColor.gray,
                                  )),
                            
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: selectedGender,
                                    items: ["Erkek", "Kadın"]
                                        .map((name) => DropdownMenuItem(
                                              value: name,
                                              child: Text(
                                                name,
                                                style: TextStyle(
                                                    color: TColor.gray,
                                                    fontSize: 14),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value.toString();
                                      });
                                    },
                                    isExpanded: true,
                                    hint: Text(
                                      "Cinsiyet Seçiniz",
                                      style: TextStyle(
                                          color: TColor.gray, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),

                            const SizedBox(width: 12,)

                            ],
                          ),),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      RoundTextField(
                        
                        controller: txtDate,
                        hitText: "10.10.1999",
                        icon: "assets/img/date.png",
                        validator: (value) {
    if (value!.isEmpty) {
      return "Bilgileri eksiksiz doldurunuz";
    } else {
      // Eğer değer boş değilse, herhangi bir hata döndürmeyiz.
      return null;
    }
  },
  onSaved: (value){
                        date = value!;
                        },
                      ),
                      //await saveSelectedDate(txtDate as String , widget.userResult),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      
                      RoundButton(
                        title: "Sonraki >",
                        onPressed: () async {
                  if(formkey.currentState!.validate()){
                        formkey.currentState!.save();
                        try {
                          saveSelectedGender(selectedGender, widget.userResult);
                          saveSelectedDate(date,widget.userResult);
                          saveScore(0,widget.userResult);
                          print(widget.userResult);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content:
                            Text("Kayıt işlemi başarı ile gerçekleştirildi!"),),
                          );
                          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CompleteProfileViewTwo(userResult: widget.userResult,)));
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                      else
                      {}
                }),
                    ],
                  ),
                ),
              ],
            ),)
          ),
        ),
      ),
    );
  }
}
