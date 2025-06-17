import 'package:flutter/material.dart';
import 'package:office_mobile_app/instant_message.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});
  final List<Map<String, String>> employeeContacts = const [
    {'name': 'Farhan Fath', 'phone': '081234567890'},
    {'name': 'Nikita Maulidya', 'phone': '082345678901'},
    {'name': 'Chelsea Georgia', 'phone': '083456789012'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kontak Pegawai')),
      body: ListView.builder(
        itemCount: employeeContacts.length,
        itemBuilder: (context, index) {
          final contact = employeeContacts[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(contact['name']!),
            subtitle: Text(contact['phone']!),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Menelepon ${contact['phone']}')),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.message),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => InstantMessage(
                              name: contact['name']!,
                              phone: contact['phone']!,
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ContactHRD extends StatelessWidget {
  const ContactHRD({super.key});
  final List<Map<String, String>> employeeContacts = const [
    {'name': 'Farhan Fath', 'phone': '081234567890'},
    {'name': 'Nikita Maulidya', 'phone': '082345678901'},
    {'name': 'Chelsea Georgia', 'phone': '083456789012'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kontak Pegawai')),
      body: ListView.builder(
        itemCount: employeeContacts.length,
        itemBuilder: (context, index) {
          final contact = employeeContacts[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(contact['name']!),
            subtitle: Text(contact['phone']!),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Menelepon ${contact['phone']}')),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.message),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => InstantMessage(
                              name: contact['name']!,
                              phone: contact['phone']!,
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
