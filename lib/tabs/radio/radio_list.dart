import 'package:flutter/cupertino.dart';
import 'package:islami_app/utilities/app_styles.dart';

class RadioList extends StatelessWidget {
  String radioname;

  RadioList({required this.radioname});

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/radio_stop.png"),
        Column(
          children: [
            Text(
              radioname,
              style: AppStyles.bold20BlackJanna,
            ),
            Container(
              margin: EdgeInsets.all(hieght * 30 / 932),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.heart_fill,
                    size: width * (35 / 430),
                  ),
                  Icon(
                    CupertinoIcons.play_arrow_solid,
                    size: width * (35 / 430),
                  ),
                  Icon(
                    CupertinoIcons.volume_up,
                    size: width * (35 / 430),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
