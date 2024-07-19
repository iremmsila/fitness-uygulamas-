// import 'package:calendar_agenda/calendar_agenda.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:saglikasistani/common/color_extension.dart';
// import 'package:saglikasistani/workout_tracker_view.dart/add_schedule_view.dart';

// import '../../common/common.dart';
// import '../../common_widget/round_button.dart';





// class WorkoutScheduleView extends StatefulWidget {
//   final String selected;
//   final String selectedTime;
//   final String userResult;
//   const WorkoutScheduleView({
//     super.key, required this.selectedTime, required this.selected, required this.userResult
//   });

//   @override
//   State<WorkoutScheduleView> createState() => _WorkoutScheduleViewState();
// }

// class _WorkoutScheduleViewState extends State<WorkoutScheduleView> {
//   CalendarAgendaController _calendarAgendaControllerAppBar =
//       CalendarAgendaController();
      
//   late DateTime _selectedDateAppBBar;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  

//   List<Map<String, dynamic>> workoutEvents = [];
  
//   List eventArr = [
//     {
//       "name": "Ab Workout",
//       "start_time": "03/04/2024 07:30 AM",
//     },
//     {
//       "name": "Upperbody Workout",
//       "start_time": "04/04/2024 09:00 AM",
//     },
//     {
//       "name": "Lowerbody Workout",
//       "start_time": "15/05/2024 10:00 PM",
//     },
//     {
//       "name": "Ab Workout",
//       "start_time": "15/05/2024 07:30 AM",
//     },
//     {
//       "name": "Upperbody Workout",
//       "start_time": "26/05/2023 09:00 AM",
//     },
//     {
//       "name": "Lowerbody Workout",
//       "start_time": "05/05/2024 03:00 PM",
//     },
//     {
//       "name": "Ab Workout",
//       "start_time": "05/05/2024 07:30 AM",
//     },
//     {
//       "name": "Upperbody Workout",
//       "start_time": "27/05/2023 09:00 AM",
//     },
//     {
//       "name": "Lowerbody Workout",
//       "start_time": "27/05/2023 03:00 PM",
//     }
//   ];
  
//   //final List<Map<String, dynamic>> eventArr = [];
  
//   void updateUserEventList(List<DocumentSnapshot> documents) { //hakanla yaptık
//     setState(() {
//       //eventArr.clear(); // Mevcut liste temizleniyor

//       for (var document in documents) {
//         Map<String, dynamic> event = {
//           'name': document['name'],
//           'start_time': document['start_time'],
//         };
//         eventArr.add(event);
//       }
//     });
//   }


//   List selectDayEventArr = [];
//   List<Map<String, dynamic>> eventDataList = [];

//   @override
//   void initState() {
//     super.initState();
//     _selectedDateAppBBar = DateTime.now();
//     getEventDataFromFirestore();
//     setDayEventWorkoutList();
//     FirebaseFirestore.instance.collection('Date')
//         .where('userID', isEqualTo: widget.userResult)
//         .snapshots()
//         .listen((QuerySnapshot<Object?> snapshot) {
//       List<DocumentSnapshot> documents = snapshot.docs.cast<DocumentSnapshot>();
//       updateUserEventList(documents);
//     });
//       _fetchDataFromFirestore();

//   }

// /*  // Firestore'dan veri getiren metod
// void _fetchDataFromFirestore() async {
//   try {
//     // Firestore'dan belirli bir koleksiyondaki belgeleri al
//     QuerySnapshot querySnapshot = await _firestore.collection('Date').get();

//     // Alınan belgeleri dönerek listeye ekle
//     querySnapshot.docs.forEach((doc) {
//       // Belgenin verisini workoutEvents listesine ekle
//       workoutEvents.add(doc.data() as Map<String, dynamic>);
//     });

//     // setState çağırarak UI'nin güncellenmesini sağla
//     if (mounted) {
//       print(workoutEvents);
//       setState(() {});
//     }
//   } catch (error) {
//     print('Firestore\'dan veri getirilirken hata oluştu: $error');
//   }
// }


// Future<void> getEventDataFromFirestore() async {
//   try {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Date').get();
    

//     querySnapshot.docs.forEach((DocumentSnapshot document) {
     


//       // Map<String, dynamic> eventData = {
//       //   "name": document['name'],
//       //   "start_time": document['start_time'],
//       //   // Diğer gerekli alanları buraya ekleyebilirsiniz
//       // };
//       // eventDataList.add(eventData);
//     });

//     // Veritabanından alınan verilere göre setDayEventWorkoutList fonksiyonunu çağırabilirsiniz
//     setDayEventWorkoutList();
//   } catch (e) {
//     print("Firestore'dan veri alınırken bir hata oluştu: $e");
//   }
// }

// */

// void _fetchDataFromFirestore() async {
//   try {
//     // Firestore'dan belirli bir koleksiyondaki belgeleri al
//     QuerySnapshot querySnapshot = await _firestore.collection('schedules').get();

//     // Alınan belgeleri dönerek listeye ekle
//     querySnapshot.docs.forEach((doc) {
//       // Belgenin verisini eventDataList listesine ekle
//       eventDataList.add(doc.data() as Map<String, dynamic>);
//     });

//     // setState çağırarak UI'nin güncellenmesini sağla
//     if (mounted) {
//       setState(() {
//         // Doğrudan workoutEvents listesine ekleme yapmayın, bunun yerine eventDataList listesine ekleyin
//         workoutEvents = List.from(eventDataList);
//       });
//     }
//   } catch (error) {
//     print('Firestore\'dan veri getirilirken hata oluştu: $error');
//   }
// }

// Future<void> getEventDataFromFirestore() async {
//   try {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('schedules').get();

//     querySnapshot.docs.forEach((DocumentSnapshot document) {
//       // Belge verilerini eventDataList listesine ekleyin
//       eventDataList.add(document.data() as Map<String, dynamic>);
//     });

//     // Veritabanından alınan verilere göre setDayEventWorkoutList fonksiyonunu çağırabilirsiniz
//     setDayEventWorkoutList();
//   } catch (e) {
//     print("Firestore'dan veri alınırken bir hata oluştu: $e");
//   }
// }


//   void setDayEventWorkoutList() {
//     var date = dateToStartDate(_selectedDateAppBBar);
//     selectDayEventArr = eventDataList.map((wObj) {
//       return {
//         "name": wObj["name"],
//         "start_time": wObj["start_time"],
//         "date": stringToDate(wObj["start_time"].toString(),
//             formatStr: "dd/MM/yyyy hh:mm") //dd/MM/yyyy hh:mm aa
//       };
//     }).where((wObj) {
//       return dateToStartDate(wObj["schedules"] as DateTime) == date;
//     }).toList();

//     if( mounted  ) {
//       setState(() {
        
//       });
//     }
//   }
// //chat yaklaştı
//   /*void setDayEventWorkoutList(List<Map<String, dynamic>> eventDataList) {
//   var date = dateToStartDate(_selectedDateAppBBar);
//   selectDayEventArr = eventDataList.where((wObj) {
//     return dateToStartDate(wObj["date"] as DateTime) == date;
//   }).toList();

//   if (mounted) {
//     setState(() {
//       // Eğer gerekliyse, setState içine widget'ı güncelleme kodlarını ekleyebilirsiniz
//     });
//   }
// }*/


//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: TColor.white,
//         centerTitle: true,
//         elevation: 0,
//         leading: InkWell(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Container(
//             margin: const EdgeInsets.all(8),
//             height: 40,
//             width: 40,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 color: TColor.lightGray,
//                 borderRadius: BorderRadius.circular(10)),
//             child: Image.asset(
//               "assets/img/black_btn.png",
//               width: 15,
//               height: 15,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ),
//         title: Text(
//           "Antrenman Programı",
//           style: TextStyle(
//               color: TColor.black, fontSize: 16, fontWeight: FontWeight.w700),
//         ),
//         actions: [
//           InkWell(
//             onTap: () {},
//             child: Container(
//               margin: const EdgeInsets.all(8),
//               height: 40,
//               width: 40,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   color: TColor.lightGray,
//                   borderRadius: BorderRadius.circular(10)),
//               child: Image.asset(
//                 "assets/img/more_btn.png",
//                 width: 15,
//                 height: 15,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           )
//         ],
//       ),
//       backgroundColor: TColor.white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CalendarAgenda(
//             controller: _calendarAgendaControllerAppBar,
//             appbar: false,
//             selectedDayPosition: SelectedDayPosition.center,
//             leading: IconButton(
//                 onPressed: () {},
//                 icon: Image.asset(
//                   "assets/img/ArrowLeft.png",
//                   width: 15,
//                   height: 15,
//                 )),
//             training: IconButton(
//                 onPressed: () {},
//                 icon: Image.asset(
//                   "assets/img/ArrowRight.png",
//                   width: 15,
//                   height: 15,
//                 )),
//             weekDay: WeekDay.short,
//             dayNameFontSize: 12,
//             dayNumberFontSize: 16,
//             dayBGColor: Colors.grey.withOpacity(0.15),
//             titleSpaceBetween: 15,
//             backgroundColor: Colors.transparent,
//             //fullCalendar: false,
//             fullCalendarScroll: FullCalendarScroll.horizontal,
//             fullCalendarDay: WeekDay.short,
//             selectedDateColor: Colors.white,
//             dateColor: Colors.black,
//             locale: 'eng',

//             initialDate: DateTime.now(),
//             calendarEventColor: TColor.primaryColor2,
//             firstDate: DateTime.now().subtract(const Duration(days: 140)),
//             lastDate: DateTime.now().add(const Duration(days: 60)),

//             onDateSelected: (date) {
//               _selectedDateAppBBar = date;
//               setDayEventWorkoutList();
              
//             },
//             selectedDayLogo: Container(
//               width: double.maxFinite,
//               height: double.maxFinite,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     colors: TColor.primaryG,
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: SizedBox(
//                 width: media.width * 1.5,
//                 child: ListView.separated( ///////////////////
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) { /////////////////////
//                       var timelineDataWidth = (media.width * 1.5) - (80 + 40);
//                       var availWidth = (media.width * 1.2) - (80 + 40);
//                       var slotArr = selectDayEventArr.where((wObj) {
//                         return (wObj["date"] as DateTime).hour == index;
//                       }).toList();

//                       return Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         height: 40,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SizedBox(
//                               width: 80,
//                               child: Text(
//                                 getTime(index * 60),
//                                 style: TextStyle(
//                                   color: TColor.black,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),
//                             if (slotArr.isNotEmpty)
//                               Expanded(
//                                   child: Stack(
//                                 alignment: Alignment.centerLeft,
//                                 children: slotArr.map((sObj) {
//                                   var min = (sObj["date"] as DateTime).minute;
//                                   //(0 to 2)
//                                   var pos = (min / 60) * 2 - 1;

//                                   return Align(
//                                     alignment: Alignment(pos, 0),
//                                     child: InkWell(
//                                       onTap: () {
//                                         showDialog(
//                                           context: context,
//                                           builder: (context) {
//                                             return AlertDialog(
//                                               backgroundColor: Colors.transparent,
//                                               contentPadding: EdgeInsets.zero,
//                                               content: Container(
//                                                 padding: const EdgeInsets.symmetric( vertical:15 , horizontal: 20 ),
//                                                 decoration: BoxDecoration(
//                                                   color: TColor.white,
//                                                   borderRadius:
//                                                       BorderRadius.circular(20),
//                                                 ),
//                                                 child: Column(
//                                                   mainAxisSize: MainAxisSize.min,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                         InkWell(
//                                                           onTap: () {
//                                                             Navigator.pop(
//                                                                 context);
//                                                           },
//                                                           child: Container(
//                                                             margin:
//                                                                 const EdgeInsets
//                                                                     .all(8),
//                                                             height: 40,
//                                                             width: 40,
//                                                             alignment:
//                                                                 Alignment.center,
//                                                             decoration: BoxDecoration(
//                                                                 color: TColor
//                                                                     .lightGray,
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             10)),
//                                                             child: Image.asset(
//                                                               "assets/img/closed_btn.png",
//                                                               width: 15,
//                                                               height: 15,
//                                                               fit: BoxFit.contain,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         Text(
//                                                           "Workout Schedule",
//                                                           style: TextStyle(
//                                                               color: TColor.black,
//                                                               fontSize: 16,
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .w700),
//                                                         ),
//                                                         InkWell(
//                                                           onTap: () {},
//                                                           child: Container(
//                                                             margin:
//                                                                 const EdgeInsets
//                                                                     .all(8),
//                                                             height: 40,
//                                                             width: 40,
//                                                             alignment:
//                                                                 Alignment.center,
//                                                             decoration: BoxDecoration(
//                                                                 color: TColor
//                                                                     .lightGray,
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             10)),
//                                                             child: Image.asset(
//                                                               "assets/img/more_btn.png",
//                                                               width: 15,
//                                                               height: 15,
//                                                               fit: BoxFit.contain,
//                                                             ),
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                     const SizedBox(
//                                                       height: 15,
//                                                     ),
//                                                     Text(
//                                                       sObj["name"].toString(),
//                                                       style: TextStyle(
//                                                           color: TColor.black,
//                                                           fontSize: 14,
//                                                           fontWeight:
//                                                               FontWeight.w700),
//                                                     ),
//                                                     const SizedBox(   
//                                                       height: 4,
//                                                     ),
//                                                     Row(children: [
//                                                       Image.asset(
//                                                         "assets/img/time_workout.png",
//                                                         height: 20,
//                                                         width: 20,
//                                                       ),
//                                                       const SizedBox(
//                                                         width: 8,
//                                                       ),
//                                                       Text(
//                                                         "${ getDayTitle(sObj["start_time"].toString()) }|${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
//                                                         style: TextStyle(
//                                                             color: TColor.gray,
//                                                             fontSize: 12),
//                                                       )
//                                                     ]),
                                            
//                                                     const SizedBox(
//                                                       height: 15,
//                                                     ),
                                            
//                                                     RoundButton(
//                                                         title: "Mark Done",
//                                                         onPressed: () {}),
                                            
//                                                   ],
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         );
//                                       },
//                                       child: Container(
//                                         height: 35,
//                                         width: availWidth * 0.5,
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 8),
//                                         alignment: Alignment.centerLeft,
//                                         decoration: BoxDecoration(
//                                           gradient: LinearGradient(
//                                               colors: TColor.secondaryG),
//                                           borderRadius:
//                                               BorderRadius.circular(17.5),
//                                         ),
//                                         child: Text(
//                                           "${sObj["name"].toString()}, ${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                             color: TColor.white,
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }).toList(),
//                               ))
//                           ],
//                         ),
//                       );
//                     },
//                     separatorBuilder: (context, index) {
//                       return Divider(
//                         color: TColor.gray.withOpacity(0.2),
//                         height: 1,
//                       );
//                     },
//                     itemCount: 24),
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: InkWell(
//         onTap: () {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => AddScheduleView(
//                         date: _selectedDateAppBBar,
//                         ttitle: widget.selected, userResult: widget.userResult,
//                       )));
//         },
//         child: Container(
//           width: 55,
//           height: 55,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(colors: TColor.secondaryG),
//               borderRadius: BorderRadius.circular(27.5),
//               boxShadow: const [
//                 BoxShadow(
//                     color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
//               ]),
//           alignment: Alignment.center,
//           child: Icon(
//             Icons.add,
//             size: 20,
//             color: TColor.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:calendar_agenda/calendar_agenda.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';

import '../../common/common.dart';
import '../../common_widget/round_button.dart';
import 'add_schedule_view.dart';

class WorkoutScheduleView extends StatefulWidget {
  final String selected;
  final String selectedTime;
  final String userResult;
  const WorkoutScheduleView({
    super.key,
    required this.selectedTime,
    required this.selected,
    required this.userResult
  });

  @override
  State<WorkoutScheduleView> createState() => _WorkoutScheduleViewState();
}

class _WorkoutScheduleViewState extends State<WorkoutScheduleView> {
  CalendarAgendaController _calendarAgendaControllerAppBar = CalendarAgendaController();
  late DateTime _selectedDateAppBBar;

  List<Map<String, dynamic>> eventArr = [];
  List<Map<String, dynamic>> selectDayEventArr = [];

  @override
  @override
void initState() {
  super.initState();
  
  _selectedDateAppBBar = DateTime.now();
  fetchEventsFromFirestore(widget.userResult);
  setDayEventWorkoutList(); // Add this line
  setState(() {});
}


Future<void> fetchEventsFromFirestore(String userId) async {
  try {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Firestore'dan belirli bir kullanıcının verilerini al
    QuerySnapshot querySnapshot = await _firestore
        .collection('schedules')
        .doc(userId)
        .collection('userSchedules')
        .get();

    // Firestore'dan gelen belgeleri eventArr listesine dönüştür
    eventArr = querySnapshot.docs.map((doc) {
      String startTime = doc["start_time"] as String;
      DateTime startTimeAsDateTime = DateTime.parse(startTime);

      return {
        "id": doc.id, // Document ID'yi ekleyin
        "name": doc["name"],
        "start_time": startTime,
        "date": startTimeAsDateTime,
      };
    }).toList();

    // Aldığımız verileri listeye başarıyla atadık, bu yüzden setState fonksiyonunu çağırmamıza gerek yok.
    // setState(() {});

  } catch (error) {
    print('Firestore\'dan veri alınırken hata oluştu: $error');
    // Hata durumunda setDayEventWorkoutList'i çağırmaya gerek yok, çünkü veri alınmadı.
  }
}


void setDayEventWorkoutList() {
  var date = dateToStartDate(_selectedDateAppBBar);
  
  FirebaseFirestore.instance.collection('schedules')
    .doc(widget.userResult) // Assuming userId is accessible here
    .collection('userSchedules')
    .get()
    .then((QuerySnapshot querySnapshot) {
      List<Map<String, dynamic>> eventArr = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        eventArr.add({
          "id": doc.id, // Document ID'yi ekleyin
          "name": data['name'],
          "start_time": data['start_time'],
          // Convert start_time to DateTime
          "date": stringToDate(data['start_time'].toString(), formatStr: "dd/MM/yyyy hh:mm aa")
        });
      });

      // Filter events for the selected date
      selectDayEventArr = eventArr.where((wObj) {
        return dateToStartDate(wObj["date"] as DateTime) == date;
      }).toList();

      if (mounted) {
        setState(() {
          // Update UI
        });
      }
    })
    .catchError((error) {
      print("Error getting documents: $error");
    });
}

// Firestore'dan programı silen işlev
Future<void> deleteWorkout(String userId, String docId) async {
  try {
    await FirebaseFirestore.instance
        .collection('schedules')
        .doc(userId)
        .collection('userSchedules')
        .doc(docId)
        .delete();
    print('Program başarıyla silindi.');
  } catch (e) {
    print('Program silinirken hata oluştu: $e');
  }
}

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
          "Antrenman Programı",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarAgenda(
            controller: _calendarAgendaControllerAppBar,
            appbar: false,
            selectedDayPosition: SelectedDayPosition.center,
            leading: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/img/ArrowLeft.png",
                  width: 15,
                  height: 15,
                )),
            training: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/img/ArrowRight.png",
                  width: 15,
                  height: 15,
                )),
            weekDay: WeekDay.short,
            dayNameFontSize: 12,
            dayNumberFontSize: 16,
            dayBGColor: Colors.grey.withOpacity(0.15),
            titleSpaceBetween: 15,
            backgroundColor: Colors.transparent,
            fullCalendarScroll: FullCalendarScroll.horizontal,
            fullCalendarDay: WeekDay.short,
            selectedDateColor: Colors.white,
            dateColor: Colors.black,
            locale: 'en',
            initialDate: DateTime.now(),
            calendarEventColor: TColor.primaryColor2,
            firstDate: DateTime.now().subtract(const Duration(days: 140)),
            lastDate: DateTime.now().add(const Duration(days: 60)),
            onDateSelected: (date) {
              _selectedDateAppBBar = date;
              setDayEventWorkoutList();
            },
            selectedDayLogo: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: TColor.primaryG,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: media.width * 1.5,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var timelineDataWidth = (media.width * 1.5) - (80 + 40);
                      var availWidth = (media.width * 1.2) - (80 + 40);
                      var slotArr = selectDayEventArr.where((wObj) {
                        return (wObj["date"] as DateTime).hour == index;
                      }).toList();

                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 80,
                              child: Text(
                                getTime(index * 60),
                                style: TextStyle(
                                  color: TColor.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            if (slotArr.isNotEmpty)
                              Expanded(
                                  child: Stack(
                                alignment: Alignment.centerLeft,
                                children: slotArr.map((sObj) {
                                  var min = (sObj["date"] as DateTime).minute;
                                  //(0 to 2)
                                  var pos = (min / 60) * 2 - 1;

                                  return Align(
                                    alignment: Alignment(pos, 0),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.transparent,
                                              contentPadding: EdgeInsets.zero,
                                              content: Container(
                                                padding: const EdgeInsets.symmetric( vertical:15 , horizontal: 20 ),
                                                decoration: BoxDecoration(
                                                  color: TColor.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            height: 40,
                                                            width: 40,
                                                            alignment:
                                                                Alignment.center,
                                                            decoration: BoxDecoration(
                                                                color: TColor
                                                                    .lightGray,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Image.asset(
                                                              "assets/img/closed_btn.png",
                                                              width: 15,
                                                              height: 15,
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          "Antrenman Programı",
                                                          style: TextStyle(
                                                              color: TColor.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ]
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      sObj["name"].toString(),
                                                      style: TextStyle(
                                                          color: TColor.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    const SizedBox(
                                                      height: 4,
                                                    ),
                                                    Row(children: [
                                                      Image.asset(
                                                        "assets/img/time_workout.png",
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        "${ getDayTitle(sObj["start_time"].toString()) }|${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
                                                        style: TextStyle(
                                                            color: TColor.gray,
                                                            fontSize: 12),
                                                      )
                                                    ]),
                                            
                                                     const SizedBox(
                                                      height: 15,
                                                    ),
                                            
                                                    RoundButton(
                                                        title: "Tamamlandı",
                                                        onPressed: () async {
                                                          await deleteWorkout(widget.userResult, sObj["id"]);
                                                          setDayEventWorkoutList(); // Listeyi güncelle
                                                          Navigator.pop(context);
                                                        },
                                                    ),
                                            
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: 35,
                                        width: availWidth * 0.5,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: TColor.secondaryG),
                                          borderRadius:
                                              BorderRadius.circular(17.5),
                                        ),
                                        child: Text(
                                          "${sObj["name"].toString()}, ${getStringDateToOtherFormate(sObj["start_time"].toString(), outFormatStr: "h:mm aa")}",
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: TColor.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ))
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: TColor.gray.withOpacity(0.2),
                        height: 1,
                      );
                    },
                    itemCount: 24),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddScheduleView(
                        date: _selectedDateAppBBar,
                        ttitle: widget.selected,
                        userResult: widget.userResult,
                      )));
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: TColor.secondaryG),
              borderRadius: BorderRadius.circular(27.5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
              ]),
          alignment: Alignment.center,
          child: Icon(
            Icons.add,
            size: 20,
            color: TColor.white,
          ),
        ),
      ),
    );
  }
}


