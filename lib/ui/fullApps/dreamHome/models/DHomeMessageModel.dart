class DHomeMessageModel{
  late final String imageUrl;
  late final String blurUrl;
  late final String localImage;
  late final String title;
  late final String subTitle;
  late final String time;
  late final bool hasMessage;
  DHomeMessageModel({
    required this.title,
    required this.imageUrl,
    required this.hasMessage,
    required this.subTitle,
    required this.time,
    required this.localImage,
    required this.blurUrl,
});
}