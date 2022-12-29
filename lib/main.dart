import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:uas_mobile/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:uas_mobile/model/Student.dart';
import 'package:uas_mobile/screens/addStudent.dart';
import 'package:uas_mobile/screens/editStudent.dart';
import 'package:uas_mobile/screens/viewStudent.dart';
import 'package:uas_mobile/services/studentService.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(),
      home: AnimatedSplashScreen(
      splash: Image.asset('assets/images/exam.png'),
      splashIconSize: 150,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
      nextScreen: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFe80054),
          title: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: Colors.white,
              )
            ),
            tabs: [
            Tab(
              text: 'INPUT DATA',
            ),
            Tab(
              text: 'LIST DATA',
            )
          ]),
        ),
        body: TabBarView(
          children: [
            Container(child: Main(),),
            Container(child: ListData(),)
          ],
        ),
      ),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _Main();
}

class _Main extends State<Main> {
  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Klik tombol '+' untuk menambahkan biodata baru")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddStudent()))
              .then((data) {
            if (data != null) {
              _showSuccessSnackBar('User Detail Added Success');
            }
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xFFe80054),
      ),
    );
  }
}


class ListData extends StatefulWidget {
  const ListData({Key? key}) : super(key: key);

  @override
  State<ListData> createState() => _ListData();
}

class _ListData extends State<ListData> {
  late List<Student> _studentList = <Student>[];
  final _studentService = StudentService();

  getAllStudentDetails() async {
    var students = await _studentService.readAllStudents();
    _studentList = <Student>[];
    students.forEach((student) {
      setState(() {
        var studentModel = Student();
        studentModel.id = student['id'];
        studentModel.nim = student['nim'];
        studentModel.nama = student['nama'];
        studentModel.alamat = student['alamat'];
        studentModel.telepon = student['telepon'];
        studentModel.gender = student['gender'];
        studentModel.image = student['image'];
        _studentList.add(studentModel);
      });
    });
  }

  @override
  void initState() {
    getAllStudentDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _deleteFormDialog(BuildContext context, studentId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Are You Sure to Delete',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, // foreground
                      backgroundColor: Colors.red),
                  onPressed: ()  async{
                     var result=await _studentService.deleteStudent(studentId);
                     if (result != null) {
                       Navigator.pop(context);
                       getAllStudentDetails();
                       _showSuccessSnackBar(
                           'Student Detail Deleted Successfully');
                     }
                  },
                  child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, // foreground
                      backgroundColor: Colors.teal),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _studentList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewStudent(
                                student: _studentList[index],
                              )));
                },
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    File(_studentList[index].image ?? ''),
                  ),),
                title: Text(_studentList[index].nim ?? ''),
                subtitle: Text(_studentList[index].nama ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditStudent(
                                        student: _studentList[index],
                                      ))).then((data) {
                            // if (data != null) {
                              ListData();
                              _showSuccessSnackBar(
                                  'Biodata Updated Successfully');
                            // }
                          });
                          ;
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.teal,
                        )),
                    IconButton(
                        onPressed: () {
                          _deleteFormDialog(context, _studentList[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
