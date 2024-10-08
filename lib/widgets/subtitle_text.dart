// import 'package:flutter/material.dart';

// class SubtitleTextWidget extends StatelessWidget {
//   const SubtitleTextWidget(
//     {super.key, 
//     required this.label,
//     this.fontSize = 18,
//     this.fontStyle = FontStyle.normal,
//     this.fontWeight = FontWeight.normal,
//     this.color = Colors.white,
//     this.textDecoration = TextDecoration.none
//     });

//   final String label;
//   final double fontSize;
//   final FontStyle fontStyle;
//   final FontWeight fontWeight;
//   final Color? color;
//   final TextDecoration textDecoration;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       label,
//       style: TextStyle(
//         fontSize: fontSize,
//         fontWeight: fontWeight,
//         decoration: textDecoration,
//         color: color,
//         fontStyle: fontStyle,
//       ),
//     );
//   }
// }

 import 'package:flutter/material.dart';

class SubtitleTextWidget extends StatelessWidget {
  const SubtitleTextWidget({
    super.key,
    required this.label,
    this.fontSize = 18,
    this.fontStyle = FontStyle.normal,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.textDecoration = TextDecoration.none,
  });

  final String label;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final Color? color;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
        // Use the provided color or fallback to theme color based on brightness
        color: color ?? (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
        fontStyle: fontStyle,
      ),
    );
  }
}
