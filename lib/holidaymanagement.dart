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
      print('Name: ${_nameController.text}');
      print('From Date: ${_fromedateController.text}');
      print('Until Date: ${_untildateController.text}');
      print('Reason: ${_reasonController.text}');

      final response = await http.post(
        Uri.parse('http://flutter-db-officemobile.test:8080/api'),
        body: {
          'Employee_Name': _nameController.text,
          'From_Date': _fromedateController.text,
          'Until_Date': _untildateController.text,
          'Reason': _reasonController.text,
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
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter fill your date';
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
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter fill your until date';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 45),
                const Text(
                  'Reason',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                TextFormField(
                  controller: _reasonController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
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

class HolidayHRD extends StatelessWidget {
  const HolidayHRD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Holiday Request',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
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
      body: Text(
        'List of Holiday Requests',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
