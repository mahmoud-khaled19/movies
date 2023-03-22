// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// import '../../../../app/resources/assets_manager.dart';
// import '../../../../app/resources/colors_manager.dart';
// import '../../../../app/resources/constats.dart';
// import '../../../../app/resources/routes_manager.dart';
// import '../../../../app/resources/strings_manager.dart';
// import '../../../../app/resources/values_manager.dart';
// import '../../../../tv/domain/models/models.dart';
//
// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   List<PageObject> getPageObjects() => [
//         PageObject(
//             AppStrings.onBoardingSubTitle1,
//             AppStrings.onBoardingSubTitle1,
//             ImagesManager.onBoardingScreen1Path),
//         PageObject(
//             AppStrings.onBoardingSubTitle2,
//             AppStrings.onBoardingSubTitle2,
//             ImagesManager.onBoardingScreen2Path),
//         PageObject(
//             AppStrings.onBoardingSubTitle3,
//             AppStrings.onBoardingSubTitle3,
//             ImagesManager.onBoardingScreen3Path),
//         PageObject(
//             AppStrings.onBoardingSubTitle4,
//             AppStrings.onBoardingSubTitle4,
//             ImagesManager.onBoardingScreen4Path),
//       ];
//
//   late List<PageObject> list = getPageObjects();
//   var currentIndex = 0;
//   var pageController = PageController();
//
//   @override
//   Widget build(BuildContext context) {
//     return getWidgetContent();
//   }
//
//   Widget getWidgetContent() {
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: ColorManager.white,
//           appBar: AppBar(
//             backgroundColor: ColorManager.white,
//             elevation: 0,
//           ),
//           body: PageView.builder(
//             physics: const BouncingScrollPhysics(),
//             itemCount: list.length,
//             controller: pageController,
//             onPageChanged: (index) {
//               if (index == list.length - 1) {
//                 Navigator.pushReplacementNamed(
//                     context, RoutesManager.mainMovieScreen);
//               }
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//             itemBuilder: (BuildContext context, int index) {
//               return OnBoardingPage(pageViewObject: list[currentIndex]);
//             },
//           ),
//           bottomSheet: getBottomSheetWidget()),
//     );
//   }
//
//   getBottomSheetWidget() {
//     return Container(
//       height: AppSize.s100,
//       color: ColorManager.white,
//       child: Column(
//         children: [
//           Align(
//               alignment: AlignmentDirectional.centerEnd,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.pushReplacementNamed(
//                       context, RoutesManager.mainMovieScreen);
//                 },
//                 child: Text(
//                   AppStrings.skip,
//                   style: Theme.of(context).textTheme.headlineMedium,
//                 ),
//               )),
//           Expanded(
//             child: Container(
//               color: ColorManager.primaryColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                       onPressed: () {
//                         pageController.previousPage(
//                             duration: const Duration(
//                                 seconds: AppConstants.pageViewTimer),
//                             curve: Curves.fastLinearToSlowEaseIn);
//                       },
//                       icon: SvgPicture.asset(ImagesManager.leftArrow)),
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: AppSize.s14),
//                     child: SmoothPageIndicator(
//                         controller: pageController,
//                         count: 4,
//                         effect: JumpingDotEffect(
//                             activeDotColor: ColorManager.darkGrey,
//                             dotHeight: AppSize.s10,
//                             dotWidth: AppSize.s10,
//                             dotColor: ColorManager.white,
//                             verticalOffset: 15),
//                         // your preferred effect
//                         onDotClicked: (index) {}),
//                   ),
//                   IconButton(
//                       onPressed: () {
//                         pageController.nextPage(
//                             duration: const Duration(
//                                 seconds: AppConstants.pageViewTimer),
//                             curve: Curves.fastLinearToSlowEaseIn);
//                       },
//                       icon: SvgPicture.asset(ImagesManager.rightArrow)),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
//
// class OnBoardingPage extends StatelessWidget {
//   const OnBoardingPage({Key? key, required this.pageViewObject})
//       : super(key: key);
//   final PageObject pageViewObject;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         const SizedBox(
//           height: AppSize.s40,
//         ),
//         Text(
//           pageViewObject.title,
//           style: Theme.of(context).textTheme.headlineLarge,
//         ),
//         const SizedBox(
//           height: AppSize.s14,
//         ),
//         Text(
//           pageViewObject.subTitle,
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//         const SizedBox(
//           height: AppSize.s4,
//         ),
//         Text(
//           pageViewObject.subTitle,
//           style: Theme.of(context).textTheme.titleMedium,
//         ),
//         const SizedBox(
//           height: AppSize.s60,
//         ),
//         SvgPicture.asset(pageViewObject.image)
//       ],
//     );
//   }
// }
