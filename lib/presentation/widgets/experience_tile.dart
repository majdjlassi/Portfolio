import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/presentation/widgets/cached_svg_picture.dart';
import 'package:portfolio/utils/ui_extension.dart';

class ExperienceTile extends StatelessWidget {
  final Experience experience;
  final VoidCallback onItemClick;

  const ExperienceTile(
      {Key? key, required this.experience, required this.onItemClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemClick,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: experience.id,
              child: Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.all(Radius.circular(16.w)),
                ),
                child: Center(
                  child: CachedSvgPicture(
                    imageUrl: experience.logo,
                    width: 40.w,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.companyName,
                    style: context.sBodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    experience.position,
                    style: context.sLabelLarge,
                  ),
                  Text(
                    experience.duration,
                    style: context.sLabelLarge,
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/images/ic_right_arrow.svg',
              width: 12.w,
            ),
          ],
        ),
      ),
    );
  }
}
