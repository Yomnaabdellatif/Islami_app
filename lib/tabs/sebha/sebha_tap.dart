import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/islami_logo.png"),
          const Text(
            "سبح اسم ربك الأعلى",
            style: TextStyle(fontSize: 36, color: AppColors.white),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/sebha_vector.png",
                width: 379,
                height: 380,
              ),
              Column(
                children: [
                  Text(
                    "سبحان الله ",
                    style: TextStyle(fontSize: 28, color: AppColors.white),
                  ),
                  Text(
                    "$counter",
                    style: TextStyle(fontSize: 28, color: AppColors.white),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
