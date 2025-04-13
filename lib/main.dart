import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/system_controller.dart';
import 'view/story_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Story Reader',
      onInit: () {
        Get.put(SystemController());
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.pinkAccent[20],
      ),
      home: StoryListPage(),
    );
  }
}
