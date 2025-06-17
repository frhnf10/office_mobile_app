import 'package:flutter/material.dart';

class InstantMessage extends StatelessWidget {
  const InstantMessage({
    super.key,
    required String name,
    required String phone,
  });
  final List<Map<String, String>> employeeContacts = const [
    {'name': 'Farhan Fath', 'phone': '081234567890'},
    {'name': 'Nikita Maulidya', 'phone': '082345678901'},
    {'name': 'Chelsea Georgia', 'phone': '083456789012'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instant Message')),
      body: ListView.builder(
        itemCount: employeeContacts.length,
        itemBuilder: (context, index) {
          final contact = employeeContacts[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(contact['name']!),
            subtitle: Text(contact['phone']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => InstantMessagePage(
                        name: contact['name']!,
                        phone: contact['phone']!,
                      ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class InstantMessagePage extends StatefulWidget {
  final String name;
  final String phone;

  const InstantMessagePage({
    super.key,
    required this.name,
    required this.phone,
  });

  @override
  State<InstantMessagePage> createState() => _InstantMessagePageState();
}

class _InstantMessagePageState extends State<InstantMessagePage> {
  final List<Map<String, dynamic>> _messages = [];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add({'text': _controller.text.trim(), 'isMe': true});
      _controller.clear();
    });
  }

  Widget _buildBubble(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(color: isMe ? Colors.white : Colors.black87),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name), backgroundColor: Colors.orange),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _buildBubble(msg['text'], msg['isMe']);
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.grey[100],
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.add), onPressed: () {}),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
                IconButton(icon: const Icon(Icons.image), onPressed: () {}),
                IconButton(icon: const Icon(Icons.mic), onPressed: () {}),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Ketik pesan...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InstantMessageHRD extends StatelessWidget {
  const InstantMessageHRD({
    super.key,
    required String name,
    required String phone,
  });
  final List<Map<String, String>> employeeContacts = const [
    {'name': 'Farhan Fath', 'phone': '081234567890'},
    {'name': 'Nikita Maulidya', 'phone': '082345678901'},
    {'name': 'Chelsea Georgia', 'phone': '083456789012'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instant Message')),
      body: ListView.builder(
        itemCount: employeeContacts.length,
        itemBuilder: (context, index) {
          final contact = employeeContacts[index];
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(contact['name']!),
            subtitle: Text(contact['phone']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => InstantMessagePageHRD(
                        name: contact['name']!,
                        phone: contact['phone']!,
                      ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class InstantMessagePageHRD extends StatefulWidget {
  final String name;
  final String phone;

  const InstantMessagePageHRD({
    super.key,
    required this.name,
    required this.phone,
  });

  @override
  State<InstantMessagePageHRD> createState() => _InstantMessagePageHRDState();
}

class _InstantMessagePageHRDState extends State<InstantMessagePageHRD> {
  final List<Map<String, dynamic>> _messages = [];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add({'text': _controller.text.trim(), 'isMe': true});
      _controller.clear();
    });
  }

  Widget _buildBubble(String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(color: isMe ? Colors.white : Colors.black87),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name), backgroundColor: Colors.orange),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _buildBubble(msg['text'], msg['isMe']);
              },
            ),
          ),
          const Divider(height: 1),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.grey[100],
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.add), onPressed: () {}),
                IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
                IconButton(icon: const Icon(Icons.image), onPressed: () {}),
                IconButton(icon: const Icon(Icons.mic), onPressed: () {}),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Ketik pesan...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
