import 'dart:math';

import 'package:faker/faker.dart' as tempData;
import 'package:probook_student/utils/models.dart';

class CourseActions {
  tempData.Faker faker = tempData.faker;
  List<Course> courses = [];
  CourseActions(){
    for(int i =0 ; i <= 20; i++){
      courses.add(Course(id: (courses.length + 1),
          name: faker.company.position(),
          lessons: 12, lessonsDone: Random().nextInt(12), hours: 52, hoursDone: Random().nextInt(52),
          studentCount: Random().nextInt(32)));
    }
  }
  Course getCourse({required int id}){

    return courses.elementAt(id);
  }
  Course addCourse(Course course){
    courses.add(course);
    return course;
  }
   removeCourse(int id){
    var course = courses.removeWhere((element) => element.id == id);
  }
  getSetCourses(int range){
    return courses.getRange(0, range -1);
  }
}

