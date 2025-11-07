import 'package:flutter/material.dart';

TextStyle getHeadLineTextStyle(
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

TextStyle getTitleTextStyle(
  BuildContext context, {
  double? fontsize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: "DM Serif Display",
    fontWeight: fontWeight ?? FontWeight.bold,
    fontSize: fontsize ?? 20,
    color: color ?? Theme.of(context).colorScheme.onSurface,
  );
}

TextStyle getBodyTextStyle(
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

TextStyle getSmallTextStyle(
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
