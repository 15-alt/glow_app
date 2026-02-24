import 'package:flutter/material.dart';
import 'package:glowapp/models/doctor_model.dart';

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});

  @override
  State<DoctorScreen> createState() => DoctorScreenState();
}

class DoctorScreenState extends State<DoctorScreen> {
  int currentIndex = 0;

  final List<DoctorModel> doctors = [
    DoctorModel(
      name: "Dr Alexander Bell",
      specialty: "Cosméticien",
      image: 'assets/doctor_1.jpg',
      degree: "Ph.D",
    ),
    DoctorModel(
      name: "Dr Stephane Bell",
      specialty: "Chirurgien plasticien",
      image: 'assets/doctor_2.jpg',
      degree: "M.D",
    ),
    DoctorModel(
      name: "Dr Annabelle Bell",
      specialty: "Dermatologue",
      image: 'assets/doctor_3.jpg',
      degree: "D.O",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// APP BAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "DOCTORS",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,

        actions: const [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.tune, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),

      /// BODY
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              onPressed: () {
                Navigator.pushNamed(context, '/doctorInfo', arguments: doctor);
              },

              icon: const Icon(Icons.person),
              label: const Text("Voir profil"),
            );

            return Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              child: ListTile(
                contentPadding: const EdgeInsets.all(12),

                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(doctor.image),
                ),

                title: Text(
                  doctor.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(doctor.specialty),
                    Text(
                      doctor.degree,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),

                trailing: IconButton(
                  icon: const Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.blue,
                  ),

                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/doctorInfo',
                      arguments: doctor,
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),

      /// BOTTOM NAVIGATION BAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
