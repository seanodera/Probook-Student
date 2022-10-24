import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:probook_student/utils/course_functions.dart';
import 'package:probook_student/utils/homework_functions.dart';
import 'package:probook_student/widgets/course_home.dart';
import 'package:probook_student/widgets/home_side.dart';

import '../utils/models.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    CourseActions courseActions = CourseActions();
    List<Course> featuredCourses = courseActions.courses;
    HomeWorkFunctions homeWorkFunctions = HomeWorkFunctions();
    List<HomeWork> dueHomeWorks = List.generate(
        10,
        (index) => HomeWork(
            id: index,
            courseId: courseActions.courses
                .elementAt(Random().nextInt(courseActions.courses.length))
                .id,
            courseCode: 'Math-180',
            dueDate: DateTime.now(),
            feedBack: faker.lorem.sentence(),
            fileLinks: [
              faker.image.toString(),
              faker.image.toString(),
              faker.image.toString(),

            ],
            name: 'HomeWork $index',
            status: homeWorkFunctions.status
                .elementAt(Random().nextInt(homeWorkFunctions.status.length))));
    double width = MediaQuery.of(context).size.width - 500;
    var homeworksItems = List.generate(dueHomeWorks.length, (index) {
      HomeWork homeWork = dueHomeWorks.elementAt(index);
      return TableRow(children: [
        Text(homeWork.courseCode),
        Text(homeWork.name),
        Text(
            '${homeWork.dueDate.day}/${homeWork.dueDate.month}/${homeWork.dueDate.year}'),
        InkWell(
          onTap: () => print(homeWork.name),
          child: Chip(
            label: Text(homeWork.status),
            backgroundColor: (homeWork.status == 'due')
                ? Colors.red
                : (homeWork.status == 'submitted')
                    ? Colors.amber
                    : (homeWork.status == 'graded')
                        ? Colors.greenAccent
                        : null,
          ),
        ),
        HomeworkAction(homeWork: homeWork),
      ]);
    });
    homeworksItems.insert(
        0,
        const TableRow(children: [
          Text('Course Code'),
          Text('Homework Name'),
          Text('Due Date'),
          Text('Status'),
          Text('Actions')
        ]));
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: width,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Courses',
                    style: theme.textTheme.headline6,
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'view More',
                        style: TextStyle(color: theme.colorScheme.onPrimary),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: width,
                height: 120,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return CourseHome(course: featuredCourses.elementAt(index));
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'HomeWorks',
                    style: theme.textTheme.headline6,
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        'view More',
                        style: TextStyle(color: theme.colorScheme.onBackground),
                      ))
                ],
              ),
              const SizedBox(height: 20),
              Table(
                children: homeworksItems,
              )
            ],
          ),
        ),
        const SizedBox(
          width: 300,
          child: HomeSide(),
        )
      ],
    );
  }
}

class HomeworkAction extends StatelessWidget {
  final HomeWork homeWork;

  const HomeworkAction({Key? key, required this.homeWork}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                homeWork.changeStatus(HomeWorkFunctions().status.elementAt(
                    Random().nextInt(HomeWorkFunctions().status.length)));
              },
              icon: const Icon(Icons.download_outlined)),
          IconButton(
              onPressed: () {
                print(homeWork.status);
              },
              icon: const Icon(Icons.remove_red_eye_outlined)),
        ],
      ),
    );
  }
}
