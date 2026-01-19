import 'package:flutter/material.dart';
import 'package:alasfor/core/constants/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final double? letterSpacing;

  const AppText._({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
  });

  // Large: 24px - For titles and headers
  const AppText.large(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
    this.fontWeight = FontWeight.bold,
  }) : fontSize = 24;

  // Medium: 16px - For subtitles and body text
  const AppText.medium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
    this.fontWeight = FontWeight.w500,
  }) : fontSize = 16;

  // Small: 12px - For captions and labels
  const AppText.small(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
    this.fontWeight = FontWeight.normal,
  }) : fontSize = 12;

  // Extra Large: 28px - For main headings
  const AppText.xlarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
    this.fontWeight = FontWeight.bold,
  }) : fontSize = 28;

  // Body: 14px - For regular body text
  const AppText.body(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
    this.fontWeight = FontWeight.normal,
  }) : fontSize = 14;

  // Caption: 10px - For very small text
  const AppText.caption(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
    this.fontWeight = FontWeight.normal,
  }) : fontSize = 10;

  // Custom: Any size
  const AppText.custom(
    this.text, {
    super.key,
    required this.fontSize,
    this.color,
    this.textAlign,
    this.textDirection,
    this.maxLines,
    this.overflow,
    this.height,
    this.letterSpacing,
    this.fontWeight = FontWeight.normal,
  });

  static const String fontFamily = 'Tajawal';

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? AppColors.textPrimary,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
