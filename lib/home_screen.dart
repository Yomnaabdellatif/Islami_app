import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/tabs/hadeeth/hadeeth_tap.dart';
import 'package:islami_app/tabs/quran/quran_tap.dart';
import 'package:islami_app/tabs/radio/radio_tap.dart';
import 'package:islami_app/tabs/sebha/sebha_tap.dart';
import 'package:islami_app/tabs/time/time_tap.dart';

class HomeScreen extends StatefulWidget {
  static String routeName="home screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backGroundImages = [
    "assets/images/quraan_bg.png",
    "assets/images/hadeth_bg.png",
    "assets/images/sebha_bg.png",
    "assets/images/radio_bg.png",
    "assets/images/time_bg.png",
  ];
  List<Widget> appTabs = [
    QuranTap(),
    HadeethTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap()
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backGroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: AppColors.gold),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              // backgroundColor: AppColors.gold,
              // type: BottomNavigationBarType.fixed
              items: [
                BottomNavigationBarItem(
                    icon: buildItemSelectedInBottomNavigationBar(
                        index: 0, imageName: "quraan"),
                    label: "quraan"),
                BottomNavigationBarItem(
                    icon: buildItemSelectedInBottomNavigationBar(
                        index: 1, imageName: "hadeth"),
                    label: "hadeath"),
                BottomNavigationBarItem(
                    icon: buildItemSelectedInBottomNavigationBar(
                        index: 2, imageName: "sebha"),
                    label: "sebha"
                  )
                  , BottomNavigationBarItem(
                      icon: buildItemSelectedInBottomNavigationBar(
                          index: 3, imageName: "radio"),
                      label: "Radio"
                  )
                  , BottomNavigationBarItem(
                      icon: buildItemSelectedInBottomNavigationBar(
                          index: 4, imageName: "time"),
                      label: "time"
                  )

                ],),
            ),
            body: appTabs[selectedIndex],
          )
        ],);
  }

  Widget buildItemSelectedInBottomNavigationBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 19),
            decoration: BoxDecoration(
                color: AppColors.blackBG,
                borderRadius: BorderRadius.circular(66)),
            child: ImageIcon(AssetImage("assets/images/${imageName}_icon.png")),
          )
        : ImageIcon(AssetImage("assets/images/${imageName}_icon.png"));
  }
}