import 'package:book_01/controller/system_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/themes/app_color.dart';

// ignore: must_be_immutable
class ButtonBottomWidget extends StatelessWidget {
  ButtonBottomWidget(
      {super.key, required this.index, required this.urlChapters});

  List<String> urlChapters;
  final controller = Get.find<SystemController>();

  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                --index;
                if (index < 0) {
                  index = 0;
                }
                controller.onFetchImagePicture(urlChapters[index]);
              },
              style:
                  ElevatedButton.styleFrom(backgroundColor: AppColors.button),
              child: const Text(
                'Chương trước',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                ++index;
                if (index == urlChapters.length) {
                  index = urlChapters.length - 1;
                }
                controller.onFetchImagePicture(urlChapters[index]);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.button,
              ),
              child: const Text(
                'Chương kế',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
