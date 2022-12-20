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
        body: Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Detail Biodata",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
                fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text('NIM',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(left: 30),
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
              const Text('Nama',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(left: 25),
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
              const Text('Alamat',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(left: 25),
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
              const Text('Telepon',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(left: 25),
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
              const Text('Jenis Kelamin',
                  style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(widget.student.gender ?? '',
                    style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
