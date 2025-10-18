import 'package:flutter/material.dart';

class VideoCategoryCard extends StatefulWidget {
  const VideoCategoryCard({
    super.key,
    required this.icon,
    required this.categoryName,
    required this.videoCount,
  });

  final IconData icon;
  final String categoryName;
  final int videoCount;

  @override
  State<VideoCategoryCard> createState() => _VideoCategoryCardState();
}

class _VideoCategoryCardState extends State<VideoCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(widget.icon, size: 50, color: Colors.white,),
        SizedBox(height: 10),
        Text(
          widget.categoryName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          widget.videoCount.toString(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
