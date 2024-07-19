import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';
import 'package:saglikasistani/common_widget/meal_category_cell.dart';
import 'package:saglikasistani/common_widget/popular_meal_roe.dart';
import 'package:saglikasistani/view/food/category_details.dart';
import 'package:saglikasistani/view/meal_planner/food_info_details_view.dart';


class MealFoodDetails extends StatefulWidget {
  const MealFoodDetails({super.key});

  @override
  State<MealFoodDetails> createState() => _MealFoodDetailsState();
}

class _MealFoodDetailsState extends State<MealFoodDetails> {
  TextEditingController txtSearch = TextEditingController();

  List categoryArr = [
    {
      "name": "Salata",
      "image": "assets/img/c_1.png",
      "route":"/lib/view/food/foods_menu.dart",
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

  List popularArr = [
    {
      "name": "Yabanmersinli Krep",
      "image": "assets/img/f_1.png",
      "b_image":"assets/img/pancake_1.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "230kCal",
      "explanation": ""
    },
    {
      "name": "Fit Cheesecake",
      "image": "assets/img/cheesecake.png",
      "b_image":"assets/img/cheesecake.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "125kCal",
      "explanation": "Tüm malzemeleri karıştırıp tabanımızın üzerine dökelim donması için buzluğa atalım.Donmuş olan cheesecakeimizin üzeri için sulandırılmış çilek veya limon sosu hazırlayalım ve üzerine döküp tekrardan buzluğa atalım. Kekimizi 8 dilime bölelim ve 1 dilimi 125 kcaldır.Afiyet olsun. ",
    },
    {
      "name": "Fit Dondurma",
      "image": "assets/img/ice-cream-cup.png",
      "b_image": "assets/img/ice-cream-cup.png",
      "size": "Orta",
      "time": "20 dk",
      "kcal": "300 kcal",
      "explanation": "Tüm malzemeleri blenderdan geçiriyoruz. Püre kıvamına gelince bir tepsi üzerine döküyoruz.1-2 saat buzlukta bekletiyoruz. Sonrasında küp küp kesebilir veya 2 top şeklinde tüketebilirsiniz.Toplamda 300 kcal 4 top çıkıyor. 1 porsiyon için 2 top tüketebilirsiniz.Afiyet olsun.",
    },
    
    {
      "name": "Kabak Köfte",
      "image": "assets/img/kofte.png",
      "b_image": "assets/img/kofte.png",
      "size": "Orta",
      "time": "20",
      "kcal": "300kCal",
      "explanation": "Kabağın iki ucunu keserek sebze fırçası ile iyice yıkıyoruz. (Liflerinin gitmemesi için kabuklarını soymuyor, fırça ile iyice yıkıyoruz.)Önce ortadan ikiye bölüyor daha sonra ince şeritler halinde dilimliyoruz.Kabak şeritlerini küp şeklinde ince ince doğruyoruz.Yumurta büyüklüğünde toplar yaparak yağlı kağıt serilmiş fırın tepsisine yerleştiriyoruz.200 derece önceden ısınmış fırında 20 dakika pişiriyoruz. (Dışı gevrek içi yumuşak kabaktopları olmalı.)Fırından çıkınca hemen servis yapıyoruz.Daha sonra servis yapılacaksa fırına vermeden toplar halinde saklama kabındabuzdolabında saklanarak servisten hemen önce fırınlanabilir.Bu güzel köftelerin 1 porsiyonu yaklaşık 300 kalori.",
    },
  ];

  List salad = [
    {
      "name": "Kabak Köfte",
      "image": "assets/img/kofte.png",
      "b_image": "assets/img/kofte.png",
      "size": "Orta",
      "time": "20",
      "kcal": "300kCal",
      "explanation": "Kabağın iki ucunu keserek sebze fırçası ile iyice yıkıyoruz. (Liflerinin gitmemesi için kabuklarını soymuyor, fırça ile iyice yıkıyoruz.)Önce ortadan ikiye bölüyor daha sonra ince şeritler halinde dilimliyoruz.Kabak şeritlerini küp şeklinde ince ince doğruyoruz.Yumurta büyüklüğünde toplar yaparak yağlı kağıt serilmiş fırın tepsisine yerleştiriyoruz.200 derece önceden ısınmış fırında 20 dakika pişiriyoruz. (Dışı gevrek içi yumuşak kabaktopları olmalı.)Fırından çıkınca hemen servis yapıyoruz.Daha sonra servis yapılacaksa fırına vermeden toplar halinde saklama kabındabuzdolabında saklanarak servisten hemen önce fırınlanabilir.Bu güzel köftelerin 1 porsiyonu yaklaşık 300 kalori.",
    },
    {
      "name": "Kabak Köfte",
      "image": "assets/img/kofte.png",
      "b_image": "assets/img/kofte.png",
      "size": "Orta",
      "time": "20",
      "kcal": "300kCal",
      "explanation": "Kabağın iki ucunu keserek sebze fırçası ile iyice yıkıyoruz. (Liflerinin gitmemesi için kabuklarını soymuyor, fırça ile iyice yıkıyoruz.)Önce ortadan ikiye bölüyor daha sonra ince şeritler halinde dilimliyoruz.Kabak şeritlerini küp şeklinde ince ince doğruyoruz.Yumurta büyüklüğünde toplar yaparak yağlı kağıt serilmiş fırın tepsisine yerleştiriyoruz.200 derece önceden ısınmış fırında 20 dakika pişiriyoruz. (Dışı gevrek içi yumuşak kabaktopları olmalı.)Fırından çıkınca hemen servis yapıyoruz.Daha sonra servis yapılacaksa fırına vermeden toplar halinde saklama kabındabuzdolabında saklanarak servisten hemen önce fırınlanabilir.Bu güzel köftelerin 1 porsiyonu yaklaşık 300 kalori.",
    },
    {
      "name": "Kabak Köfte",
      "image": "assets/img/kofte.png",
      "b_image": "assets/img/kofte.png",
      "size": "Orta",
      "time": "20",
      "kcal": "300kCal",
      "explanation": "Kabağın iki ucunu keserek sebze fırçası ile iyice yıkıyoruz. (Liflerinin gitmemesi için kabuklarını soymuyor, fırça ile iyice yıkıyoruz.)Önce ortadan ikiye bölüyor daha sonra ince şeritler halinde dilimliyoruz.Kabak şeritlerini küp şeklinde ince ince doğruyoruz.Yumurta büyüklüğünde toplar yaparak yağlı kağıt serilmiş fırın tepsisine yerleştiriyoruz.200 derece önceden ısınmış fırında 20 dakika pişiriyoruz. (Dışı gevrek içi yumuşak kabaktopları olmalı.)Fırından çıkınca hemen servis yapıyoruz.Daha sonra servis yapılacaksa fırına vermeden toplar halinde saklama kabındabuzdolabında saklanarak servisten hemen önce fırınlanabilir.Bu güzel köftelerin 1 porsiyonu yaklaşık 300 kalori.",
    },
    {
      "name": "Kabak Köfte",
      "image": "assets/img/kofte.png",
      "b_image": "assets/img/kofte.png",
      "size": "Orta",
      "time": "20",
      "kcal": "300kCal",
      "explanation": "Kabağın iki ucunu keserek sebze fırçası ile iyice yıkıyoruz. (Liflerinin gitmemesi için kabuklarını soymuyor, fırça ile iyice yıkıyoruz.)Önce ortadan ikiye bölüyor daha sonra ince şeritler halinde dilimliyoruz.Kabak şeritlerini küp şeklinde ince ince doğruyoruz.Yumurta büyüklüğünde toplar yaparak yağlı kağıt serilmiş fırın tepsisine yerleştiriyoruz.200 derece önceden ısınmış fırında 20 dakika pişiriyoruz. (Dışı gevrek içi yumuşak kabaktopları olmalı.)Fırından çıkınca hemen servis yapıyoruz.Daha sonra servis yapılacaksa fırına vermeden toplar halinde saklama kabındabuzdolabında saklanarak servisten hemen önce fırınlanabilir.Bu güzel köftelerin 1 porsiyonu yaklaşık 300 kalori.",
    },
    {
      "name": "Kabak Köfte",
      "image": "assets/img/kofte.png",
      "b_image": "assets/img/kofte.png",
      "size": "Orta",
      "time": "20",
      "kcal": "300kCal",
      "explanation": "Kabağın iki ucunu keserek sebze fırçası ile iyice yıkıyoruz. (Liflerinin gitmemesi için kabuklarını soymuyor, fırça ile iyice yıkıyoruz.)Önce ortadan ikiye bölüyor daha sonra ince şeritler halinde dilimliyoruz.Kabak şeritlerini küp şeklinde ince ince doğruyoruz.Yumurta büyüklüğünde toplar yaparak yağlı kağıt serilmiş fırın tepsisine yerleştiriyoruz.200 derece önceden ısınmış fırında 20 dakika pişiriyoruz. (Dışı gevrek içi yumuşak kabaktopları olmalı.)Fırından çıkınca hemen servis yapıyoruz.Daha sonra servis yapılacaksa fırına vermeden toplar halinde saklama kabındabuzdolabında saklanarak servisten hemen önce fırınlanabilir.Bu güzel köftelerin 1 porsiyonu yaklaşık 300 kalori.",
    },
  ];

  List cake = [
    {
      "name": "Fit Cheesecake",
      "image": "assets/img/cheesecake.png",
      "b_image":"assets/img/cheesecake.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "125kCal",
      "explanation": "Tüm malzemeleri karıştırıp tabanımızın üzerine dökelim donması için buzluğa atalım.Donmuş olan cheesecakeimizin üzeri için sulandırılmış çilek veya limon sosu hazırlayalım ve üzerine döküp tekrardan buzluğa atalım. Kekimizi 8 dilime bölelim ve 1 dilimi 125 kcaldır.Afiyet olsun. ",
    },
    {
      "name": "Fit Cheesecake",
      "image": "assets/img/cheesecake.png",
      "b_image":"assets/img/cheesecake.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "125kCal",
      "explanation": "Tüm malzemeleri karıştırıp tabanımızın üzerine dökelim donması için buzluğa atalım.Donmuş olan cheesecakeimizin üzeri için sulandırılmış çilek veya limon sosu hazırlayalım ve üzerine döküp tekrardan buzluğa atalım. Kekimizi 8 dilime bölelim ve 1 dilimi 125 kcaldır.Afiyet olsun. ",
    },
    {
      "name": "Fit Cheesecake",
      "image": "assets/img/cheesecake.png",
      "b_image":"assets/img/cheesecake.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "125kCal",
      "explanation": "Tüm malzemeleri karıştırıp tabanımızın üzerine dökelim donması için buzluğa atalım.Donmuş olan cheesecakeimizin üzeri için sulandırılmış çilek veya limon sosu hazırlayalım ve üzerine döküp tekrardan buzluğa atalım. Kekimizi 8 dilime bölelim ve 1 dilimi 125 kcaldır.Afiyet olsun. ",
    },
    {
      "name": "Fit Cheesecake",
      "image": "assets/img/cheesecake.png",
      "b_image":"assets/img/cheesecake.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "125kCal",
      "explanation": "Tüm malzemeleri karıştırıp tabanımızın üzerine dökelim donması için buzluğa atalım.Donmuş olan cheesecakeimizin üzeri için sulandırılmış çilek veya limon sosu hazırlayalım ve üzerine döküp tekrardan buzluğa atalım. Kekimizi 8 dilime bölelim ve 1 dilimi 125 kcaldır.Afiyet olsun. ",
    },
  ];

  List pie = [
    {
      "name": "Yabanmersinli Krep",
      "image": "assets/img/f_1.png",
      "b_image":"assets/img/pancake_1.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "230kCal",
      "explanation": ""
    },
    {
      "name": "Yabanmersinli Krep",
      "image": "assets/img/f_1.png",
      "b_image":"assets/img/pancake_1.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "230kCal",
      "explanation": ""
    },
    {
      "name": "Yabanmersinli Krep",
      "image": "assets/img/f_1.png",
      "b_image":"assets/img/pancake_1.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "230kCal",
      "explanation": ""
    },
    {
      "name": "Yabanmersinli Krep",
      "image": "assets/img/f_1.png",
      "b_image":"assets/img/pancake_1.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "230kCal",
      "explanation": ""
    },
  ];


  List smoothie = [
    {
      "name": "Yabanmersinli Krep",
      "image": "assets/img/smoothie.png",
      "b_image":"assets/img/smoothie.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "130kCal",
      "explanation": "İlk olarak karpuzun çekirdeklerini çıkartın. Çilek ve buz ile birlikte blender’dan geçirin. Süt ekleyerek hafif pütürlü smoothie kıvamını yakalayın. Karpuz çabuk sulanan bir meyve olduğu için karpuzlu smoothie tariflerini gereğinden fazla karıştırmamanız önerilir. Aksi halde içeceğinizin kıvamı bozulabilir."
    },
    {
      "name": "Yabanmersinli Krep",
      "image": "assets/img/smoothie.png",
      "b_image":"assets/img/smoothie.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "130kCal",
      "explanation": "İlk olarak karpuzun çekirdeklerini çıkartın. Çilek ve buz ile birlikte blender’dan geçirin. Süt ekleyerek hafif pütürlü smoothie kıvamını yakalayın. Karpuz çabuk sulanan bir meyve olduğu için karpuzlu smoothie tariflerini gereğinden fazla karıştırmamanız önerilir. Aksi halde içeceğinizin kıvamı bozulabilir."
    },
    {
      "name": "Yabanmersinli Krep",
      "image": "assets/img/smoothie.png",
      "b_image":"assets/img/smoothie.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "130kCal",
      "explanation": "İlk olarak karpuzun çekirdeklerini çıkartın. Çilek ve buz ile birlikte blender’dan geçirin. Süt ekleyerek hafif pütürlü smoothie kıvamını yakalayın. Karpuz çabuk sulanan bir meyve olduğu için karpuzlu smoothie tariflerini gereğinden fazla karıştırmamanız önerilir. Aksi halde içeceğinizin kıvamı bozulabilir."
    },
    {
      "name": "Yabanmersinli Krep",
      "image": "assets/img/smoothie.png",
      "b_image":"assets/img/smoothie.png",
      "size": "Orta",
      "time": "30 dk",
      "kcal": "130kCal",
      "explanation": "İlk olarak karpuzun çekirdeklerini çıkartın. Çilek ve buz ile birlikte blender’dan geçirin. Süt ekleyerek hafif pütürlü smoothie kıvamını yakalayın. Karpuz çabuk sulanan bir meyve olduğu için karpuzlu smoothie tariflerini gereğinden fazla karıştırmamanız önerilir. Aksi halde içeceğinizin kıvamı bozulabilir."
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
          "Yiyecekler",
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
      backgroundColor: TColor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: TColor.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ]),
              child: Row(
                children: [
                 /* Expanded(
                      child: TextField(
                    controller: txtSearch,
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        prefixIcon: Image.asset(
                          "assets/img/search.png",
                          width: 25,
                          height: 25,
                        ),
                        hintText: "..."),
                  )),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 1,
                    height: 25,
                    color: TColor.gray.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/img/Filter.png",
                      width: 25,
                      height: 25,
                    ),
                  )*/
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Kategoriler",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
  height: 120,
  child: ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    scrollDirection: Axis.horizontal,
    itemCount: categoryArr.length,
    itemBuilder: (context, index) {
      var cObj = categoryArr[index] as Map? ?? {};
      String? categoryName = cObj['name']; // Kategori adını al
      return InkWell(
        onTap: () {
          // Her bir kategori öğesi için tıklama işlemi
          if (categoryName != null) {
            if (categoryName == "Salata") {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetails(myList: salad)));
            }else if (categoryName == "Kek") {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetails(myList: cake,)));
            }else if (categoryName == "Turta") {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetails(myList: pie)));
            }else if (categoryName == "Smoothie'ler") {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryDetails(myList: smoothie)));
            }else {
              print("Hata: Kategori adı 'Salata' olarak tanımlandı.");
            }
          } else {
            print("Hata: Kategori adı bulunamadı veya null.");
          }
        },
        child: MealCategoryCell(
          cObj: cObj,
          index: index,
        ),
      );
    },
  ),
),



            SizedBox(
              height: media.width * 0.05,
            ),

              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Popüler Tarifler",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),

            ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: popularArr.length,
                itemBuilder: (context, index) {
                  var fObj = popularArr[index] as Map? ?? {};
                  return InkWell(
                    onTap: () {
                      Navigator.push( ////////ben yaptım
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodInfoDetailsView(
                            dObj: fObj,
                            //mObj: categoryArr,
                          ),
                        ),
                      );
                    },
                    child: PopularMealRow(
                      mObj: fObj,
                    ),
                  );
                }),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
