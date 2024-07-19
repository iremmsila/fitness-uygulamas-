
import 'package:flutter/material.dart';
import 'package:saglikasistani/common/color_extension.dart';


class TitleSubtitleCell extends StatelessWidget {
  String title;
  String subtitle;
  TitleSubtitleCell({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
          color: TColor.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black38, blurRadius: 17)]),
      child: Column(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) {
              return LinearGradient(
                      colors: TColor.secondaryG,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)
                  .createShader(
                      Rect.fromLTRB(0, 0, bounds.width, bounds.height));
            },
            child: Text(
              title,
              style: TextStyle(
                //backgroundColor: Colors.black,
                  color: TColor.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: TColor.gray,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}