import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoData extends StatelessWidget {
  String noDataText;
  NoData({Key? key, required this.noDataText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/gif/no-data.gif'),
          Text(
            noDataText.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
