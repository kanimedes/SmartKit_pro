// ignore_for_file: camel_case_types

class Search_Model {
  String? id;
  String? name;
  String? location;
  String? image;
  String? imageurl;
  String? hash;

  Search_Model(
      {this.id,
      this.name,
      this.location,
      this.image,
      this.imageurl,
      this.hash});
}

List<Search_Model> searchList = [
  Search_Model(
    id: "1",
    name: "Blacksmith as",
    location: "Milton Keynes, United Kingdom",
    image: "assets/images/fullApps/loveMeet/profile_i.jpg",
    imageurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fimage_i.jpg?alt=media&token=0e2dbdca-082b-45be-91b5-ddcd3d350e7c",
    hash: "L88g]DIA_ME1.7V?ENoIxpxuaeRQ",
  ),
  Search_Model(
      id: "2",
      name: "Alex Morris",
      location: "Toronto City, Ontario CA",
      image: "assets/images/fullApps/loveMeet/profile_h.jpg",
      imageurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_h.jpg?alt=media&token=24f3201d-edd8-46ca-bd72-4a348bde4008",
      hash: "L6BL|x}Y0#t50f%2D%0LEgEM-V-p"),
  Search_Model(
      id: "3",
      name: "Christina Pearson",
      location: "Milton Keynes, United Kingdom",
      image: "assets/images/fullApps/loveMeet/profile_e.jpg",
      imageurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_e.jpg?alt=media&token=65411b2b-a06c-4e50-8e3c-ad6eb7fe2f6c",
      hash: "LFI#JftQ00-.~VWBxb%g%LbHxatR"),
  Search_Model(
      id: "3",
      name: "Carmen Myers",
      location: "Toronto City, Ontario CA",
      image: "assets/images/fullApps/loveMeet/profile_l.jpg",
      imageurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_l.jpg?alt=media&token=0c192144-0f52-4ab1-8961-5d83678c924d",
      hash: "LBB:4[%LD%xa~p%M9ZWX.8t7RPbI"),
];
