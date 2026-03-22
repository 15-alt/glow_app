import 'package:flutter/material.dart';
import 'package:glowapp/models/doctor_model.dart';
import 'package:glowapp/screens/chatdetails_screen.dart';

class NotificationsScreen extends StatelessWidget {
  final DoctorModel doctor;

  const NotificationsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications - ${doctor.name}"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // action mark all as read
            },
            child: const Text(
              "Mark all",
              style: TextStyle(color: Colors.yellowAccent),
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          NotificationItem(
            doctor: doctor,
            title: "Scheduled Appointment",
            subtitle: "Your appointment with ${doctor.name} is confirmed",
            time: "2 h",
          ),

          NotificationItem(
            doctor: doctor,
            title: "Schedule Change",
            subtitle: "${doctor.name} changed your schedule",
            time: "3 h",
          ),

          NotificationItem(
            doctor: doctor,
            title: "Medical Notes",
            subtitle: "${doctor.name} added medical notes",
            time: "5 h",
          ),

          NotificationItem(
            doctor: doctor,
            title: "Medical History Update",
            subtitle: "Tap to view update from ${doctor.name}",
            time: "1 d",
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final DoctorModel doctor;
  final String title;
  final String subtitle;
  final String time;

  const NotificationItem({
    super.key,
    required this.doctor,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(doctor.image), radius: 25),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 4),

                Text(subtitle, style: const TextStyle(color: Colors.grey)),

                const SizedBox(height: 8),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatDetailScreen(doctor: doctor),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellowAccent,
                    minimumSize: const Size(100, 35),
                  ),

                  child: const Text("Let's Chat"),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          Text(time, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
