class IntroductionModel {
  String? imageUrl;
  String? title;
  String? subTitle;
  String? blurUrl;
  String? localimg;

  IntroductionModel(
      {this.imageUrl, this.title, this.subTitle, this.blurUrl, this.localimg});
}

List<IntroductionModel> introductionList = [
  IntroductionModel(
      title: 'Office\nFurniture',
      subTitle:
          'Chair with minimal style and modern Wooden and plastic material',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furnitureapp%2Fimage_a.jpg?alt=media&token=eaef320e-e2b6-4076-83f7-da607cd162bc',
      blurUrl: 'LGMZ:hogIpsk?wRjM_bcD\$xaaeoz',
      localimg: 'assets/images/fullApps/furnitureHub/image_a.jpg'),
  IntroductionModel(
      title: 'Relaxing\nFurniture',
      subTitle:
          'Roof light and lamps we have wide range In all colors and lamps also available',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furnitureapp%2Fimage_b.jpg?alt=media&token=fedad975-9406-4d6d-b4ff-6f2e34b3bf63',
      blurUrl: 'LEF5?S4nE1s,~qIUWBRk01xtxuW=',
      localimg: 'assets/images/fullApps/furnitureHub/image_b.jpg'),
  IntroductionModel(
      title: 'Home\nFurniture',
      subTitle:
          'Stylish round shape couch is comfortable Also available in multiple colors',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/furnitureapp%2Fimage_c.jpg?alt=media&token=0354f2b2-ddfa-430f-bf39-2c8adf3f95d7',
      blurUrl: 'LYNv[99FWYj??w%Mn\$bHRikDofWA',
      localimg: 'assets/images/fullApps/furnitureHub/image_c.jpg'),
];
