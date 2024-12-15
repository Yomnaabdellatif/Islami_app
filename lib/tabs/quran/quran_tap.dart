import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/model/quran_model.dart';
import 'package:islami_app/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/tabs/quran/sura_list.dart';

class QuranTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/islami_logo.png"),
          TextField(
            style: TextStyle(color: AppColors.white),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.blackBG,
                hintText: "sura name",
                hintStyle: TextStyle(color: AppColors.white),
                prefixIcon: ImageIcon(
                  AssetImage("assets/images/quraan_icon.png"),
                  color: AppColors.gold,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.gold,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.gold,
                    ))),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Most Recently",
            style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(11),
            decoration: BoxDecoration(
                color: AppColors.gold, borderRadius: BorderRadius.circular(20)),
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "sura english",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "sura arabic",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "verses",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image.asset("assets/images/quraan_card.png")
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "sura list",
            style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                indent: 64,
                endIndent: 64,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                      arguments: QuranModel.GetSuraModel(index));
                },
                child: SuraList(
                  quranModel: QuranModel.GetSuraModel(index),
                ),
              );
            },
            itemCount: QuranModel.GetItemCount(),
            padding: EdgeInsets.zero,
          ))
        ],
      ),
    );
  }
}
