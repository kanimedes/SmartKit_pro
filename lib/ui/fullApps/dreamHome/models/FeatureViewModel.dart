class FeatureView{
  late final String image;
  late final String blurUrl;
  late final String localImage;
  late final String title;
  late final String des;
  late final String address;
  late final String bed;
  late final String baths;
  late final String sqft;
  late final String rs;
  late final bool like;
  FeatureView({
    required this.title,
    required this.image,
    required this.address,
    required this.baths,
    required this.bed,
    required this.des,
    required this.sqft,
    required this.localImage,
    required this.blurUrl,
    required this.rs,
    required this.like
  });
}