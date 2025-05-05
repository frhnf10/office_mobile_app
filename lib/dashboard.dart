import 'package:flutter/material.dart';
import 'package:office_mobile_app/landing_page.dart';
import 'package:office_mobile_app/absence.dart';
import 'package:office_mobile_app/report.dart';
import 'package:office_mobile_app/holidaymanagement.dart';
import 'package:office_mobile_app/instant_message.dart';
import 'package:office_mobile_app/contact.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 234, 219),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome,', style: TextStyle(color: Colors.white)),
                        SizedBox(height: 4),
                        Text(
                          'Farhan Fath',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'UI/UX Designer',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 18,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LandingPage(),
                                ),
                              );
                            },
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              // Schedule Today
              Text(
                'Schedule today',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(20),
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 50,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text('No schedule', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(height: 15),
              // Application Features
              Text(
                'Application features',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Absence()),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fingerprint, size: 32, color: Colors.blue),
                        SizedBox(height: 4),
                        Text(
                          'Absence\nattendance',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Report()),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.report, size: 32, color: Colors.blue),
                        SizedBox(height: 4),
                        Text(
                          'Report',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Holiday()),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.beach_access,
                          size: 32,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Management\nHoliday',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InstantMessage(),
                        ),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.message, size: 32, color: Colors.blue),
                        SizedBox(height: 4),
                        Text(
                          'Instant\nMessage',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Contact()),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.contact_page,
                          size: 32,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Contact',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardPageHRD extends StatelessWidget {
  const DashboardPageHRD({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 234, 219),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome,', style: TextStyle(color: Colors.white)),
                        SizedBox(height: 4),
                        Text(
                          'Farhan Fath',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('HRD', style: TextStyle(color: Colors.white)),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 18,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LandingPage(),
                                ),
                              );
                            },
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              // Schedule Today
              Text(
                'Schedule today',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(20),
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 50,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text('No schedule', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(height: 15),
              // Application Features
              Text(
                'Application features',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Absence()),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fingerprint, size: 32, color: Colors.blue),
                        SizedBox(height: 4),
                        Text(
                          'Absence\nattendance',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Report()),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.report, size: 32, color: Colors.blue),
                        SizedBox(height: 4),
                        Text(
                          'Report',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Holiday()),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.beach_access, size: 32, color: Colors.blue),
                        SizedBox(height: 4),
                        Text(
                          'Management\nHoliday',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InstantMessage(),
                        ),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.message, size: 32, color: Colors.blue),
                        SizedBox(height: 4),
                        Text(
                          'Instant\nMessage',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Contact()),
                      );
                    },
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.contact_page, size: 32, color: Colors.blue),
                        SizedBox(height: 4),
                        Text(
                          'Contact',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
