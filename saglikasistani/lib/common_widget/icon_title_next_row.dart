
import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';

class IconTitleNextRow extends StatefulWidget {
  final String icon;
  final String title;
  final String time;
  final List<String> timeOptions;
  final VoidCallback onPressed;
  final Color color;

  const IconTitleNextRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.time,
    required this.timeOptions,
    required this.color,
    required this.onPressed
  }) : super(key: key);

  @override
  _IconTitleNextRowState createState() => _IconTitleNextRowState();
}

class _IconTitleNextRowState extends State<IconTitleNextRow> {
  late String selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.time;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: [
            Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: Image.asset(
                widget.icon,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
            //const SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(color: TColor.gray, fontSize: 14),
              ),
            ),
            //const SizedBox(width: 2),
            //Expanded(
              //width: 120,
              //child: 
              DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: widget.timeOptions
                                .map((name) => DropdownMenuItem(
                                      value: name,
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                            color: TColor.primaryColor1, fontSize: 13),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (value) {
                            
                              setState(() {
                                selectedTime = value!;
                                Future<String> titleGet() async {
                                  return value;
                                }
                              });
                            },
                            icon: Icon(Icons.expand_more, color: TColor.primaryColor1),
                            hint: Text(
                              selectedTime,
                              //textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: TColor.primaryColor1, fontSize: 13),
                            ),
                          ),
                        //)
                        ),
          ],
        ),
      ),
    );
  }
}


                                
