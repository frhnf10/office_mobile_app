import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Absence extends StatefulWidget {
  const Absence({super.key});

  @override
  State<Absence> createState() => _AbsenceState();
}

class _AbsenceState extends State<Absence> {
  late CameraController _cameraController;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[0], // Menggunakan kamera pertama (biasanya kamera belakang)
      ResolutionPreset.medium,
    );
    await _cameraController.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double boxSize = 5 * 37.795;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'absence',
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
      body: Center(
        child:
            _cameraController.value.isInitialized
                ? SizedBox(
                  width: boxSize,
                  height: boxSize,
                  child: CameraPreview(_cameraController),
                )
                : const CircularProgressIndicator(),
      ),
    );
  }
}

class AbsenceHRD extends StatefulWidget {
  const AbsenceHRD({super.key});

  @override
  State<AbsenceHRD> createState() => _AbsenceHRDState();
}

class _AbsenceHRDState extends State<AbsenceHRD> {
  final List<Map<String, String>> employeeContacts = const [
    {'name': 'Farhan Fath', 'timestamp': '07:12'},
    {'name': 'Nikita Maulidya', 'timestamp': '07:01'},
    {'name': 'Chelsea Georgia', 'timestamp': '06:55'},
    {'name': 'Rizky Pratama', 'timestamp': '07:15'},
    {'name': 'Dewi Sartika', 'timestamp': '07:10'},
    {'name': 'Budi Santoso', 'timestamp': '07:20'},
    {'name': 'Siti Aminah', 'timestamp': '07:05'},
    {'name': 'Andi Wijaya', 'timestamp': '07:18'},
    {'name': 'Rina Marlina', 'timestamp': '07:00'},
    {'name': 'Joko Susilo', 'timestamp': '07:22'},
    {'name': 'Lina Marlina', 'timestamp': '07:25'},
    {'name': 'Agus Salim', 'timestamp': '07:30'},
    {'name': 'Siti Nurhaliza', 'timestamp': '07:28'},
    {'name': 'Eko Prabowo', 'timestamp': '07:35'},
    {'name': 'Tina Sari', 'timestamp': '07:32'},
    {'name': 'Rudi Hartono', 'timestamp': '07:40'},
    {'name': 'Wati Lestari', 'timestamp': '07:38'},
    {'name': 'Dani Saputra', 'timestamp': '07:45'},
    {'name': 'Siti Zulaikha', 'timestamp': '07:42'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Absensi Pegawai')),
      body: ListView.builder(
        itemCount: employeeContacts.length,
        itemBuilder: (context, index) {
          final contact = employeeContacts[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(contact['name']!),
            subtitle: Text(contact['timestamp']!),
          );
        },
      ),
    );
  }
}
