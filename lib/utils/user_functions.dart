import 'package:faker/faker.dart' as tempData;
import 'package:flutter/material.dart';
import 'package:probook_student/utils/models.dart';

class UserActions {
  tempData.Faker faker = tempData.faker;

 User getCurrentUser() {
    return User(
        image: faker.image.image(),
        name: faker.person.name(),
        id: 0,
        position: faker.company.position());
  }
}
