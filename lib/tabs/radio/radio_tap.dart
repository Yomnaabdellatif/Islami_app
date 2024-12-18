import 'package:flutter/material.dart';
import 'package:islami_app/utilities/app_colors.dart';
import 'package:islami_app/tabs/radio/radio_list.dart';
import 'package:islami_app/utilities/app_styles.dart';

class RadioTap extends StatelessWidget {
  List<String> radio = [
    "Radio AbdulBaset AbdulSamad",
    "Radio Mahmoud Khalil Al-Husary",
    "Radio Mishari Rashid al-`Afasy",
    "Radio Mohamed al-Minshawi",
    "Radio Mustafa Ismail",
    "Radio Abdullah Ali Jabir",
    "Radio Mahmoud Ali Al Banna"
  ];
  List<String> reciters = [
    "AbdulBaset AbdulSamad",
    "Mahmoud Khalil Al-Husary",
    "Mishari Rashid al-`Afasy",
    "Mohamed al-Minshawi",
    "Mustafa Ismail",
    "Abdullah Ali Jabir",
    "Mahmoud Ali Al Banna"
  ];
  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Container(
        margin: EdgeInsets.all(hieght * 0.03),
        child: Column(
          children: [
            Image.asset(
              "assets/images/islami_logo.png",
              height: hieght * 0.18,
              width: width * 0.67,
            ),
            Container(
              color: AppColors.blackBG,
              child: TabBar(
                  dividerHeight: 0,
                  indicatorColor: AppColors.gold,
                  splashBorderRadius: BorderRadius.circular(12),
                  labelStyle: AppStyles.bold16BlackJanna,
                  labelColor: AppColors.black,
                  unselectedLabelColor: AppColors.white,
                  unselectedLabelStyle: AppStyles.bold16WhiteJanna,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tabs: [
                    Tab(
                      text: "Radio",
                    ),
                    Tab(
                      text: "Reciters",
                    )
                  ]),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 5,
                      );
                    },
                    itemBuilder: (context, index) {
                      return RadioList(
                        radioname: radio[index],
                      );
                    },
                    itemCount: radio.length,
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 5,
                      );
                    },
                    itemBuilder: (context, index) {
                      return RadioList(
                        radioname: reciters[index],
                      );
                    },
                    itemCount: reciters.length,
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
