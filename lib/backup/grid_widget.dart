// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class GridScreen extends StatefulWidget {
//   const GridScreen({Key? key}) : super(key: key);

//   @override
//   _GridScreenState createState() => _GridScreenState();
// }

// class _GridScreenState extends State<GridScreen> {
//   @override
//   Widget build(BuildContext context) {
//     //var size = MediaQuery.of(context).size;

//     return Scaffold(
//         body: Container(
//       padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
//       margin: const EdgeInsets.fromLTRB(189, 0, 189, 0),
//       child: GridView(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 6,
//           mainAxisSpacing: 10,
//           crossAxisSpacing: 5,
//           childAspectRatio: 189 / 325,
//         ),
//         children: [
//           cardItem('./lib/assets/images/cat_refrigerator.jpg', 'Refrigerators'),
//           cardItem('./lib/assets/images/cat_air_fryer.jpg', 'Air Fryer'),
//           cardItem(
//               './lib/assets/images/cat_beverage_cooler.jpg', 'Beverage Cooler'),
//           cardItem('./lib/assets/images/cat_blender.jpg', 'Blender'),
//           cardItem('./lib/assets/images/cat_coffee_maker.jpg', 'Coffee Maker'),
//           cardItem('./lib/assets/images/cat_cooktop.jpg', 'Cooktop'),
//           cardItem('./lib/assets/images/cat_deep_fryer.jpg', 'Deep Fryer'),
//           cardItem('./lib/assets/images/cat_dishwasher.jpg', 'Dishwasher'),
//           cardItem(
//               './lib/assets/images/cat_electric_grill.jpg', 'Electric Grill'),
//           cardItem('./lib/assets/images/cat_juicer.jpg', 'Juicer'),
//           cardItem('./lib/assets/images/cat_microwave.jpg', 'Microwave'),
//           cardItem('./lib/assets/images/cat_range.jpg', 'Range'),
//         ],
//       ),
//     ));
//   }

//   Card cardItem(String newImage, String newText) {
//     return Card(
//       shadowColor: Colors.black,
//       elevation: 8,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Image.asset(
//               newImage,
//               height: 220,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               newText,
//               textAlign: TextAlign.center,
//               style: GoogleFonts.roboto(
//                 color: Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(
//               height: 14,
//             ),
//             TextButton(
//               child: const Text(
//                 'Learn More',
//                 style: TextStyle(
//                   color: Colors.blue,
//                 ),
//               ),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
