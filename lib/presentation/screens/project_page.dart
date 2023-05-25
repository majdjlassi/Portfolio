import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/data/model/project.dart';
import 'package:portfolio/presentation/widgets/cached_picture.dart';
import 'package:portfolio/presentation/widgets/cached_svg_picture.dart';
import 'package:portfolio/utils/resuable_widgets.dart';
import 'package:portfolio/utils/ui_extension.dart';

class ProjectPage extends StatefulWidget {
  final Project project;

  const ProjectPage({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        Row(
          children: [
            if (widget.project.icon != null) ...[
              CachedSvgPicture(
                imageUrl: widget.project.icon!,
                width: 64.w,
                height: 64.w,
              ),
              SizedBox(
                width: 8.w,
              )
            ],
            Text(
              widget.project.name,
              style: context.pHeadlineSmall,
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          widget.project.description,
          textAlign: TextAlign.justify,
          style: context.pBodyLarge,
        ),
        SizedBox(
          height: 24.h,
        ),
        if (widget.project.images case List<String>()) ...[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 0.5.sh,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.project.images!.length,
              itemBuilder: (BuildContext context, int index) =>
                  roundedImage(widget.project.images![index]),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
        Text(
          'Achievements',
          style: context.pHeadlineSmall,
        ),
        SizedBox(
          height: 8.h,
        ),
        Html(
          data: widget.project.achievements,
          style: {
            "body": Style(
              color: context.pBodyLarge!.color,
              fontSize: FontSize(16.w, Unit.px),
              fontWeight: context.pBodyLarge!.fontWeight,
              textAlign: TextAlign.justify,
              lineHeight: const LineHeight(1.5),
            ),
          },
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(
          'Technologies',
          style: context.pHeadlineSmall,
        ),
        SizedBox(
          height: 8.h,
        ),
        Wrap(
          spacing: 8.w,
          runSpacing: -6.w,
          children:
              widget.project.technologies.map((e) => chip(context, e)).toList(),
        ),
        SizedBox(
          height: 40.h,
        ),
      ],
    );
  }

  Widget roundedImage(String imageUrl) => CachedPicture(
        imageUrl: imageUrl,
        width: 0.5.sw,
        height: 0.5.sh,
        margin: EdgeInsets.only(right: 24.w),
        borderRadius: BorderRadius.circular(16.w),
        fit: BoxFit.scaleDown,
        backgroundColor: Colors.white,
        border: Border.all(color: Theme.of(context).colorScheme.primary),
      );
}
