import 'package:flutter/material.dart';
import '../../shared/ui/scale.dart';

class YellowBorderContainer extends StatelessWidget {
  final double? height;
  final String text;
  const YellowBorderContainer({Key? key, required this.text, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Scale.width(2),
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: AppBorderRadius.brAll5,
          color: Colors.transparent,
          border: Border.all(color: Colors.yellow, width: 2)),
      height: height,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: AppFontSize.s3,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
