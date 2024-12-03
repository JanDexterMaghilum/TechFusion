import 'package:flutter/material.dart';

class PatientRecordsSettings extends StatefulWidget {
  const PatientRecordsSettings({super.key});

  @override
  State<PatientRecordsSettings> createState() => _PatientRecordsSettingsState();
}

class _PatientRecordsSettingsState extends State<PatientRecordsSettings> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: const Text(
          'PATIENT RECORDS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'SEARCH THE PATIENT NAME',
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Implement search functionality
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Patient Information Section
            Container(
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildInfoPair('FULL NAME', 'DATE ADMITTED'),
                  _buildInfoPair('BIRTHDATE', 'PHILHEALTH MEMBERSHIP'),
                  _buildInfoPair('PLACE OF BIRTH', 'RELIGION'),
                  _buildInfoPair('ADDRESS', 'CIVIL STATUS'),
                  _buildInfoPair('PREGNANCY COUNT', 'OCCUPATION'),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Medical Information Section
            Container(
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildInfoPair('DOCTORS NAME', 'DATE AND TIME DISCHARGE'),
                  _buildInfoPair('ADMITTING STAFF', 'STAFF ON DUTY'),
                  const SizedBox(height: 10),
                  _buildSingleField('FINAL CONDITION ON DISCHARGE'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 3, // Settings tab selected
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        onTap: (index) {
          if (index != 3) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }

  Widget _buildInfoPair(String leftLabel, String rightLabel) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(child: _buildInfoField(leftLabel)),
          const SizedBox(width: 8),
          Expanded(child: _buildInfoField(rightLabel)),
        ],
      ),
    );
  }

  Widget _buildInfoField(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSingleField(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
} 