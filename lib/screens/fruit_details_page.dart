// import 'package:flutter/material.dart';

// class BananaDetailsCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(16),
//       child: Card(
//         elevation: 8,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(25),
//         ),
//         child: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             color: Color(0xFFFCE4EC),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 width: 250,
//                 height: 200,
//                 padding: EdgeInsets.symmetric(vertical: 20),
//                 child: Image.network(
//                   'https://purepng.com/public/uploads/large/purepng.com-bananafruitsyellowfruit-981524754330lspp8.png',
//                   fit: BoxFit.contain,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       color: Colors.pink[50],
//                       child: Icon(Icons.image, color: Colors.pink[300], size: 60),
//                     );
//                   },
//                 ),
//               ),
//               Text(
//                 'Bananas',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.pink,
//                 ),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'High in Potassium & Fiber',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               SizedBox(height: 12),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 8),
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 decoration: BoxDecoration(
//                   color: Colors.pink,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(
//                   '1 per day',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(
//                     3,
//                     (index) => Container(
//                       margin: EdgeInsets.symmetric(horizontal: 4),
//                       width: 8,
//                       height: 8,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                         border: Border.all(
//                           color: Colors.pink[100]!,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 8),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BenefitRow extends StatelessWidget {
//   final String title;
//   final String description;

//   const BenefitRow(this.title, this.description);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         children: [
//           Icon(Icons.check_circle, color: Colors.pink[300], size: 20),
//           SizedBox(width: 8),
//           Expanded(
//             child: RichText(
//               text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: '$title: ',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.pink[700],
//                     ),
//                   ),
//                   TextSpan(
//                     text: description,
//                     style: TextStyle(color: Colors.grey[700]),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

