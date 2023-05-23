import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/utils/resuable_widgets.dart';

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
        Text(
          widget.project.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          widget.project.description,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 24.h,
        ),
        if (widget.project.images.isNotEmpty) ...[
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 0.5.sh,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  widget.project.images.map((e) => roundedImage(e)).toList(),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
        Text(
          'Achievements',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 8.h,
        ),
        Html(
          data: widget.project.achievements,
          style: {
            "body": Style(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: FontSize(16.w, Unit.px),
              fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight,
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
          style: Theme.of(context).textTheme.headlineSmall,
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

  Widget roundedImage(String imagePath) => Container(
        width: 0.5.sw,
        height: 0.5.sh,
        margin: EdgeInsets.only(right: 24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.w),
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.scaleDown,
          ),
        ),
      );
}
