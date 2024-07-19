
import 'package:flutter/widgets.dart';
import 'package:saglikasistani/view/notification/service.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final _service = FirebaseNotificationService();
  void initState(){
    super.initState();
    _service.connectNotfication();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}