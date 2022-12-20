import 'package:uas_mobile/main.dart';
import 'package:uas_mobile/model/Student.dart';
import 'package:flutter/material.dart';

class ViewStudent extends StatefulWidget {
  final Student student;

  const ViewStudent({Key? key, required this.student}) : super(key: key);

  @override
  State<ViewStudent> createState() => _ViewStudentState();
}

class _ViewStudentState extends State<ViewStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("UAS Mobile"),
      //   backgroundColor: Colors.teal,
      // ),
      body: Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
                child: Text(
                  '\n\nDETAIL BIODATA',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
              ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Text('NIM        :',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(widget.student.nim ?? '',
                    style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text('Nama     :',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(widget.student.nama ?? '',
                    style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text('Alamat   :',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(widget.student.alamat ?? '',
                    style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text('Telepon  :',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(widget.student.telepon ?? '',
                    style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text('Gender   :',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(widget.student.gender ?? '',
                    style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyApp()))
              .then((data) {
          });
        },
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.teal,
      ),);
  }
}
