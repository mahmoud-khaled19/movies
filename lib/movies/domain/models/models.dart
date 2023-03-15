// onBoarding Model
class PageObject {
  final String title;
  final String subTitle;
  final String image;

  PageObject(this.title, this.subTitle, this.image);
}
class PageViewObject{
  PageObject pageObject;
  int numOfPages;
  int currentIndex;

  PageViewObject(this.pageObject, this.numOfPages, this.currentIndex);
}