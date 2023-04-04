class SliderImage {
  String? id, image,blurUrl,localimg;
  SliderImage( {
    this.id,
    this.image,
    this.blurUrl,
    this.localimg,
  });

  factory SliderImage.fromJson(Map<String,dynamic> json) {
    return SliderImage(
      id: json["id"].toString(),
      image: json["image"],
      blurUrl: json["blurUrl"],
      localimg: json["localimg"],
    );
  }
}