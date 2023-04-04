class IntroductionModel {
  String? imageUrl;
  String? title;
  String? blurUrl;
  String? localimg;

  IntroductionModel({this.imageUrl, this.title, this.blurUrl, this.localimg});
}

List<IntroductionModel> introductionList = [
  IntroductionModel(
      title:
          'Plan your trips safely by browsing places through a safety parameter.',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fintro_image_a.jpg?alt=media&token=faed40a9-771f-423c-bdbc-b57b87bfe26d',
      blurUrl: 'LkH_JYt4W=Nd~poej@oKEkj[f5s-',
      localimg: 'assets/images/fullApps/worldTour/image/intro_image_a.jpg'),
  IntroductionModel(
      title:
          'Connect with a community of registered travellers  and know their experiences.',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fintro_image_b.jpg?alt=media&token=8c653bd9-da72-4ad6-8c68-03ff7965d3d9',
      blurUrl: 'L9BpR]~DjW-:AzN{RlSP049}WBNH',
      localimg: 'assets/images/fullApps/worldTour/image/intro_image_b.jpg'),
  IntroductionModel(
      title: 'Have a safety at\nWorldTour',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/travelapp%2Fintro_image_c.jpg?alt=media&token=cdfcc6d0-e8ed-4d2c-a759-ee88de7b54b7',
      blurUrl: 'L671A#EK0#}TtSsSNbNa0K-V^O12',
      localimg: 'assets/images/fullApps/worldTour/image/intro_image_c.jpg'),
];
