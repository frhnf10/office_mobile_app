import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:office_mobile_app/dashboard.dart';

class Holiday extends StatelessWidget {
  Holiday({super.key});
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _fromedateController = TextEditingController();
  final TextEditingController _untildateController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  Future saveRequest() async {
    try {
      final response = await http.post(
        // Uri.parse('http://flutter-db-officemobile.test:8080/api/post'),
        Uri.parse('http://10.60.227.10:8000/api/post'),
        body: {
          'employee_name': _nameController.text,
          'from_date': _fromedateController.text,
          'until_date': _untildateController.text,
          'reason': _reasonController.text,
        },
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        if (responseBody == null) {
          throw Exception('API returned null response');
        }
        return responseBody;
      } else {
        throw Exception(
          'Failed to send request. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Holiday Request',
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
                    labelText: 'Enter your name',
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  'From',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextFormField(
                  controller: _fromedateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Select start date',
                  ),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      _fromedateController.text =
                          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your start date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                const Text(
                  'Until',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextFormField(
                  controller: _untildateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Select end date',
                  ),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      _untildateController.text =
                          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your end date';
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
                          saveRequest()
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
                                      content: Text(
                                        'Holiday Request Has Been Sent',
                                      ),
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

class HolidayHRD extends StatefulWidget {
  const HolidayHRD({super.key});

  @override
  State<HolidayHRD> createState() => _HolidayHRDState();
}

class _HolidayHRDState extends State<HolidayHRD> {
  Future getEmployeesHoliday() async {
    final response = await http.get(
      // Uri.parse('http://flutter-db-officemobile.test:8080/api/holidayHRD'),
      Uri.parse('http://10.60.227.10:8000/api/holidayHRD'),
    );
    return json.decode(response.body);
  }

  Future Rejected(String employeeID) async {
    String url =
        // 'http://flutter-db-officemobile.test:8080/api/holidayHRD/$employeeID';
        'http://10.60.227.10:8000/api/holidayHRD/$employeeID';
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
          'Employee Holiday Request',
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
        future: getEmployeesHoliday(),
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
                            'Durasi Izin:',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${snapshot.data['data'][index]['from_date']}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          Text('s/d'),
                          Text(
                            '${snapshot.data['data'][index]['until_date']}',
                            style: TextStyle(fontSize: 16.0),
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
                            snapshot.data['data'][index]['reason'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Rejected(
                                    snapshot.data['data'][index]['id']
                                        .toString(),
                                  ).then((value) {
                                    setState(() {});
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Izin Ditolak')),
                                    );
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red[400],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.cancel_outlined,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Tolak',
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
