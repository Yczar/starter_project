import 'package:flutter/material.dart';

class ImageObject extends StatelessWidget {
  String imageurl;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title ?? "empty"),
    );
  }
}
