import 'package:birthtrack/admindashboard_page/add_patient_record.dart';
import 'package:birthtrack/admindashboard_page/admindashboard.dart';
import 'package:flutter/material.dart';

class PatientRecordsPage extends StatefulWidget {
  const PatientRecordsPage({super.key});

  @override
  State<PatientRecordsPage> createState() => _PatientRecordsPageState();
}

class _PatientRecordsPageState extends State<PatientRecordsPage> {
  final _searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _selectedIndex = 1; // Set to 1 for Patient Records

  // Reuse the same sidebar items from AdminDashboard
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
  final _birthDateController = TextEditingController();
  final _placeOfBirthController = TextEditingController();
  final _addressController = TextEditingController();
  final _pregnancyCountController = TextEditingController();
  final _doctorsNameController = TextEditingController();
  final _admittingStaffController = TextEditingController();
  final _dateAdmittedController = TextEditingController();
  final _philhealthController = TextEditingController();
  final _religionController = TextEditingController();
  final _civilStatusController = TextEditingController();
  final _occupationController = TextEditingController();
  final _dischargeDateController = TextEditingController();
  final _staffOnDutyController = TextEditingController();
  final _finalConditionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Modern Sidebar Navigation
          Container(
            width: 250,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Admin Panel Header
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.admin_panel_settings,
                          color: Colors.pink.shade400,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Admin Panel',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                
                // Navigation Items
                Expanded(
                  child: ListView.builder(
                    itemCount: _sidebarItems.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    itemBuilder: (context, index) {
                      final item = _sidebarItems[index];
                      final isSelected = _selectedIndex == index;
                      
                      return Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isSelected ? Colors.pink.shade50 : Colors.transparent,
                        ),
                        child: ListTile(
                          dense: true,
                          visualDensity: const VisualDensity(vertical: -1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          leading: Icon(
                            item['icon'],
                            size: 20,
                            color: isSelected ? Colors.pink : Colors.grey.shade600,
                          ),
                          title: Text(
                            item['title'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                              color: isSelected ? Colors.pink : Colors.grey.shade700,
                            ),
                          ),
                          onTap: () {
                            setState(() => _selectedIndex = index);
                            if (item['title'] == 'Dashboard') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AdminDashboard(),
                                ),
                              );
                            } else if (item['title'] == 'Add Patient') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddPatientRecord(),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),

                // Bottom Divider and Profile
                Divider(color: Colors.grey.shade200),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.grey.shade100,
                        child: Icon(
                          Icons.person_outline,
                          size: 20,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Admin User',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade800,
                              ),
                            ),
                            Text(
                              'admin@example.com',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
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

          // Updated Main Content Area with reduced spacing
          Expanded(
            child: Container(
              color: const Color(0xFFF8FAFC),
              child: Column(
                children: [
                  // Top App Bar with Actions
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    color: Colors.white,
                    child: Row(
                      children: [
                        const Text(
                          'Patient Records',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        // Action Buttons
                        ElevatedButton.icon(
                          icon: const Icon(Icons.add, size: 18),
                          label: const Text('New Patient'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  // Main Content with reduced spacing
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionHeader(
                                'Personal Information',
                                Icons.person_outline,
                              ),
                              const SizedBox(height: 8),
                              _buildCompactFormGrid([
                                _buildFormField('Full Name', _fullNameController),
                                _buildFormField('Date Admitted', _dateAdmittedController),
                                _buildFormField('Birthdate', _birthDateController),
                                _buildFormField('PhilHealth Membership', _philhealthController),
                                _buildFormField('Place of Birth', _placeOfBirthController),
                                _buildFormField('Religion', _religionController),
                              ]),

                              _buildSectionHeader(
                                'Contact Information',
                                Icons.contact_mail_outlined,
                              ),
                              _buildCompactFormGrid([
                                _buildFormField('Address', _addressController),
                                _buildFormField('Civil Status', _civilStatusController),
                                _buildFormField('Occupation', _occupationController),
                              ]),

                              _buildSectionHeader(
                                'Medical Information',
                                Icons.medical_services_outlined,
                              ),
                              _buildCompactFormGrid([
                                _buildFormField('Doctor\'s Name', _doctorsNameController),
                                _buildFormField('Admitting Staff', _admittingStaffController),
                                _buildFormField('Staff on Duty', _staffOnDutyController),
                                _buildFormField('Pregnancy Count', _pregnancyCountController),
                              ]),

                              _buildSectionHeader(
                                'Discharge Information',
                                Icons.output_outlined,
                              ),

                              _buildFormField(
                                'Date and Time of Discharge',
                                _dischargeDateController,
                              ),
                              _buildFormField(
                                'Final Condition on Discharge',
                                _finalConditionController,
                                maxLines: 3,
                              ),
                              const SizedBox(height: 20),

                              // Action Buttons with reduced spacing
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () => Navigator.pop(context),
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        side: BorderSide(color: Colors.grey.shade300),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text('Cancel'),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          // Implement save functionality
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.pink,
                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Text('Save Record'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade700),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade900,
          ),
        ),
      ],
    );
  }

  Widget _buildCompactFormGrid(List<Widget> children) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 12,
      childAspectRatio: 4.0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: children,
    );
  }

  Widget _buildFormField(String label, TextEditingController controller, {int? maxLines}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.pink),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
      ),
    );
  }
}