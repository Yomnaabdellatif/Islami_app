import 'package:flutter/material.dart';
import 'package:islami_app/model/quran_model.dart';
import 'package:islami_app/tabs/quran/sura_details_screen.dart';
import 'package:islami_app/tabs/quran/sura_list.dart';
import 'package:islami_app/utilities/app_colors.dart';
import 'package:islami_app/utilities/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTap extends StatefulWidget {
  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      QuranModel.suraList.add(QuranModel(
          suraEnglishName: QuranModel.suraEnglishNameList[i],
          suraArabicName: QuranModel.suraArabicNameList[i],
          numOfVerses: QuranModel.numVersesList[i],
          index: i + 1));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSuraList();
    loadLastSura();
  }

  List<QuranModel> filterList = QuranModel.suraList;
  String searchText = '';
  Map<String, String> lastSura = {};
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Widget buildMostRecently() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Most Recently", style: AppStyles.bold16WhiteJanna),
          SizedBox(
            height: height * 0.01,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(20)),
              height: height * 0.16,
              width: width * 0.53,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${lastSura["suraEnName"]}",
                        style: AppStyles.bold24BlackJanna,
                      ),
                      Text(
                        "${lastSura["suraArName"]}",
                        style: AppStyles.bold24BlackJanna,
                      ),
                      Text(
                        "${lastSura["numOfVerses"]}verses",
                        style: AppStyles.bold14BlackJanna,
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/images/quraan_card.png",
                    width: width * 0.35,
                    height: height * 0.14,
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      margin: EdgeInsets.all(height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/islami_logo.png",
            height: height * 0.18,
            width: width * 0.67,
          ),
          TextField(
            onChanged: (text) {
              searchText = text;
              filterList = QuranModel.suraList.where((sura) {
                return sura.suraArabicName.contains(searchText) ||
                    sura.suraEnglishName
                        .toLowerCase()
                        .contains(searchText.toLowerCase());
              }).toList();
              setState(() {});
            },
            style: AppStyles.bold16WhiteJanna,
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
            height: height * 0.02,
          ),
          searchText.isNotEmpty ? SizedBox() : buildMostRecently(),
          SizedBox(
            height: height * 0.01,
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
                  saveLastSura(
                      suraEnName: filterList[index].suraEnglishName,
                      suraArName: filterList[index].suraArabicName,
                      numOfVerses: filterList[index].numOfVerses);

                  Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                      arguments: filterList[index]);
                },
                child: SuraList(
                  quranModel: filterList[index],
                ),
              );
            },
            itemCount: filterList.length,
            padding: EdgeInsets.zero,
          ))
        ],
      ),
    );
  }

  Future<void> saveLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numOfVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("suraEnName", suraEnName);
    await prefs.setString("suraArName", suraArName);
    await prefs.setString("numOfVerses", numOfVerses);
    await loadLastSura();
  }

  Future<Map<String, String>> getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = await prefs.getString("suraEnName") ?? "";
    String suraArName = await prefs.getString("suraArName") ?? "";
    String numOfVerses = await prefs.getString("numOfVerses") ?? "";
    return {
      "suraEnName": suraEnName,
      "suraArName": suraArName,
      "numOfVerses": numOfVerses
    };
  }

  // Future <void> saveLastSura(int index)async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //    await prefs.setInt("index", index) ;
  // }
  //
  // Future<int> getLastSura()async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final int index= await prefs.getInt("index")??0;
  //
  //   return index ;
  //
  // }

  loadLastSura() async {
    lastSura = await getLastSura();
    setState(() {});
  }
}
