import 'package:flutter/material.dart';
import 'package:islami_app/model/hadeeth_model.dart';

import '../../app_colors.dart';

class HadeethContent extends StatelessWidget {
  static String routeName = "hadeth";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadeethModel;

    TextStyle styleOfContent = TextStyle(
      color: AppColors.gold,
      fontSize: 20,
    );
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(),
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
                "${args.title}",
                style: styleOfContent,
              ),
              Expanded(
                  child: args.hadeethContent.isEmpty
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
                                child: Text("${args.hadeethContent.join("")}",
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
}
