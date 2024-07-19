
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/common_widget/round_button.dart';
import 'package:saglikasistani/common_widget/round_textfield.dart';
import 'package:saglikasistani/view/login/complete_profileview.dart';
import 'package:saglikasistani/view/login/login_view.dart';
import 'package:saglikasistani/view/login/signup_firebase.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isCheck = false;
  late String email, password, firstname, lastname;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formkey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Text(
                  "Selam,",
                  style: TextStyle(color: TColor.gray, fontSize: 16),
                ),
                Text(
                  "Bir hesap oluşturun",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                RoundTextField(
                  hitText: "Ad",
                  icon: "assets/img/user_text.png",
                  validator: (value){
                    if(value!.isEmpty){
                      return "bilgileri eksiksiz doldurunuz";
                    }
                    else{}
                  },
                  onSaved: (value){
                    firstname = value!;
                  },
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  hitText: "Soyad",
                  icon: "assets/img/user_text.png",
                  validator: (value){
                    if(value!.isEmpty){
                      return "bilgileri eksiksiz doldurunuz";
                    }
                    else{}
                  },
                  onSaved: (value){
                    lastname = value!;
                  },
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  hitText: "Email",
                  icon: "assets/img/email.png",
                  keyboardType: TextInputType.emailAddress,
                  validator: (value){
                    if(value!.isEmpty){
                      return "bilgileri eksiksiz doldurunuz";
                    }
                    else{}
                  },
                  onSaved: (value){
                    email = value!;
                  },
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextField(
                  hitText: "Şifre",
                  icon: "assets/img/lock.png",
                  obscureText: true,
                  rigtIcon: TextButton(
                      onPressed: () {},
                      child: Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          )),
                  validator: (value){
                    if(value!.isEmpty){
                      return "bilgileri eksiksiz doldurunuz";
                    }
                    else{}
                  },
                  onSaved: (value){
                    password = value!;
                  },
                ),
                
                SizedBox(
                  height: media.width * 0.1,
                ),
                RoundButton(title: "Kayıt Ol",
                onPressed: () async {
                  if(formkey.currentState!.validate()){
                        formkey.currentState!.save();
                        var userResult = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
                        try {
                          addDataToFirestore(userResult, firstname, lastname, email, password);
                          print(userResult.user!.uid);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content:
                            Text("Kayıt işlemi başarı ile gerçekleştirildi!"),),
                          );
                          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CompleteProfileView(userResult: userResult.user!.uid)));
                        } catch (e) {
                          print(e.toString());
                        }
                      }
                      else
                      {}
                }),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Expanded(
                        child: Container(
                      height: 1,
                      color: TColor.gray.withOpacity(0.5),
                    )),
                    Text(
                      "  Ya Da  ",
                      style: TextStyle(color: TColor.black, fontSize: 12),
                    ),
                    Expanded(
                        child: Container(
                      height: 1,
                      color: TColor.gray.withOpacity(0.5),
                    )),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async{
                      /* User? user = await signInWithGoogle();
                        if (user != null) {
                          final String userID = user!.uid;
                          print(userID);
                          Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CompleteProfileView(userResult: userID)));

      // Kayıt işlemi başarılı, kullanıcıya hoş geldiniz mesajı gösterilebilir
                        } else {
      // Kayıt işlemi başarısız, kullanıcıya uygun bir mesaj gösterilebilir
                        }*/
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: TColor.white,
                          
                        ),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Zaten hesabınız var mı?",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Giriş Yap",
                        style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: media.width * 0.04,
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
