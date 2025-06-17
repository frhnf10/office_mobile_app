import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:office_mobile_app/dashboard.dart';
import 'dart:convert';

class Report extends StatelessWidget {
  Report({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  Future sendReport() async {
    final respons = await http.post(
      // Uri.parse('http://flutter-db-officemobile.test:8080/api/report'),
      Uri.parse('http://10.60.227.10:8000/api/report'),
      body: {
        'employee_name': _nameController.text,
        'report_reason': _reasonController.text,
      },
    );
    return json.decode(respons.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee Report',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: const Color(0xFFF8964F), // Set the background color
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Employee Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter employee name',
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter employee name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  'Reason',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextFormField(
                  controller: _reasonController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Masukkan alasan Anda',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please explain your reason';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 70),
                Center(
                  child: SizedBox(
                    width: 200, // Set your desired width
                    height: 50, // Set your desired height
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          sendReport()
                              .then((value) {
                                if (value != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DashboardPage(),
                                    ),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Report Has Been Sent'),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Failed to send request. Please try again.',
                                      ),
                                    ),
                                  );
                                }
                              })
                              .catchError((error) {
                                print('Error in saveRequest: $error');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('An error occurred: $error'),
                                  ),
                                );
                              });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[400], // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            19,
                          ), // Reduced corner radius
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReportHRD extends StatefulWidget {
  const ReportHRD({super.key});

  @override
  State<ReportHRD> createState() => _ReportHRDState();
}

class _ReportHRDState extends State<ReportHRD> {
  Future getEmployeesReport() async {
    final response = await http.get(
      // Uri.parse('http://flutter-db-officemobile.test:8080/api/reportHRD'),
      Uri.parse('http://10.60.227.10:8000/api/reportHRD'),
    );
    return json.decode(response.body);
  }

  Future markReport(String employeeID) async {
    String url =
        // 'http://flutter-db-officemobile.test:8080/api/reportHRD/$employeeID';
        'http://10.60.227.10:8000/api/reportHRD/$employeeID';
    var response = await http.delete(Uri.parse(url)); // Mengambil data dari API
    return json.decode(
      response.body,
    ); // Mengubah data dari JSON ke dalam bentuk Map
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Employee Report',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: const Color(0xFFF8964F), // Set the background color
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
        future: getEmployeesReport(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data['data'].length,
              itemBuilder: (context, index) {
                return SafeArea(
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data['data'][index]['employee_name'],
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Alasan:',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            snapshot.data['data'][index]['report_reason'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  markReport(
                                    snapshot.data['data'][index]['id']
                                        .toString(),
                                  ).then((value) {
                                    setState(() {});
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Report Selesai Diatasi'),
                                      ),
                                    );
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green[300],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Masalah Selesai',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Text('Data Error');
          }
        },
      ),
    );
  }
}
