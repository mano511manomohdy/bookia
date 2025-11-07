import 'package:flutter/material.dart';

TextStyle GetHeadLineTextStyle(
  BuildContext context, {
  double? fontsize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: "DM Serif Display",
    fontWeight: fontWeight ?? FontWeight.bold,
    fontSize: fontsize ?? 30,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle GetTitleTextStyle(
  BuildContext context, {
  double? fontsize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: "DM Serif Display",
    fontWeight: fontWeight ?? FontWeight.bold,
    fontSize: fontsize ?? 16,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle GetBodyTextStyle(
  BuildContext context, {
  double? fontsize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: "DM Serif Display",
    fontWeight: fontWeight ?? FontWeight.w600,
    fontSize: fontsize ?? 16,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle GetSmallTextStyle(
  BuildContext context, {
  double? fontsize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: "DM Serif Display",
    fontWeight: fontWeight ?? FontWeight.normal,
    fontSize: fontsize ?? 14,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}
