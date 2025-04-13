import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppbarDetailBookWidget extends StatelessWidget {
  AppbarDetailBookWidget({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
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
          const Text(
            "Chi tiết truyện",
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          Container(),
        ],
      ),
    );
  }
}
