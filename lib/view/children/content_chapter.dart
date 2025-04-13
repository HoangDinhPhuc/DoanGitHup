import 'package:book_01/controller/system_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../service/themes/app_constant.dart';
import '../image_customer.dart';
import 'appbar_content_chapter_widget.dart';
import 'button_bottom_widget.dart';

class ContentChapterScreen extends StatefulWidget {
  ContentChapterScreen(
      {super.key, required this.urlChapters, required this.index});
  List<String> urlChapters;

  int index;

  @override
  State<ContentChapterScreen> createState() => _ContentChapterScreenState();
}

class _ContentChapterScreenState extends State<ContentChapterScreen> {
  List<String> imagesURL = [
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_13.jpg',
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_14.jpg',
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_15.jpg',
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_16.jpg',
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_17.jpg',
    'https://sv1.otruyencdn.com/uploads/20240505/e4733d5a636948d337bed35f04cb6d1b/chapter_12/page_18.jpg',
  ];

  final controller = Get.find<SystemController>();

  @override
  void initState() {
    super.initState();
    controller.onFetchImagePicture(widget.urlChapters[widget.index]);

    // context
    //     .read<ContentBloc>()
    //     .add(LoadMoreData(urlChapter: widget.urlChapters[widget.index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                AppBarContentChapterWidget(
                  index: widget.index,
                ),
                // const Text(
                //   '',
                //   style: TextStyle(color: Colors.white),
                // ),
                Expanded(child: Obx(() {
                  if (controller.isLoading.value) {
                    return Skeletonizer(
                      child: ListView.builder(
                        itemCount: imagesURL.length,
                        itemBuilder: (context, index) {
                          return CustomImage2(
                            url: imagesURL[index],
                            height: 500,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.pathUrls.length,
                    itemBuilder: (context, index) {
                      return CustomImage2(
                        url: controller.pathUrls[index],
                        height: 500,
                        fit: BoxFit.cover,
                      );
                    },
                  );
                }))
              ],
            )),
            ButtonBottomWidget(
              index: widget.index,
              urlChapters: widget.urlChapters,
            ),
          ],
        ),
      ),
    ));
  }
}
