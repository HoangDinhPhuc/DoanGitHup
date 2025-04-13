import 'package:flutter/material.dart';

import '../service/themes/app_color.dart';

class AppBarListChaptersWidget extends StatelessWidget {
  const AppBarListChaptersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        const Text(
          "Chương truyện",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: AppColors.black),
        ),
        const Icon(
          Icons.more_vert_sharp,
          size: 28,
          color: Colors.white,
        )
      ],
    );
  }
}
