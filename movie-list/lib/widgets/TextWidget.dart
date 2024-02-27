import 'package:flutter/material.dart';

class TextWidget {
  TextWidget();

  static Widget textWithStyle(String text, TextStyle style) {
    return Text(text, style: style);
  }

  static Widget detailedText(String text, String data, {bool newRow = false}) {
    // If newRow is true, arrange the text and data in a row with wrapping for data.
    if (newRow) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align items at the start of the row
        children: <Widget>[
          // Fixed part of the text (e.g., "Actors:")
          textWithStyle(text, const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
          Expanded(
            // Allows the Wrap widget to take the remaining space
            child: Wrap(
              // Aligns wrapped text properly
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <Widget>[
                // Dynamic part of the text that wraps
                textWithStyle(data, const TextStyle(
                  fontSize: 18,
                )),
              ],
            ),
          ),
        ],
      );
    } else {
      // If newRow is false, keep the original Row behavior
      return Row(
        children: <Widget>[
          textWithStyle(text, const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
          textWithStyle(data, const TextStyle(
            fontSize: 18,
          )),
        ],
      );
    }
  }
}