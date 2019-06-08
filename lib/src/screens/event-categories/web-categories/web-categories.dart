// import 'package:flutter_web/material.dart';

// import '../EventCategories.dart';

// class WebCategories extends StatelessWidget {
//   List<EventCategoriesModel> eventCategories = [
//     EventCategoriesModel('Summer Camp', 'no'),
//     EventCategoriesModel('Fuzion', 'no'),
//     EventCategoriesModel('Yuva Camp', 'no'),
//     EventCategoriesModel('Yuva Pro', 'no'),
//     EventCategoriesModel('Workshops', 'no'),
//     EventCategoriesModel('Picnics', 'no'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       child: Container(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: List.generate(
//                     eventCategories.length,
//                     (index) {
//                       return webCard(index, constraints);
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   webCard(index, constraints) {
//     return Container(
//       height: 200,
//       width: constraints / 2,
//       padding: EdgeInsets.only(top: 30, right: 15, left: 15),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50.0),
//         ),
//         elevation: 3.0,
//         child: Center(
//           child: Text(
//             eventCategories[index].eventName,
//             style: TextStyle(fontSize: 30),
//           ),
//         ),
//       ),
//     );
//   }
// }
