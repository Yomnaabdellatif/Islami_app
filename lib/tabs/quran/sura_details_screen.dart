import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_colors.dart';
import 'package:islami_app/model/quran_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static String routeName = "content";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as QuranModel;
    if (verses.isEmpty) {
      loadSuraFile(args.index);
    }
    List<String> ayawithnum = [];
    for (int i = 1; i <= verses.length; i++) {
      ayawithnum.add(verses[i - 1] + "[$i] ");
    }
    TextStyle styleOfContent = TextStyle(
      color: AppColors.gold,
      fontSize: 20,
    );
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
          title: Text(
        "${args.suraEnglishName}",
        style: styleOfContent,
      )),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
              child: Image.asset(
            "assets/images/black_bg_content.png",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          )),
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "${args.suraArabicName}",
                style: styleOfContent,
              ),
              Expanded(
                  child: verses.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                          color: AppColors.gold,
                        ))
                      : ListView.builder(
                          padding: EdgeInsets.only(top: 10),
                          itemBuilder: (context, index) {
                            return Container(
                                margin: EdgeInsets.all(15),
                                alignment: Alignment.center,
                                child: Text("${ayawithnum.join("")}",
                                    textAlign: TextAlign.center,
                                    textDirection: TextDirection.rtl,
                                    style: styleOfContent));
                          },
                          itemCount: 1,
                        ))
            ],
          )
        ],
      ),
    );
  }

  void loadSuraFile(int index) async {
    String suraContent =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> suraLines = suraContent.split("\n");
    verses = suraLines;

    setState(() {});
  }
}
