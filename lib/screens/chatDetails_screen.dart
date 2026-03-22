import 'package:flutter/material.dart';
import 'package:glowapp/models/doctor_model.dart';
import 'package:glowapp/screens/payementMethod_screen.dart';

class ChatDetailScreen extends StatefulWidget {
  final DoctorModel doctor;

  const ChatDetailScreen({super.key, required this.doctor});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController messageController = TextEditingController();

  List<Map<String, dynamic>> messages = [
    {"text": "Hello, how can I help you?", "isMe": false},
    {"text": "I have a skin rash", "isMe": true},
    {"text": "Please send a photo", "isMe": false},
  ];

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    setState(() {
      messages.add({"text": messageController.text, "isMe": true});
    });

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doctor.name),
        actions: const [
          Icon(Icons.phone),
          SizedBox(width: 12),
          Icon(Icons.more_vert),
          SizedBox(width: 12),
        ],
      ),

      body: Column(
        children: [
          /// LISTE DES MESSAGES
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

                return MessageBubble(
                  text: message["text"],
                  isMe: message["isMe"],
                );
              },
            ),
          ),

          /// BOUTON PAIEMENT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 45),
              ),
              onPressed: () {
                /// ici tu pourras ouvrir ton écran paiement
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Redirecting to payment...")),
                );
              },
              child: const Text("Proceed to Payment"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PaymentMethodScreen()),
              );
            },
            child: const Text("Save Card"),
          ),

          /// INPUT MESSAGE
          ChatInput(controller: messageController, onSend: sendMessage),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const MessageBubble({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: isMe ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Text(
          text,
          style: TextStyle(color: isMe ? Colors.white : Colors.black87),
        ),
      ),
    );
  }
}

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInput({super.key, required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),

      child: Row(
        children: [
          const Icon(Icons.attach_file, color: Colors.grey),

          const SizedBox(width: 8),

          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration.collapsed(hintText: "Message"),
            ),
          ),

          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: onSend,
          ),
        ],
      ),
    );
  }
}
