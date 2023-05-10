// import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
// import 'package:printez/homescreen.dart';
// import 'package:printez/viewprofilepage.dart';
//
// class HomeScreenBase extends StatelessWidget {
//   HomeScreenBase(){};
//
//   PersistentTabController _tabController = PersistentTabController(initialIndex: 0);
//
//   @override
//   Widget build(BuildContext context) {
//     var screenHeight = MediaQuery.of(context).size.height;
//     return PersistentTabView(
//       context,
//       navBarHeight: screenHeight * 0.08,
//       controller: _tabController,
//       items: [
//         PersistentBottomNavBarItem(
//           icon: Icon(Icons.history,
//               color: Colors.grey, size: screenHeight * 0.04),
//           title: ("History"),
//         ),
//         PersistentBottomNavBarItem(
//           icon: Icon(Icons.home,
//               color: Colors.grey, size: screenHeight * 0.04),
//           title: ("Home"),),
//         PersistentBottomNavBarItem(
//           icon: Icon(Icons.person,  color: Colors.grey, size: screenHeight * 0.04),
//           title: ("Profile"),
//         ),
//       ],
//       screens: [
//         ViewProfilePage(),
//         HomeScreenView(),
//         ViewProfilePage(),
//       ],
//     );
//   }
// }