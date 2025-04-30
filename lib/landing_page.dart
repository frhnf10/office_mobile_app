import 'package:flutter/material.dart';
import 'package:office_mobile_app/dashboard.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 234, 219),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "OfficeHub",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Sign in as HRD or Employee",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ],
              ),
              Image.asset('images/Pngtree21.png', width: 200, height: 200),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 98, 0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Sign in as Employee',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardPageHRD(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Sign in as HRD',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                        textAlign: TextAlign.center,
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
  }
}
