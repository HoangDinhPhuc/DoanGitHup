import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage2 extends StatelessWidget {
  final String url;
  final String name;
  final double height;
  final double? width;
  final double radius;
  final double fontSize;
  final BoxFit fit;
  CustomImage2(
      {required this.url,
      this.name = '',
      required this.height,
      this.width,
      this.radius = 0,
      this.fontSize = 16,
      this.fit = BoxFit.contain});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: url,
        width: width ?? height,
        height: height,
        fit: fit,
        errorWidget: (context, error, stackTrace) {
          return name.isEmpty
              ? Image.asset(
                  'assets/images/product_3.png',
                  width: height,
                  height: height,
                )
              : Container(
                  width: height,
                  height: height,
                  decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color: Colors.redAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                        name.trim().isEmpty
                            ? ''
                            : (name.trim().split(' ').first[0] +
                                name.trim().split(' ').last[0]),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600)),
                  ));
        },
      ),
    );
  }
}
