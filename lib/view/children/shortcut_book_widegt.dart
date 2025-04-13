import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../service/models/book_detail_model.dart';
import '../../service/models/book_model.dart';
import '../image_customer.dart';

class ShortcutBookWidegt extends StatelessWidget {
  ShortcutBookWidegt(
      {super.key, required this.model, required this.modelDetail});
  BookDetailModel? modelDetail;
  BookModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImage2(
          url:
              'https://img.otruyenapi.com/uploads/comics/${model.thumbNailURL}',
          height: 250,
          width: 150,
          fit: BoxFit.cover,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            model.nameBook ?? "No dara",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Text(
          modelDetail?.author ?? "Null data",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar.builder(
              initialRating: 5,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            const Text(
              "5.0",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
