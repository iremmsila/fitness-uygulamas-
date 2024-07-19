import 'package:flutter/material.dart';
import 'package:saglikasistani/view/login/signup_firebase.dart';

class ProfileView extends StatefulWidget {
  var userResult;
  ProfileView(this.userResult, {Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool positive = false;
  String height = "";
  String weight = "";
  String age = "";
  String firstname = "";
  String lastname = "";
  String gender = "";
  String date = "";
  bool isSpecialUser = true; // prof foto


  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    var name1 = widget.userResult;
    weight = await readField(name1, "weight");
    height = await readField(name1, "height");
    firstname = await readField(name1, "firstName");
    lastname = await readField(name1, "lastName");
    gender = await readField(name1, "gender");
    date = await readField(name1, "date");
    setState(() {
      if(gender=="Erkek")
      {
        isSpecialUser=true;
      }
      else{
        isSpecialUser=false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdee2fe),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    margin: const EdgeInsets.only(
                      top: 30,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 15,
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(
                          isSpecialUser
                              ? "assets/img/u1.png"
                              : "assets/img/u2.png",
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "$firstname",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 24,
                  right: 24,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "PROFIL",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          switch (index) {
                            case 0:
                              return listProfile(Icons.person, "Ad Soyad", "$firstname $lastname");
                            case 1:
                              return listProfile(Icons.height, "Boy", height);
                            case 2:
                              return listProfile(Icons.monitor_weight_outlined, "Kilo", weight);
                            case 3:
                              return listProfile(Icons.male, "Cinsiyet", gender);
                            case 4:
                              return listProfile(Icons.date_range, "Doğum Tarihi", date);
                            default:
                              return SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listProfile(IconData icon, String text1, String text2) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(width: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
