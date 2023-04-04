class Downloads_Model {
  String? id;
  String? like;
  String? name;
  String? time;
  String? storage;
  String? image;
  String? imgurl;
  String? description;
  String? hash;

  Downloads_Model({
    this.id,
    this.like,
    this.name,
    this.time,
    this.storage,
    this.imgurl,
    this.hash,
    this.image,
    this.description,
  });
}

List<Downloads_Model> downloadsList = [
  Downloads_Model(
    id: "1",
    name: "Ganpat",
    like: "0",
    time: "2hr 24min",
    storage: "• 1GB",
    image: "assets/images/fullApps/playMedia/slider_9.jpg",
    hash: "LfKvZ:Men5S6~TnNRnayELoyX9n#",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_9.jpg?alt=media&token=4232549f-ed35-424f-997e-5d8bdd7d4ecd",
  ),
  Downloads_Model(
    id: "2",
    name: "Tadap",
    like: "0",
    time: "2hr 24min",
    storage: "• 1GB",
    image: "assets/images/fullApps/playMedia/slider_20.jpg",
    hash: "LT6+|wo}MxWYyZo#R*a#j]f,aejY",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_20.jpg?alt=media&token=ff519df3-f65f-4473-b01a-e929a29548f6",
  ),
];
