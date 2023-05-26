import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/data/model/personal_info.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/ui_extension.dart';

Widget chip(BuildContext context, String label) => Chip(
      label: Text(
        label,
        style: context.pLabelLarge,
      ),
      backgroundColor: context.backgroundColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: context.primaryColor),
          borderRadius: BorderRadius.circular(20.w)),
    );

Widget progressIndicator(BuildContext context, String label, double progress) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        label,
        style: context.pLabelLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 8.h,
      ),
      Container(
        height: 8.h,
        decoration:
            BoxDecoration(border: Border.all(color: context.secondaryColor)),
        child: LinearProgressIndicator(
          backgroundColor: context.backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(
            context.secondaryColor,
          ),
          value: progress,
        ),
      ),
    ]);

Widget contactDataRowTile(BuildContext context, String asset, String text) =>
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          asset,
          width: 24.w,
        ),
        SizedBox(
          width: 8.w,
        ),
        Flexible(
          child: Text(
            text,
            style: context.pLabelLarge,
          ),
        ),
      ],
    );

Widget universityDataRowTile(BuildContext context, Education education) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          education.degree.toUpperCase(),
          style: context.pBodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          '${education.university}, ${education.address}',
          style: context.pBodyMedium,
        ),
        SizedBox(
          height: 8.w,
        ),
        Text(
          education.duration,
          style: context.pBodySmall!.copyWith(fontWeight: FontWeight.w300),
        ),
      ],
    );

Widget get divider => Divider(
      color: AppColors.black.withOpacity(0.4),
      indent: 32.w,
      height: 40.h,
    );
