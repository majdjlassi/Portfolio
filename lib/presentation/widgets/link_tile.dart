import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/utils/ui_extension.dart';

class LinkTile extends StatelessWidget {
  final String svgAsset;
  final String label;
  final String link;

  const LinkTile(
      {Key? key,
      required this.svgAsset,
      required this.label,
      required this.link})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgAsset,
          width: 32.w,
          colorFilter:
              ColorFilter.mode(context.backgroundColor, BlendMode.modulate),
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Text(
            label,
            style: context.pBodyLarge!.copyWith(color: context.backgroundColor),
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        SvgPicture.asset(
          'assets/images/ic_right_arrow.svg',
          colorFilter:
              ColorFilter.mode(context.backgroundColor, BlendMode.modulate),
          height: 14.w,
        ),
      ],
    );
  }
}
