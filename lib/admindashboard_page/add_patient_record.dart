import 'package:flutter/material.dart';
import 'package:birthtrack/admindashboard_page/admindashboard.dart';
import 'package:birthtrack/admindashboard_page/addpatientrecords.dart';

class AddPatientRecord extends StatefulWidget {
  const AddPatientRecord({super.key});

  @override
  State<AddPatientRecord> createState() => _AddPatientRecordState();
}

class _AddPatientRecordState extends State<AddPatientRecord> {
  final _formKey = GlobalKey<FormState>();
  int _selectedIndex = 2; // Set to 2 for Add Patient

  final List<Map<String, dynamic>> _sidebarItems = [
    {
      'title': 'Dashboard',
      'icon': Icons.dashboard_rounded,
    },
    {
      'title': 'Patient Records',
      'icon': Icons.folder_shared_rounded,
    },
    {
      'title': 'Add Patient',
      'icon': Icons.person_add_rounded,
    },
    {
      'title': 'Appointments',
      'icon': Icons.calendar_today_rounded,
    },
    {
      'title': 'Users',
      'icon': Icons.people_rounded,
    },
    {
      'title': 'Reports',
      'icon': Icons.analytics_rounded,
    },
    {
      'title': 'Settings',
      'icon': Icons.settings_rounded,
    },
  ];
  
  // Form controllers
  final _fullNameController = TextEditingController();
  final _philhealthController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _religionController = TextEditingController();
  final _civilStatusController = TextEditingController();
  final _placeOfBirthController = TextEditingController();
  final _addressController = TextEditingController();
  final _occupationController = TextEditingController();
  final _pregnancyCountController = TextEditingController();
  final _dateAdmittedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar Navigation
          Container(
            width: 250,
            color: Colors.white,
            child: Column(
              children: [
                // Admin Logo/Brand
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.admin_panel_settings, 
                          color: Colors.pink.shade400,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Admin Panel',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                // Sidebar Items
                Expanded(
                  child: ListView.builder(
                    itemCount: _sidebarItems.length,
                    itemBuilder: (context, index) {
                      final item = _sidebarItems[index];
                      return ListTile(
                        leading: Icon(
                          item['icon'],
                          color: _selectedIndex == index 
                              ? Colors.pink 
                              : Colors.grey,
                        ),
                        title: Text(
                          item['title'],
                          style: TextStyle(
                            color: _selectedIndex == index 
                                ? Colors.pink 
                                : Colors.grey.shade700,
                            fontWeight: _selectedIndex == index 
                                ? FontWeight.bold 
                                : FontWeight.normal,
                          ),
                        ),
                        selected: _selectedIndex == index,
                        selectedTileColor: Colors.pink.shade50,
                        onTap: () {
                          setState(() => _selectedIndex = index);
                          if (item['title'] == 'Dashboard') {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AdminDashboard(),
                              ),
                            );
                          } else if (item['title'] == 'Patient Records') {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PatientRecordsPage(),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                // Admin Profile
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink.shade100,
                        child: const Icon(Icons.person, color: Colors.pink),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Admin User',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'admin@example.com',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Your existing form content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildFormField('FULL NAME', _fullNameController),
                    const SizedBox(height: 8),
                    _buildFormField('TYPE OF PHILHEALTH MEMBERSHIP', _philhealthController),
                    const SizedBox(height: 8),
                    _buildFormField('BIRTHDATE', _birthDateController),
                    const SizedBox(height: 8),
                    _buildFormField('RELIGION', _religionController),
                    const SizedBox(height: 8),
                    _buildFormField('CIVIL STATUS', _civilStatusController),
                    const SizedBox(height: 8),
                    _buildFormField('PLACE OF BIRTH', _placeOfBirthController),
                    const SizedBox(height: 8),
                    _buildFormField('ADDRESS', _addressController),
                    const SizedBox(height: 8),
                    _buildFormField('OCCUPATION', _occupationController),
                    const SizedBox(height: 8),
                    _buildFormField('PREGNANCY COUNT', _pregnancyCountController),
                    const SizedBox(height: 8),
                    _buildFormField('DATE ADMITTED', _dateAdmittedController),
                    const SizedBox(height: 16),
                    
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Save record logic here
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Save Record'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
} 