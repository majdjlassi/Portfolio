
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/ui_extension.dart';

Widget chip(BuildContext context, String label) => Chip(
  label: Text(
    label,
    style: context.pLabelLarge,
  ),
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  shape: RoundedRectangleBorder(
      side: BorderSide(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(20.w)),
);