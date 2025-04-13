import 'package:book_01/controller/system_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../service/models/book_detail_model.dart';
import '../service/models/book_model.dart';
import '../service/themes/app_constant.dart';
import 'children/appbar_detail_book_widget.dart';
import 'children/button_reading_widget.dart';
import 'children/category_book_widget.dart';
import 'children/shortcut_book_widegt.dart';

class DetailBookScreen extends StatelessWidget {
  DetailBookScreen({super.key, required this.model});
  BookModel model;
  final controller = Get.find<SystemController>();
  BookDetailModel modelDetail = BookDetailModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return SafeArea(
              child: Skeletonizer(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.padding),
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppbarDetailBookWidget(
                                  title: "No data",
                                ),
                                ShortcutBookWidegt(
                                  model: model,
                                  modelDetail: null,
                                ),
                                CategoryBookWidget(
                                  categories: ['ádhaksjd', 'ahsdladsl'],
                                  quanityChapters: '4',
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 15),
                                          child: const Text(
                                            "Overview",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Text(
                                              model.thumbNailURL ?? "Null data",
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  letterSpacing: 1.2,
                                                  wordSpacing: 1.4,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          ButtonReadingWidget(
                            model: modelDetail,
                          ),
                        ],
                      ))));
        }
        modelDetail = controller.detailBookMoMel.value;

        return SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.padding),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppbarDetailBookWidget(
                            title: model.nameBook ?? "No data",
                          ),
                          ShortcutBookWidegt(
                            model: model,
                            modelDetail: modelDetail,
                          ),
                          CategoryBookWidget(
                            categories: modelDetail.catogories,
                            quanityChapters: '${modelDetail.quanityChapters}',
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    child: const Text(
                                      "Overview",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        modelDetail.descriptionHead,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            letterSpacing: 1.2,
                                            wordSpacing: 1.4,
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    ButtonReadingWidget(
                      model: modelDetail,
                    ),
                  ],
                )));
      }),
    );
  }
}
