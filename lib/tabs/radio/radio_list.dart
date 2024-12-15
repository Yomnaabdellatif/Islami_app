import 'package:flutter/cupertino.dart';

class RadioList extends StatelessWidget {
  String radioname;

  RadioList({required this.radioname});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("assets/images/radio_stop.png"),
        Column(
          children: [
            Text(radioname),
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.heart_fill,
                    size: 30,
                  ),
                  Icon(
                    CupertinoIcons.play_arrow_solid,
                    size: 30,
                  ),
                  Icon(
                    CupertinoIcons.volume_up,
                    size: 30,
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
