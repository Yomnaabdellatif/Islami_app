import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class SuraList extends StatelessWidget {
  int index;
  String suraEngName;
  String suraArName;
  String versesNum;

  SuraList(
      {required this.index,
      required this.suraEngName,
      required this.versesNum,
      required this.suraArName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/surah_number.png"),
              Text(
                "${index}",
                style: TextStyle(color: AppColors.white),
              )
            ],
          ),
          SizedBox(
            width: 18,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text("$suraEngName",
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text("$versesNum verses",
                      style: TextStyle(color: AppColors.white, fontSize: 16))
                ]),
                Text("$suraArName",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
