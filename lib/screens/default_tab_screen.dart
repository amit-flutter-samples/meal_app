// import 'package:flutter/material.dart';
// import './category_screen.dart';
// import './favorites_screen.dart';

// class DefaultTabScreen extends StatefulWidget {
//   @override
//   _DefaultTabScreenState createState() => _DefaultTabScreenState();
// }

// class _DefaultTabScreenState extends State<DefaultTabScreen> {
//     @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(
//             tabs: <Widget>[
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Category',
//               ),
//               Tab(
//                 icon: Icon(Icons.favorite),
//                 text: 'Favorite',
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(children: <Widget>[
//           CategoriesScreen(),
//           FavoritesScreen()
//         ],),
//       ),
//     );
//   }
// }