import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeeth_model.dart';
import 'package:islami_app/tabs/hadeeth/hadeeth_content.dart';
import 'package:islami_app/utilities/app_styles.dart';

class HadeethTap extends StatefulWidget {
  @override
  State<HadeethTap> createState() => _HadeethTapState();
}

class _HadeethTapState extends State<HadeethTap> {
  List<HadeethModel> hadeethList = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (hadeethList.isEmpty) {
      loadHadeethFile();
    }
    return Container(
      margin: EdgeInsets.only(top: height * 0.03, bottom: height * (20 / 932)),
      child: Column(
        children: [
          Image.asset(
            "assets/images/islami_logo.png",
            height: height * 0.18,
            width: width * 0.67,
          ),
          Expanded(
            child: CarouselSlider.builder(
                itemCount: hadeethList.length,
                itemBuilder: (context, int itemIndex, int pageViewIndex) {
                  return hadeethList.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                HadeethContent.routeName,
                                arguments: HadeethModel(
                                    hadeethContent:
                                        hadeethList[itemIndex].hadeethContent,
                                    title: hadeethList[itemIndex].title));
                          },
                          child: Container(
                              padding: EdgeInsets.all(23),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/hadeth_content_bg.png"),
                                      fit: BoxFit.fill)),
                              child: Column(
                                children: [
                                  Text(
                                    "${hadeethList[itemIndex].title}",
                                    style: AppStyles.bold24BlackJanna,
                                  ),
                                  Expanded(
                                      child: Text(
                                    textDirection: TextDirection.rtl,
                                    "${hadeethList[itemIndex].hadeethContent.join("")}",
                                    style: AppStyles.bold16BlackJanna,
                                  ))
                                ],
                              )),
                        );
                },
                options: CarouselOptions(
                  height: height * 0.66,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.75,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                )),
          ),
        ],
      ),
    );
  }

  void loadHadeethFile() async {
    for (int i = 0; i < 50; i++) {
      String hadeethContent =
          await rootBundle.loadString("assets/files/h${i + 1}.txt");
      List<String> hadeethLines = hadeethContent.split("\n");
      String title = hadeethLines[0];
      hadeethLines.removeAt(0);
      HadeethModel hadeethModel =
          HadeethModel(hadeethContent: hadeethLines, title: title);
      hadeethList.add(hadeethModel);
      setState(() {});
    }
  }
}
