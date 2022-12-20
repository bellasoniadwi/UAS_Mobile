import 'package:uas_mobile/model/Student.dart';
import 'package:uas_mobile/services/studentService.dart';
import 'package:flutter/material.dart';
class EditStudent extends StatefulWidget {
  final Student student;
  const EditStudent({Key? key,required this.student}) : super(key: key);

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  var _studentNimController = TextEditingController();
  var _studentNamaController = TextEditingController();
  var _studentAlamatController = TextEditingController();
  var _studentTeleponController = TextEditingController();
  var _studentGenderController = TextEditingController();

  bool _validateNim = false;
  bool _validateNama = false;
  bool _validateAlamat = false;
  bool _validateTelepon = false;
  bool _validateGender = false;

  var _studentService = StudentService();

  @override
  void initState() {
    setState(() {
      _studentNimController.text=widget.student.nim??'';
      _studentNamaController.text=widget.student.nama??'';
      _studentAlamatController.text=widget.student.alamat??'';
      _studentTeleponController.text=widget.student.telepon??'';
      _studentGenderController.text=widget.student.gender??'';
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UAS Mobile"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'EDIT BIODATA',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _studentNimController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukkan NIM',
                    labelText: 'NIM',
                    errorText:
                        _validateNim ? 'Isian NIM Tidak Boleh Kosong' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _studentNamaController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukkan Nama',
                    labelText: 'Nama',
                    errorText:
                        _validateNama ? 'Isian Nama Tidak Boleh Kosong' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _studentAlamatController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukkan Alamat',
                    labelText: 'Alamat',
                    errorText: _validateAlamat
                        ? 'Isian Alamat Tidak Boleh Kosong'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _studentTeleponController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukkan Nomor Telepon',
                    labelText: 'Nomor Telepeon',
                    errorText: _validateAlamat
                        ? 'Isian Nomor Telepon Tidak Boleh Kosong'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _studentGenderController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Masukkan Jenis',
                    labelText: 'Jenis Kelamin',
                    errorText: _validateGender
                        ? 'Isian Jenis Kelamin Tidak Boleh Kosong'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _studentNimController.text.isEmpty
                              ? _validateNim = true
                              : _validateNim = false;
                          _studentNamaController.text.isEmpty
                              ? _validateNama = true
                              : _validateNama = false;
                          _studentAlamatController.text.isEmpty
                              ? _validateAlamat = true
                              : _validateAlamat = false;
                          _studentTeleponController.text.isEmpty
                              ? _validateTelepon = true
                              : _validateTelepon = false;
                          _studentGenderController.text.isEmpty
                              ? _validateGender = true
                              : _validateGender = false;
                        });
                        if (_validateNim == false &&
                            _validateNama == false &&
                            _validateAlamat == false &&
                            _validateTelepon == false &&
                            _validateGender == false) {
                          // print("Good Data Can Save");
                          var _student = Student();
                          _student.id=widget.student.id;
                          _student.nim = _studentNimController.text;
                          _student.nama = _studentNamaController.text;
                          _student.alamat = _studentAlamatController.text;
                          _student.telepon = _studentTeleponController.text;
                          _student.gender = _studentGenderController.text;

                          var result=await _studentService.UpdateStudent(_student);
                          Navigator.pop(context,result);
                        }
                      },
                      child: const Text('Update Biodata')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _studentNimController.text = '';
                        _studentNamaController.text = '';
                        _studentAlamatController.text = '';
                        _studentTeleponController.text = '';
                        _studentGenderController.text = '';
                      },
                      child: const Text('Clear Biodata'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
