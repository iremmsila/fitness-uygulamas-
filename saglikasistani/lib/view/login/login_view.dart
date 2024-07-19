
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/common_widget/round_button.dart';
import 'package:saglikasistani/common_widget/round_textfield.dart';
import 'package:saglikasistani/common_widget/step_counter.dart';
import 'package:saglikasistani/view/login/welcome_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isCheck = false;
  late String email,password;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formkey,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Text(
                  "Selam,",
                  style: TextStyle(color: TColor.gray, fontSize: 16),
                ),
                Text(
                  "Tekrar Hoş Geldiniz",
                  style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: media.width * 0.05,
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
                      onPressed: () {
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 20,
                          height: 20,
                          )),
                  validator: (value){
                    if(value!.isEmpty){
                      return "bilgileri eksiksiz doldurunuz";
                    }
                  },
                  onSaved: (value){
                    password = value!;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    /*Text(
                      "Parolanızı mı unuttunuz?",
                      style: TextStyle(
                          color: TColor.gray,
                          fontSize: 15,
                          decoration: TextDecoration.underline),
                    ),*/
                  ],
                ),

                SizedBox(
                  height: media.width * 0.2,
                ),
                RoundButton(
                    title: "Giriş Yap",
                    onPressed: () async{
                      if(formkey.currentState!.validate()){
                        formkey.currentState!.save();
                        try {
                          final userResult = await firebaseAuth.signInWithEmailAndPassword(
                          email: email, password: password
                        );
                        print(userResult.user!.email);
                        } catch (e) {
                          print(e.toString());
                        }
                        User? user = firebaseAuth.currentUser;
                        if (user != null) {
              // Kullanıcı UID'sini al
              String uid = user.uid;
              // Elde edilen UID'yi kullanabilirsiniz
              print('Kullanıcı ID\'si: $uid');
              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WelcomeView(uid)));
            } else {
              print('Oturum açmış bir kullanıcı bulunamadı.');
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => stepCounter()
                        ));

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
                SizedBox(
                  height: media.width * 0.01,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        " Henüz bir hesabınız yok mu? ",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Kayıt Ol",
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
