// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class BottomNavigatorScreen extends StatefulWidget {
//   const BottomNavigatorScreen({super.key, this.currentIndex = 0});

//   final int currentIndex;

//   @override
//   State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
// }

// class _BottomNavigatorState extends State<BottomNavigatorScreen> {
//   late int index = widget.currentIndex;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[index],
//       extendBody: true,
//       bottomNavigationBar: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           border: Border(
//             top: BorderSide(
//               width: 1,
//               color: AppColorsBlueScopeNews.colorD9E6F0,
//             ),
//           ),
//         ),
//         child: BottomNavigationBar(
//           selectedItemColor: AppColorsBlueScopeNews.color2D52D6,
//           backgroundColor: Colors.white,
//           selectedLabelStyle: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 19.sp,
//           ),
//           unselectedFontSize: 0,
//           selectedFontSize: 0,
//           currentIndex: index,
//           onTap: (indexFrom) async {
//             setState(() {
//               index = indexFrom;
//             });
//           },
//           items: [
//             BottomNavigationBarItem(
//               label: index == 0 ? '•' : '',
//               icon: Image.asset(
//                 AppImages.homeIcon,
//                 width: 25.h,
//                 color: AppColorsBlueScopeNews.color64717B,
//               ),
//               activeIcon: Image.asset(
//                 AppImages.homeActivIcon,
//                 color: AppColorsBlueScopeNews.color2D52D6,
//                 width: 25.h,
//               ),
//             ),
//             BottomNavigationBarItem(
//               label: index == 1 ? '•' : '',
//               icon: Image.asset(
//                 AppImages.heartIcon,
//                 width: 25.h,
//                 color: AppColorsBlueScopeNews.color64717B,
//               ),
//               activeIcon: Image.asset(
//                 AppImages.heartActivIcon,
//                 color: AppColorsBlueScopeNews.color2D52D6,
//                 width: 25.h,
//               ),
//             ),
//             BottomNavigationBarItem(
//               label: index == 2 ? '•' : '',
//               icon: Image.asset(
//                 AppImages.editIcon,
//                 width: 25.h,
//                 color: AppColorsBlueScopeNews.color64717B,
//               ),
//               activeIcon: Image.asset(
//                 AppImages.editActivIcon,
//                 color: AppColorsBlueScopeNews.color2D52D6,
//                 width: 25.h,
//               ),
//             ),
//             BottomNavigationBarItem(
//               label: index == 3 ? '•' : '',
//               icon: Image.asset(
//                 AppImages.archiveIcon,
//                 width: 25.h,
//                 color: AppColorsBlueScopeNews.color64717B,
//               ),
//               activeIcon: Image.asset(
//                 AppImages.archiveActivIcon,
//                 color: AppColorsBlueScopeNews.color2D52D6,
//                 width: 25.h,
//               ),
//             ),
//             BottomNavigationBarItem(
//               label: index == 4 ? '•' : '',
//               icon: Image.asset(
//                 AppImages.settingsIcon,
//                 width: 25.h,
//                 color: AppColorsBlueScopeNews.color64717B,
//               ),
//               activeIcon: Image.asset(
//                 AppImages.settingsActivIcon,
//                 color: AppColorsBlueScopeNews.color2D52D6,
//                 width: 25.h,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// List<Widget> pages = [
//   const HomePage(),
//   const SavedPage(),
//   const NewPostPage(),
//   const YourPostsPage(),
//   const SettingsPage(),
// ];
