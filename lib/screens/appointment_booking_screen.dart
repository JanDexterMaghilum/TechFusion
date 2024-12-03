import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({super.key});

  @override
  State<AppointmentBookingScreen> createState() => _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = '9:00 AM';
  String selectedDoctor = 'Dr. Smith';
  String selectedType = 'Check-up';

  final List<String> timeSlots = [
    '9:00 AM', '10:00 AM', '11:00 AM',
    '2:00 PM', '3:00 PM', '4:00 PM',
  ];

  final List<String> appointmentTypes = [
    'Check-up',
    'Ultrasound',
    'Lab Test',
    'Consultation',
  ];

  final TextEditingController notesController = TextEditingController();
  
  get currentUser => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Appointment'),
        backgroundColor: Colors.pink[400],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Selection
              _buildSectionTitle('Select Date'),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.pink[400]),
                  title: Text(
                    DateFormat('EEEE, MMMM d, y').format(selectedDate),
                  ),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 90)),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Colors.pink[400]!,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),

              // Time Selection
              _buildSectionTitle('Select Time'),
              Wrap(
                spacing: 8,
                children: timeSlots.map((time) {
                  return ChoiceChip(
                    label: Text(time),
                    selected: selectedTime == time,
                    onSelected: (selected) {
                      setState(() {
                        selectedTime = time;
                      });
                    },
                    selectedColor: Colors.pink[100],
                    labelStyle: TextStyle(
                      color: selectedTime == time ? Colors.pink[900] : Colors.black,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Appointment Type
              _buildSectionTitle('Appointment Type'),
              Wrap(
                spacing: 8,
                children: appointmentTypes.map((type) {
                  return ChoiceChip(
                    label: Text(type),
                    selected: selectedType == type,
                    onSelected: (selected) {
                      setState(() {
                        selectedType = type;
                      });
                    },
                    selectedColor: Colors.pink[100],
                    labelStyle: TextStyle(
                      color: selectedType == type ? Colors.pink[900] : Colors.black,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              // Notes TextField
              _buildSectionTitle('Additional Notes'),
              TextField(
                controller: notesController,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter any additional information...',
                ),
              ),
              const SizedBox(height: 30),

              // Book Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement booking logic
                    bookAppointment(currentUser, notesController);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[400],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Book Appointment',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void bookAppointment(dynamic currentUser, dynamic notesController) {
    // Get the selected values
    final appointmentData = {
      'date': selectedDate,
      'time': selectedTime,
      'type': selectedType,
      'notes': notesController.text,
      'status': 'pending',  // Initial status
      'timestamp': DateTime.now(),
      'userId': currentUser.uid,
    };

    // Save to Firestore
    FirebaseFirestore.instance
      .collection('appointments')
      .add(appointmentData)
      .then((_) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Appointment booked successfully')),
        );
        
        // Send notification to admin
        sendAdminNotification(appointmentData);
        
        Navigator.pop(context);
      })
      .catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error booking appointment: $error')),
        );
      });
  }

  void sendAdminNotification(Map<String, dynamic> appointmentData) {
    // Add a notification document for admin
    FirebaseFirestore.instance
      .collection('admin_notifications')
      .add({
        'type': 'new_appointment',
        'appointmentData': appointmentData,
        'isRead': false,
        'timestamp': DateTime.now(),
      });
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }
} 