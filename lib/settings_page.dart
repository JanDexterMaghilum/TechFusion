// import 'package:flutter/material.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   void _showChangePasswordDialog(BuildContext context) {
//     final TextEditingController currentPasswordController = TextEditingController();
//     final TextEditingController newPasswordController = TextEditingController();
//     final TextEditingController confirmPasswordController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Change Password'),
//           content: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: currentPasswordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Current Password',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   controller: newPasswordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'New Password',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 TextField(
//                   controller: confirmPasswordController,
//                   obscureText: true,
//                   decoration: const InputDecoration(
//                     labelText: 'Confirm New Password',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.pink,
//               ),
//               onPressed: () {
//                 // TODO: Implement password change logic
//                 if (newPasswordController.text == confirmPasswordController.text) {
//                   // Implement your password change logic here
//                   Navigator.of(context).pop();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('Password changed successfully'),
//                       backgroundColor: Colors.green,
//                     ),
//                   );
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       content: Text('New passwords do not match'),
//                       backgroundColor: Colors.red,
//                     ),
//                   );
//                 }
//               },
//               child: const Text(
//                 'Change Password',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         backgroundColor: Colors.pink,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             leading: const Icon(Icons.person, color: Colors.pink),
//             title: const Text(
//               'UPDATE ACCOUNTS INFORMATION',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//             trailing: const Icon(Icons.arrow_forward_ios),
//             onTap: () {
//               // TODO: Implement account update
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.lock, color: Colors.pink),
//             title: const Text(
//               'CHANGE PASSWORD',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//             trailing: const Icon(Icons.arrow_forward_ios),
//             onTap: () => _showChangePasswordDialog(context),
//           ),
//           ListTile(
//             leading: const Icon(Icons.logout, color: Colors.pink),
//             title: const Text(
//               'LOGOUT',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.normal,
//               ),
//             ),
//             trailing: const Icon(Icons.arrow_forward_ios),
//             onTap: () {
//               // TODO: Implement logout
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
