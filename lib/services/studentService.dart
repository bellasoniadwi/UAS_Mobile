
import 'dart:async';

import 'package:uas_mobile/db_helper/repository.dart';
import 'package:uas_mobile/model/Student.dart';

class StudentService
{
  late Repository _repository;
  StudentService(){
    _repository = Repository();
  }

  //Save Student
  SaveStudent(Student student) async{
    return await _repository.insertData('students', student.studentMap());
  }
  
  //Read All Student
  readAllStudents() async{
    return await _repository.readData('students');
  }

  //Edit Student
  UpdateStudent(Student student) async{
    return await _repository.updateData('students', student.studentMap());
  }

  deleteStudent(studentId) async {
    return await _repository.deleteDataById('students', studentId);
  }

}