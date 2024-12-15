import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/hadeeth_model.dart';
import 'package:islami_app/tabs/hadeeth/hadeeth_content.dart';

class HadeethTap extends StatefulWidget {
  @override
  State<HadeethTap> createState() => _HadeethTapState();
}

class _HadeethTapState extends State<HadeethTap> {
  List<HadeethModel> hadeethlist = [];

  @override
  Widget build(BuildContext context) {
    if (hadeethlist.isEmpty) {
      loadHadeethFile();
    }
    return Column(
      children: [
        Image.asset("assets/images/islami_logo.png"),
        Expanded(
          child: CarouselSlider.builder(
              itemCount: hadeethlist.length,
              itemBuilder: (context, int itemIndex, int pageViewIndex) {
                return hadeethlist.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              HadeethContent.routeName,
                              arguments: HadeethModel(
                                  hadeethContent:
                                      hadeethlist[itemIndex].hadeethContent,
                                  title: hadeethlist[itemIndex].title));
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
                                  "${hadeethlist[itemIndex].title}",
                                ),
                                Expanded(
                                    child: Text(
                                        textDirection: TextDirection.rtl,
                                        "${hadeethlist[itemIndex].hadeethContent.join("")}"))
                              ],
                            )),
                      );
              },
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.6,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
        ),

        // ListView.builder(itemBuilder: (context,index){
        //   return  Text("${hadeethlist[index].title}",style: TextStyle(color: AppColors.black),);
        // }
        // ,itemCount: hadeethlist.length,),
      ],
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
      hadeethlist.add(hadeethModel);
      setState(() {});
    }
  }
}
