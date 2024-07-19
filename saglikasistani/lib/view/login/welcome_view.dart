
import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/common_widget/round_button.dart';
import 'package:saglikasistani/main/main_tab_view.dart';
import 'package:saglikasistani/view/login/signup_firebase.dart';

class WelcomeView extends StatefulWidget {
  var userResult;
  WelcomeView(this.userResult, {Key? key}) : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}


class _WelcomeViewState extends State<WelcomeView> {
  final formkey = GlobalKey<FormState>();
  String name="";
  @override

  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var name1 = widget.userResult;
    name = await readField(name1,"firstName");
    setState(() {});
  }

  Widget build(BuildContext context){
    //String name= await readField(widget.userResult) as String;
    var media = MediaQuery.of(context).size;

    if (name == null) {
      return CircularProgressIndicator(); // veya başka bir yükleme göstergesi
    }
    
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Form(
            key: formkey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
            SizedBox(
                height: media.width * 0.1,
              ),
              Image.asset(
                "assets/img/welcome.png",
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Text(
                "Hoş Geldin $name",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Artık hazırsınız, hadi birlikte\nhedeflerinize ulaşalım",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
            const Spacer(),

              RoundButton(
                  title: "Ana Sayfaya Dön",
                  onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainTabView(widget.userResult)));
                  }),
              
            ],
          ),)
        ),

      ),
    );
  }
}
