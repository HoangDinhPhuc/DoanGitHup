import 'package:book_01/view/children/content_chapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/models/book_detail_model.dart';
import '../service/themes/app_color.dart';
import '../service/themes/app_constant.dart';
import 'app_bar_list_chapters_widget.dart';

// ignore: must_be_immutable
class ListChaptersScreen extends StatelessWidget {
  ListChaptersScreen({super.key, required this.model});

  BookDetailModel model;

  List<String> items = [
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
    'Chương ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const AppBarListChaptersWidget(),
          const SizedBox(
            height: 28,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: model.chapterUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(
                  //     context, NavigatorNames.CONTENT_CHAPTER, arguments: {
                  //   'list': model.chapterUrls,
                  //   'currentIndex': index
                  // }),
                  Get.to(ContentChapterScreen(
                    urlChapters: model.chapterUrls,
                    index: index,
                  ));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 9),
                  height: 55,
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 120, 167, 136)
                      // index % 2 == 0
                      //     ? const Color.fromARGB(255, 120, 167, 136)
                      //     :
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chương ${index + 1} ",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    )));
  }
}
