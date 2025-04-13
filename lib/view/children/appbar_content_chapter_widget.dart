import 'package:flutter/material.dart';

import '../../service/themes/app_color.dart';

class AppBarContentChapterWidget extends StatelessWidget {
  AppBarContentChapterWidget({super.key, required this.index});

  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 22,
              color: Colors.black,
            ),
          ),
          Text(
            "Chương $index",
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.black),
          ),
          const SizedBox(
            width: 25,
            height: 25,
            child: Icon(
              Icons.save,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
