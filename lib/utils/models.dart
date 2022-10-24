import 'dart:core';

import 'package:flutter/material.dart';

class User {
  int id;
  String name, position, image;

  User({
    required this.image,
    required this.name,
    required this.id,
    required this.position,
  });
}

class Course {
  int id;
  String name;
  int lessons, lessonsDone, hours, hoursDone, studentCount;

  Course(
      {required this.id,
      required this.name,
      required this.lessons,
      required this.lessonsDone,
      required this.hours,
      required this.hoursDone,
      required this.studentCount});
}

class HomeWork {
  int courseId, id;
  DateTime dueDate;
  DateTime? subMissionDate;
  String courseCode, name, status;
  List<String> fileLinks;
  String feedBack;

  HomeWork(
      {required this.id,
      required this.courseId,
      required this.courseCode,
      required this.dueDate,
      required this.feedBack,
      required this.fileLinks,
      required this.name,
      required this.status,
      this.subMissionDate});

 changeStatus( String status ){
   print('This is the old status ${this.status}');
    this.status = status;
    print('This is the new status ${this.status}');

  }
}

class Message {
  DateTime timeStamp;
  int id, sender;

  /* type = Video, document, text, audio, image, link;
  status = delivered, read, sent */
  String type, content, status;

  Message(
      {required this.type,
      required this.content,
      required this.timeStamp,
      required this.id,
      required this.status,
      required this.sender});
}

class UserConversation {
  List<User> users;
  // type: 0-Individual 1- Group
  int type;

  List<Message> messages;

  UserConversation({required this.users, required this.type, required this.messages});
}
