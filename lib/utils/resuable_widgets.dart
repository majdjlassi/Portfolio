
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget chip(context, String label) => Chip(
  label: Text(
    label,
    style: Theme.of(context).textTheme.labelLarge,
  ),
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  shape: RoundedRectangleBorder(
      side: BorderSide(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(20.w)),
);