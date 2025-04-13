import 'package:book_01/controller/system_controller.dart';
import 'package:book_01/view/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/themes/app_color.dart';

class StoryListPage extends StatefulWidget {
  const StoryListPage({super.key});

  @override
  State<StoryListPage> createState() => _StoryListPageState();
}

class _StoryListPageState extends State<StoryListPage> {
  final controller = Get.find<SystemController>();
  late ScrollController _scrollController;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    controller.onInitialController();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 400) {
        loadMore();
      }
    });
  }

  loadMore() {
    if (isLoading == false) {
      return;
    }
    isLoading = false;
    controller.onFetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Truyện tranh'), centerTitle: true, actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
      ]),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            isLoading = true;
            if (controller.books.isEmpty) {
              return Text("Không có data");
            }

            return RefreshIndicator(
              onRefresh: () async {
                controller.onRefreshPage();
              },
              child: GridView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 170 / 300,
                  ),
                  itemCount: controller.books.length,
                  itemBuilder: (context, index) {
                    final model = controller.books[index];
                    isLoading = true;
                    return GestureDetector(
                      onTap: () {
                        controller.onFetchDetailData(model.slug ?? "");
                        Get.to(DetailBookScreen(
                          model: controller.books[index],
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.pinkAccent[100]),
                        width: MediaQuery.sizeOf(context).width / 2 - 12,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 250,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                child: Image.asset(
                                  "assets/images/image_default.jpg",
                                  height: 250,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 7, right: 7, top: 2),
                              child: Text(
                                model.nameBook ?? "Uchiha Itachi",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          })),
        ],
      ),
    );
  }
}

// Add Story Page
class AddStoryPage extends StatelessWidget {
  final SystemController controller = Get.find();
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Story'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Story Title',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (textController.text.isNotEmpty) {
                  // controller.addStory(textController.text);
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Story title cannot be empty',
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
