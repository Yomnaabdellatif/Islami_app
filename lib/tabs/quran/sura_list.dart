import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

import '../../model/quran_model.dart';

class SuraList extends StatelessWidget {
  QuranModel quranModel;
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
                "${quranModel.index + 1}",
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
                  Text("${quranModel.suraEnglishName}",
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text("${quranModel.numOfVerses} verses",
                      style: TextStyle(color: AppColors.white, fontSize: 16))
                ]),
                Text("${quranModel.suraArabicName}",
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
