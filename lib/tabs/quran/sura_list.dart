import 'package:flutter/material.dart';
import 'package:islami_app/utilities/app_styles.dart';

import '../../model/quran_model.dart';

class SuraList extends StatelessWidget {
  QuranModel quranModel;

  // int index;
  SuraList({required this.quranModel});

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
                "${quranModel.index}",
                style: AppStyles.bold20WhiteJanna,
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
                  Text("${quranModel.suraEnglishName}",
                      style: AppStyles.bold20WhiteJanna),
                  Text("${quranModel.numOfVerses} verses",
                      style: AppStyles.bold14WhiteJanna),
                ]),
                Text("${quranModel.suraArabicName}",
                    style: AppStyles.bold20WhiteJanna),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
