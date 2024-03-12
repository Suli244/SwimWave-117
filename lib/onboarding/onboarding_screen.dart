// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:swim_wave_117/core/sw_colors.dart';
// import 'package:swim_wave_117/onboarding/custom_button.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});
//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController controller = PageController();
//   int currantPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//               'assets/images/brImage.png',
//             ),
//             fit: BoxFit.fill,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Image.asset(
//                 'assets/images/onbarOne.png',
//                 height: 452.h,
//                 width: 373.w,
//                 fit: BoxFit.fill,
//               ),
//               SizedBox(height: 24.h),
//               Text(
//                 'Techniques and tips',
//                 style: TextStyle(
//                   color: SwColors.whate,
//                   fontSize: 24.h,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//               SizedBox(height: 8.h),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 child: Column(
//                   children: [
//                     Text(
//                       'Discover the best techniques and useful tips to improve your skills. Improve your techniques with our experts and reach new heights.',
//                       style: TextStyle(
//                         color: SwColors.whate,
//                         fontSize: 16.h,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 24.h),
//                     CustomButton(
//                       color: SwColors.whate,
//                       onPress: () {},
//                       text: 'NEXT',
//                       radius: 20.r,
//                       textStyle: TextStyle(
//                         color: SwColors.blue,
//                         fontSize: 16.h,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               // Expanded(
//               //   child: PageView(
//               //     physics: const ClampingScrollPhysics(),
//               //     controller: controller,
//               //     onPageChanged: (value) {
//               //       setState(() {
//               //         currantPage = value;
//               //       });
//               //     },
//               //     children: const [

//               //     ],
//               //   ),
//               // ),
//               // SmoothPageIndicator(
//               //   controller: controller,
//               //   count: 3,
//               //   effect: ScrollingDotsEffect(
//               //     activeDotColor: SwColors.whate,
//               //     dotColor: SwColors.blue2,
//               //     dotHeight: 8.h,
//               //     dotWidth: 8.h,
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
