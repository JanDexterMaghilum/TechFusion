import 'package:birthtrack/admindashboard_page/add_patient_record.dart';
import 'package:birthtrack/admindashboard_page/addpatientrecords.dart';
import 'package:birthtrack/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:birthtrack/pages/login_page.dart';


class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

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

  final List<Map<String, String>> _recentRecords = [
    {
      'name': 'John Doe',
      'date': '2023-10-01',
      'status': 'Checked In',
    },
    {
      'name': 'Jane Smith',
      'date': '2023-09-30',
      'status': 'Pending',
    },
    {
      'name': 'Alice Johnson',
      'date': '2023-09-29',
      'status': 'Completed',
    },
  ];

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
                          if (item['title'] == 'Settings') {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    width: 500,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.95),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 35,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _buildSettingsButton(
                                          'UPDATE ACCOUNTS INFORMATION',
                                          () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        _buildSettingsButton(
                                          'CREATE STAFF ACCOUNT',
                                          () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        _buildSettingsButton(
                                          'CHANGE PASSWORD',
                                          () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        _buildSettingsButton(
                                          'LOGOUT',
                                          () {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const LoginPage(),
                                              ),
                                              (route) => false,
                                            );
                                          },
                                          isLogout: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (item['title'] == 'Dashboard') {
                            setState(() => _selectedIndex = 0);
                          } else if (item['title'] == 'Patient Records') {
                            setState(() {
                              _selectedIndex = 1;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PatientRecordsPage(),
                                ),
                              );
                            });
                          } else if (item['title'] == 'Add Patient') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddPatientRecord(),
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
          // Main Content Area
          Expanded(
            child: Container(
              color: Colors.grey.shade50,
              child: Column(
                children: [
                  // Top App Bar
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(
                          _sidebarItems[_selectedIndex]['title'],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.notifications_outlined),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  // Main Content
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Stats Cards Row
                          Row(
                            children: [
                              _buildStatCard(
                                'Total Patients',
                                '1,234',
                                Icons.people,
                                Colors.blue,
                              ),
                              _buildStatCard(
                                'Appointments',
                                '42',
                                Icons.calendar_today,
                                Colors.orange,
                              ),
                              _buildStatCard(
                                'New Reports',
                                '8',
                                Icons.report,
                                Colors.red,
                              ),
                            ].expand((widget) => [
                              Expanded(child: widget),
                              const SizedBox(width: 16),
                            ]).toList()
                              ..removeLast(),
                          ),
                          const SizedBox(height: 20),
                          // Recent Records Section
                          const Text(
                            'Recent Records',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ..._recentRecords.map((record) {
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.pink.shade100,
                                  child: const Icon(Icons.person, color: Colors.pink),
                                ),
                                title: Text(record['name']!),
                                subtitle: Text('Date: ${record['date']}'),
                                trailing: Text(
                                  record['status']!,
                                  style: TextStyle(
                                    color: record['status'] == 'Completed'
                                        ? Colors.green
                                        : record['status'] == 'Pending'
                                            ? Colors.orange
                                            : Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsButton(String text, VoidCallback onPressed, {bool isLogout = false}) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isLogout ? const Color(0xFFFF5757) : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isLogout ? const Color(0xFFFF5757) : Colors.white,
          foregroundColor: isLogout ? Colors.white : Colors.black87,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: isLogout ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
