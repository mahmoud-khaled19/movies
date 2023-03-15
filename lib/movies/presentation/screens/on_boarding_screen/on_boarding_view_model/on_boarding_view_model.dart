import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/movies/presentation/base/base_view_model.dart';

import '../../../../domain/models/models.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/constats.dart';
import '../../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutPuts {
  final StreamController streamController = StreamController<PageViewObject>();
  late List<PageObject> list;
  var currentIndex = 0;
  var pageController = PageController();

  @override
  void dispose() {
    streamController.close();
  }

  @override
  void start() {
    list = getPageObjects();
    postDataToView();
  }

  @override
  int onPageChanged(int index) {
    currentIndex = index;
    throw UnimplementedError();
  }

  @override
  goNextPage() {
    pageController.nextPage(
        duration: const Duration(seconds: AppConstants.pageViewTimer),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  goPreviousPage() {
    pageController.previousPage(
        duration: const Duration(seconds: AppConstants.pageViewTimer),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Sink get pageViewObjectInputs => streamController.sink;

  //onBoarding Outputs
  @override
  Stream<PageViewObject> get pageViewObjectOutputs =>
      streamController.stream.map((pageViewObject) => pageViewObject);

  // onBoarding private Functions

  postDataToView() {
    pageViewObjectInputs
        .add(PageViewObject(list[currentIndex], list.length, currentIndex));
  }

  List<PageObject> getPageObjects() => [
        PageObject(
            AppStrings.onBoardingSubTitle1,
            AppStrings.onBoardingSubTitle1,
            ImagesManager.onBoardingScreen1Path),
        PageObject(
            AppStrings.onBoardingSubTitle2,
            AppStrings.onBoardingSubTitle2,
            ImagesManager.onBoardingScreen2Path),
        PageObject(
            AppStrings.onBoardingSubTitle3,
            AppStrings.onBoardingSubTitle3,
            ImagesManager.onBoardingScreen3Path),
        PageObject(
            AppStrings.onBoardingSubTitle4,
            AppStrings.onBoardingSubTitle4,
            ImagesManager.onBoardingScreen4Path),
      ];
}

abstract class OnBoardingViewModelInputs {
  goNextPage();

  goPreviousPage();

  onPageChanged(int index);

  Sink get pageViewObjectInputs;
}

abstract class OnBoardingViewModelOutPuts {
  Stream<PageViewObject> get pageViewObjectOutputs;
}
