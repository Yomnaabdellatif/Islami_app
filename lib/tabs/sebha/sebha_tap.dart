import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int counter = 0;
  int index = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "لا إله إلا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله"
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/islami_logo.png"),
          Text(
            "سبح اسم ربك الأعلى ",
            style: TextStyle(fontSize: 36, color: AppColors.white),
          ),
          Flexible(
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    counter++;
                    if (counter == 33) {
                      counter = 0;
                      index++;
                      if (index == azkar.length) {
                        index = 0;
                      }
                    }
                    setState(() {});
                  },
                  child: Image.asset(
                    "assets/images/sebha_vector.png",
                    width: 379,
                    height: 380,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "${azkar[index]} ",
                      style: TextStyle(fontSize: 28, color: AppColors.white),
                    ),
                    Text(
                      "$counter",
                      style: TextStyle(fontSize: 28, color: AppColors.white),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
