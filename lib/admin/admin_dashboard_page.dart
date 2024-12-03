// import 'package:flutter/material.dart';
// import 'package:birthtrack/admin/reports_list_page.dart';

// class AdminDashboardPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Admin Dashboard'),
//         backgroundColor: Colors.pink,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             _buildStatCards(),
//             SizedBox(height: 24),
//             _buildMenuGrid(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStatCards() {
//     return Row(
//       children: [
//         Expanded(
//           child: _buildStatCard(
//             'Total Reports',
//             '24',
//             Icons.report_problem,
//             Colors.orange,
//           ),
//         ),
//         SizedBox(width: 16),
//         Expanded(
//           child: _buildStatCard(
//             'Pending',
//             '12',
//             Icons.pending_actions,
//             Colors.red,
//           ),
//         ),
//         SizedBox(width: 16),
//         Expanded(
//           child: _buildStatCard(
//             'Resolved',
//             '12',
//             Icons.check_circle,
//             Colors.green,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildStatCard(String title, String value, IconData icon, Color color) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 6,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: color, size: 32),
//           SizedBox(height: 8),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: color,
//             ),
//           ),
//           SizedBox(height: 4),
//           Text(
//             title,
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: 14,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMenuGrid(BuildContext context) {
//     return GridView.count(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       crossAxisCount: 2,
//       mainAxisSpacing: 16,
//       crossAxisSpacing: 16,
//       children: [
//         _buildMenuCard(
//           context,
//           'Manage Reports',
//           Icons.report,
//           Colors.pink,
//           () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ReportsListPage()),
//           ),
//         ),
//         _buildMenuCard(
//           context,
//           'User Management',
//           Icons.people,
//           Colors.blue,
//           () {}, // TODO: Implement user management
//         ),
//         _buildMenuCard(
//           context,
//           'Settings',
//           Icons.settings,
//           Colors.purple,
//           () {}, // TODO: Implement settings
//         ),
//         _buildMenuCard(
//           context,
//           'Analytics',
//           Icons.analytics,
//           Colors.orange,
//           () {}, // TODO: Implement analytics
//         ),
//       ],
//     );
//   }

//   Widget _buildMenuCard(BuildContext context, String title, IconData icon,
//       Color color, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.1),
//               spreadRadius: 1,
//               blurRadius: 6,
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: color, size: 48),
//             SizedBox(height: 12),
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey[800],
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// } 