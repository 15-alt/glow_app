import 'package:flutter/material.dart';

class MiniInfo extends StatelessWidget {
  final String title;
  final String text;

  const MiniInfo(this.title, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 6),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
