import 'package:flutter/material.dart';
import 'package:islami_app/model/hadeeth_model.dart';
import 'package:islami_app/utilities/app_styles.dart';

import '../../utilities/app_colors.dart';

class HadeethContent extends StatelessWidget {
  static String routeName = "hadeth";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadeethModel;

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
                style: AppStyles.bold24GoldJanna,
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
                                    style: AppStyles.bold20GoldJanna));
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
