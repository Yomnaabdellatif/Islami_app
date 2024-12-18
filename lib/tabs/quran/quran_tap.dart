import 'package:flutter/material.dart';
import 'package:islami_app/utilities/app_colors.dart';
import 'package:islami_app/model/quran_model.dart';
import 'package:islami_app/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/tabs/quran/sura_list.dart';
import 'package:islami_app/utilities/app_styles.dart';

class QuranTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(hieght * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/islami_logo.png",
            height: hieght * 0.18,
            width: width * 0.67,
          ),
          TextField(
            style: TextStyle(color: AppColors.white),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.blackBG,
                hintText: "sura name",
                hintStyle: AppStyles.bold16WhiteJanna,
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
            height: hieght * 0.001,
          ),
          Text(
            "Most Recently", style: AppStyles.bold16WhiteJanna),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.gold, borderRadius: BorderRadius.circular(20)),
            height: hieght * 0.16,
            width: width * 0.53,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "sura english",
                      style: AppStyles.bold24BlackJanna,
                    ),
                    Text(
                      "sura arabic",
                      style: AppStyles.bold24BlackJanna,
                    ),
                    Text(
                      "verses",
                      style: AppStyles.bold14BlackJanna,
                    )
                  ],
                ),
                Image.asset(
                  "assets/images/quraan_card.png",
                  width: width * 0.35,
                  height: hieght * 0.14,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "sura list",
            style: AppStyles.bold16WhiteJanna,
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
