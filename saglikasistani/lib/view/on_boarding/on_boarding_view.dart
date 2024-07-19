import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/common_widget/on_boarding_page.dart';
import 'package:saglikasistani/view/login/signup_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    
    super.initState();

    controller.addListener(() {
        selectPage = controller.page?.round() ?? 0;

      setState(() {
        
      });
    });
  }

  List pageArr = [
    {
      "title": "Hedefinizi Takip Edin",
      "subtitle":
          "Hedeflerinizi belirlemede sorun yaşıyorsanız endişelenmeyin, hedeflerinizi belirlemenize ve hedeflerinizi takip etmenize yardımcı olabiliriz.",
      "image": "assets/img/on_1.png"
    },
    {
      "title": "Hadi Yanmaya Devam Edelim",
      "subtitle":
          "Hedeflerine ulaşmak için, sadece geçici olarak acı verir, şimdi pes edersen sonsuza kadar acı çekersin",
      "image": "assets/img/on_2.png"
    },
    {
      "title": "İyi Beslenin",
      "subtitle":
          "Sağlıklı bir yaşam tarzına bizimle başlayalım, her gün beslenmenizi biz belirleyebiliriz. sağlıklı beslenme eğlencelidir",
      "image": "assets/img/on_3.png"
    },
    {
      "title": "Uyku Kalitenizi\nArtırın",
      "subtitle":
          "Bizimle uykunuzun kalitesini artırın, kaliteli uyku sabahları iyi bir ruh hali getirebilir",
      "image": "assets/img/on_4.png"
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return OnBoardingPage(pObj: pObj) ;
              }),

          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [

                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: TColor.primaryColor1,
                    value: (selectPage + 1) / 4 ,
                    strokeWidth: 2,
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(color: TColor.primaryColor1, borderRadius: BorderRadius.circular(35)),
                  child: IconButton(icon: Icon( Icons.navigate_next, color: TColor.white, ), onPressed: (){
          
                      if(selectPage < 3) {
          
                        selectPage = selectPage + 1;

                        controller.animateToPage(selectPage, duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
                        
                        // controller.jumpToPage(selectPage);
                        
                          setState(() {
                            
                          });
          
                      }else{
                        // Open Welcome Screen
                        //print("Open Welcome Screen");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView() ));
                      }
                      
                  },),
                ),

                
              ],
            ),
          )
        ],
      ),
    );
  }
}
