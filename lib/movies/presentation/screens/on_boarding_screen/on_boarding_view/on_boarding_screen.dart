import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../domain/models/models.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../on_boarding_view_model/on_boarding_view_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OnBoardingViewModel viewModel = OnBoardingViewModel();

  void start() {
    viewModel.start();
  }

  @override
  void initState() {
    start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: viewModel.pageViewObjectOutputs,
        builder: (context, snapshot) {
          return getWidgetContent(snapshot.data);
        });
  }

  Widget getWidgetContent(PageViewObject? pageViewObject) {
    if (pageViewObject != null) {
      return SafeArea(
        child: Scaffold(
            backgroundColor: ColorManager.white,
            appBar: AppBar(
              backgroundColor: ColorManager.white,
              elevation: 0,
            ),
            body: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: pageViewObject.numOfPages,
              controller: viewModel.pageController,
              onPageChanged: (index) {
                if (index == pageViewObject.numOfPages - 1) {
                  Navigator.pushReplacementNamed(
                      context, RoutesManager.loginRoute);
                }
                viewModel.onPageChanged(index);
              },
              itemBuilder: (BuildContext context, int index) {
                return OnBoardingPage(
                    pageViewObject: pageViewObject.pageObject);
              },
            ),
            bottomSheet: getBottomSheetWidget()),
      );
    } else {
      return Container();
    }
  }

  getBottomSheetWidget() {
    return Container(
      height: AppSize.s100,
      color: ColorManager.white,
      child: Column(
        children: [
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RoutesManager.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              )),
          Expanded(
            child: Container(
              color: ColorManager.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        viewModel.goPreviousPage();
                      },
                      icon: SvgPicture.asset(ImagesManager.leftArrow)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSize.s14),
                    child: SmoothPageIndicator(
                        controller: viewModel.pageController,
                        count: 4,
                        effect: JumpingDotEffect(
                            activeDotColor: ColorManager.darkGrey,
                            dotHeight: AppSize.s10,
                            dotWidth: AppSize.s10,
                            dotColor: ColorManager.white,
                            verticalOffset: 15),
                        // your preferred effect
                        onDotClicked: (index) {}),
                  ),
                  IconButton(
                      onPressed: () {
                        viewModel.goNextPage();
                      },
                      icon: SvgPicture.asset(ImagesManager.rightArrow)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key, required this.pageViewObject})
      : super(key: key);
  final PageObject pageViewObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Text(
          pageViewObject.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: AppSize.s14,
        ),
        Text(
          pageViewObject.subTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: AppSize.s4,
        ),
        Text(
          pageViewObject.subTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(pageViewObject.image)
      ],
    );
  }
}
