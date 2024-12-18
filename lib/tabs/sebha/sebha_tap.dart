import 'package:flutter/material.dart';
import 'package:islami_app/utilities/app_styles.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int counter = 0;
  int index = 0;
  double angle = 0.0;
  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "لا إله إلا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله"
  ];

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        margin: EdgeInsets.all(hieght * 0.03),
        child: Column(
          children: [
            Image.asset(
              "assets/images/islami_logo.png",
              height: hieght * 0.18,
              width: width * 0.67,
            ),
            Text(
              "سبح اسم ربك الأعلى ",
              style: AppStyles.bold36WhiteJanna,
            ),
            SizedBox(
              height: hieght * (16 / 932),
            ),
            Image.asset(
              "assets/images/sebha_head.png",
              width: width * (73 / 430),
              height: hieght * (86 / 932),
            ),
            Expanded(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      counter++;
                      angle += 0.3;
                      if (counter == 34) {
                        angle = 0;
                        counter = 0;
                        index++;
                        if (index == azkar.length) {
                          index = 0;
                        }
                      }
                      setState(() {});
                    },
                    child: Transform.rotate(
                      alignment: Alignment.center,
                      angle: angle,
                      child: Image.asset(
                        "assets/images/sebha_wout_head.png",
                        width: width * 0.88,
                        height: hieght * 0.4,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(height: hieght*(85/932),),
                        Text(
                          "${azkar[index]} ",
                          style: AppStyles.bold36WhiteJanna,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "$counter",
                          style: AppStyles.bold36WhiteJanna,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
