import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/models/book_detail_model.dart';
import '../../service/themes/app_color.dart';
import '../list_chapter.dart';

class ButtonReadingWidget extends StatelessWidget {
  ButtonReadingWidget({super.key, required this.model});
  BookDetailModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.button,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 48),
          ),
          onPressed: () {
            // Navigator.pushNamed(context, NavigatorNames.LIST_CHAPTERS,
            //     arguments: {'BookModelDetail': model});
            Get.to(ListChaptersScreen(
              model: model,
            ));
          },
          child: const Text(
            "Đọc sách",
            style: TextStyle(fontSize: 13, color: Colors.white),
          )),
    );
  }
}
