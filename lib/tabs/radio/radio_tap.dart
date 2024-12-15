import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/tabs/radio/radio_list.dart';

class RadioTap extends StatelessWidget {
  List<String> radio = [
    "Radio AbdulBaset AbdulSamad",
    "Radio Mahmoud Khalil Al-Husary",
    "Radio Mishari Rashid al-`Afasy",
    "Radio Mohamed Siddiq al-Minshawi",
    "Radio Mustafa Ismail",
    "Radio Abdullah Ali Jabir",
    "Radio Mahmoud Ali Al Banna"
  ];
  List<String> reciters = [
    "AbdulBaset AbdulSamad",
    "Mahmoud Khalil Al-Husary",
    "Mishari Rashid al-`Afasy",
    "Mohamed Siddiq al-Minshawi",
    "Mustafa Ismail",
    "Abdullah Ali Jabir",
    "Mahmoud Ali Al Banna"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Image.asset("assets/images/islami_logo.png"),
          Container(
            color: AppColors.blackBG,
            child: TabBar(
                dividerHeight: 0,
                indicatorColor: AppColors.gold,
                splashBorderRadius: BorderRadius.circular(12),
                labelStyle: TextStyle(fontSize: 16),
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.white,
                unselectedLabelStyle: TextStyle(fontSize: 16),
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
    );
  }
}
