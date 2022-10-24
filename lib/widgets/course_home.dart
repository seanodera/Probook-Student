import 'package:flutter/material.dart';
import 'package:probook_student/utils/models.dart';

class CourseHome extends StatelessWidget {
  final Course course;
  final double? width;

  const CourseHome({Key? key, required this.course, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.onSurface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('MATH-101'),
          Text(
            course.name,
            style: theme.textTheme.headline6!.copyWith(overflow: TextOverflow.ellipsis),

          ),

          const SizedBox(height: 5,),
          Row(
            children: [
              const Text('lessons:  '),
              Text(course.lessonsDone.toString(), style: TextStyle(color: theme.colorScheme.secondary),),
              Text('/${course.lessons}')
            ],
          ),
          const SizedBox(height: 5,),
          const Text('Progress:'),
          const SizedBox(height: 5,),
          LinearProgressIndicator(
            minHeight: 7,
            value: (0.5),
            backgroundColor: theme.colorScheme.onBackground,
            valueColor:
                AlwaysStoppedAnimation<Color>(theme.colorScheme.secondary),
          ),

        ],
      ),
    );
  }
}
