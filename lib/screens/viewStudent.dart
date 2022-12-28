import 'dart:io';

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
      // body: Container(
      //   padding: EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       const Center(
      //         child: Text(
      //           '\n\nDETAIL BIODATA',
      //           style: TextStyle(
      //               fontSize: 50,
      //               color:  Color(0xFFe80054),
      //               fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 50.0,
      //       ),
      //       Row(
      //         children: [
      //           const Text('NIM        :',
      //               style: TextStyle(
      //                   color: Colors.teal,
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w600)),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 20),
      //             child: Text(widget.student.nim ?? '',
      //                 style: TextStyle(fontSize: 16)),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       Row(
      //         children: [
      //           const Text('Nama     :',
      //               style: TextStyle(
      //                   color: Colors.teal,
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w600)),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 20),
      //             child: Text(widget.student.nama ?? '',
      //                 style: TextStyle(fontSize: 16)),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       Row(
      //         children: [
      //           const Text('Alamat   :',
      //               style: TextStyle(
      //                   color: Colors.teal,
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w600)),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 20),
      //             child: Text(widget.student.alamat ?? '',
      //                 style: TextStyle(fontSize: 16)),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       Row(
      //         children: [
      //           const Text('Telepon  :',
      //               style: TextStyle(
      //                   color: Colors.teal,
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w600)),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 20),
      //             child: Text(widget.student.telepon ?? '',
      //                 style: TextStyle(fontSize: 16)),
      //           ),
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       Row(
      //         children: [
      //           const Text('Gender   :',
      //               style: TextStyle(
      //                   color: Colors.teal,
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w600)),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 20),
      //             child: Text(widget.student.gender ?? '',
      //                 style: TextStyle(fontSize: 16)),
      //           ),
      //         ],
      //       ),
      //        const SizedBox(
      //         height: 20,
      //       ),
      //       Row(
      //         children: [
      //           const Text('Foto        :',
      //               style: TextStyle(
      //                   color: Colors.teal,
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w600)),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 5),
      //             child:
      //             widget.student.image != ''
      //             ? Container(
      //               width: 200,
      //               height: 200,
      //                 child: Image.file(
      //                   File(widget.student.image ?? ''),

      //                 ),
      //               )
      //             : Container(),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: Color(0xFFe80054),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 0,
                  child: Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )),
                  ),
                ),
                Positioned(
                    top: 115,
                    left: 20,
                    child: Text(
                      "Detail Biodata",
                      style: TextStyle(fontSize: 30, color: Color(0xFFe80054)),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Container(
            height: 500,
            child: Stack(
              children: [
                Positioned(
                    top: 25,
                    left: 20,
                    child: Material(
                      child: Container(
                        height: 250.0,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: Offset(-5.0, 10.0),
                              blurRadius: 20.0,
                              spreadRadius: 4.0,
                            )
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  top: 0,
                  left: 30,
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                        height: 200,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  FileImage(File(widget.student.image ?? ''))),
                        )),
                  ),
                ),
                Positioned(
                  top: 45,
                  left: 180,
                  child: Container(
                      height: 100,
                      width: 160,
                      padding: EdgeInsets.only(left: 15, bottom: 20, top: 10),
                      child: Column(
                        
                        children: [
                          Row(
                            children: [
                              const Text('NIM   : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text(widget.student.nim ?? '',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          
                          Row(
                            children: [
                              const Text('Nama  : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text(widget.student.nama ?? '',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Alamat   : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text(widget.student.alamat ?? '',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text('Gender   : ',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                              Text(widget.student.gender ?? '',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyHomePage()))
              .then((data) {});
        },
        child: const Icon(Icons.arrow_back),
        backgroundColor: Color(0xFFe80054),
      ),
    );
  }
}
