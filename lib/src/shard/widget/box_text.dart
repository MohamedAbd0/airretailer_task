import 'package:flutter/material.dart';

import '../styles.dart';
import '../app_colors.dart';

class BoxText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const BoxText.headingOne(this.text, {super.key}) : style = heading1Style;
  const BoxText.headingTwo(this.text, {super.key}) : style = heading2Style;
  const BoxText.headingThree(this.text, {super.key}) : style = heading3Style;
  const BoxText.headline(this.text, {super.key}) : style = headlineStyle;
  const BoxText.subheading(this.text, {super.key}) : style = subheadingStyle;
  const BoxText.caption(this.text, {super.key}) : style = captionStyle;
  const BoxText.title(this.text, {super.key}) : style = titleStyle;
  const BoxText.normal(this.text, {super.key}) : style = normalStyle;

  BoxText.body(this.text, {super.key, Color color = kcMediumGreyColor})
      : style = bodyStyle.copyWith(color: color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
