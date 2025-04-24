import 'package:flutter/material.dart';

class widgettest extends StatelessWidget {
  const widgettest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 600,
            height: 140,
            decoration: BoxDecoration(
              color: const Color(0xFFF8964F),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  offset: const Offset(3, 4),
                  blurRadius: 4,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Inter',
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Container(
                            width: 120,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.25),
                                  offset: const Offset(3, 4),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                ),
                              ],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(17),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Role Name',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.person,
                                      size: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // onTap: () {
                        //   if (role == 'HRD') {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => const ProfileHRDPage()),
                        //     );
                        //   } else {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) =>
                        //               const ProfileKaryawanPage()),
                        //     );
                        //   }
                        // },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Role Name',
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 400,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 40),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align content to the left
                children: [
                  const Text(
                    "Schedule today",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: 300,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 4),
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 40, // Adjust based on text height
                            child: Image.asset(
                              'assets/img/WhatsApp_Image_2024-05-16_at_19.45 1.png', // Replace with your local image path
                              width: 100,
                              height: 50,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 16,
                              ),
                              child: const Text(
                                'No schedule',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 20),
            child: SizedBox(
              width: 430,
              height: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Application features",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Commissioner',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            'assets/img/WhatsApp_Image_2024-05-16_at_21.59 2.png',
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/img/WhatsApp_Image_2024-05-16_at_21.59 2.png',
                          ),
                        ),
                        Expanded(
                          child: Image.asset(
                            'assets/img/WhatsApp_Image_2024-05-16_at_21.59 2.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          'assets/img/WhatsApp_Image_2024-05-16_at_21.59 2.png',
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/img/WhatsApp_Image_2024-05-16_at_21.59 2.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
