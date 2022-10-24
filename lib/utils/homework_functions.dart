

import 'package:probook_student/utils/models.dart';

class HomeWorkFunctions {
  List<String> status = [
    'due','submitted','open','graded'
  ];

  checkDueDate(HomeWork homeWork){
    HomeWork changed = homeWork;
   if (homeWork.subMissionDate != null) {
     if(homeWork.status == 'due' && homeWork.dueDate.microsecond < DateTime.now().microsecond){

     }
   }
  }
}