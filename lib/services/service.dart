
import 'package:education_app/models/question_model.dart';
import 'package:http/http.dart' as http;




import 'dart:convert';

import 'package:education_app/models/class_progress.dart';
import 'package:education_app/models/lesson_model.dart';
import 'package:education_app/models/profile_model.dart';

Future<Profile> fetchProfiles() async {
  var http;
  final response = await http.get(
    Uri.parse('http://your-backend-url/api/profiles/'),
  );

  if (response.statusCode == 200) {
    return Profile.fromJson(json.decode(response.body));
    // Use the data in your app
    
  } else {
    throw Exception('Failed to load profiles');
  }
}

Future<Lesson> fetchLesson() async {
  final response = await http.get(
    Uri.parse('http://your-backend-url/api/profiles/'),
  );

  if (response.statusCode == 200) {
    return Lesson.fromJson(json.decode(response.body));
    // Use the data in your app
    
  } else {
    throw Exception('Failed to load profiles');
  }
}

Future<UserQuestion> fetchUserQuestion() async {
  final response = await http.get(
    Uri.parse('http://your-backend-url/api/profiles/'),
  );

  if (response.statusCode == 200) {
    return UserQuestion.fromJson(json.decode(response.body));
    // Use the data in your app
    
  } else {
    throw Exception('Failed to load Question');
  }
}
Future<Progress> fetchUsersProgress() async {
  final response = await http.get(
    Uri.parse('http://your-backend-url/api/profiles/'),
  );

  if (response.statusCode == 200) {
    return Progress.fromJson(json.decode(response.body));
    // Use the data in your app
    
  } else {
    throw Exception('Failed to load progress');
  }
}

