import 'package:flutter/material.dart';
import 'package:vending_machine/utils/blink.dart';

class CustomButton {
  static Widget productAvailable() {
    return BlinkWidget(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            Icons.file_download,
            color: Colors.black,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.green[700],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            Icons.file_download,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  static Widget productUnavailable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red[600],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.close,
        color: Colors.black,
      ),
    );
  }
}
