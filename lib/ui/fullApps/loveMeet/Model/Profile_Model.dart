// ignore_for_file: camel_case_types

import 'package:smartkit_pro/ui/fullApps/loveMeet/Model/Interested_Model.dart';

class Profile_Model {
  String? id;
  String? name;
  String? occupation;
  String? about;
  String? location;
  String? profile;
  String? imgurl;
  String? hash;
  List<Interested_Model>? interestedList;

  Profile_Model({
    this.id,
    this.name,
    this.occupation,
    this.about,
    this.location,
    this.profile,
    this.imgurl,
    this.hash,
    this.interestedList,
  });
}

List<Profile_Model> profileList = [
  Profile_Model(
    id: "1",
    name: "Alex Morris",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/images/fullApps/loveMeet/profile_a.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_a.jpg?alt=media&token=4b19da9a-7f2e-4804-a4f7-544609920153",
    hash: "LFJRgfo#_ND%00Ip0Ks:4TMyR5x^",
    interestedList: [
      Interested_Model(
        id: "1",
        name: "Foods",
      ),
      Interested_Model(
        id: "2",
        name: "Travelling",
      ),
      Interested_Model(
        id: "3",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "2",
    name: "Blacksmith as",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/images/fullApps/loveMeet/profile_b.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_b.jpg?alt=media&token=7fac07a8-6540-4f27-b902-3d4efaff2d08",
    hash: "L9J@@0Kk4T\$l00009~=v~K?G9d?u",
    interestedList: [
      Interested_Model(
        id: "4",
        name: "Foods",
      ),
      Interested_Model(
        id: "5",
        name: "Travelling",
      ),
      Interested_Model(
        id: "6",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "3",
    name: "Christina Pearson",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/images/fullApps/loveMeet/profile_c.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_c.jpg?alt=media&token=4a068906-6b98-4681-b38f-a6fa4c638099",
    hash: "LNEWakI9OEM{GdV?b_t7TLtRxuW=",
    interestedList: [
      Interested_Model(
        id: "7",
        name: "Foods",
      ),
      Interested_Model(
        id: "8",
        name: "Travelling",
      ),
      Interested_Model(
        id: "9",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "4",
    name: "Carmen Myers",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/images/fullApps/loveMeet/profile_d.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_d.jpg?alt=media&token=a7ec8770-fe49-4587-83d1-2241efe6cf1f",
    hash: "LMO:a,~UIVIB-=9Gx[WB4oM{IV%L",
    interestedList: [
      Interested_Model(
        id: "10",
        name: "Foods",
      ),
      Interested_Model(
        id: "11",
        name: "Travelling",
      ),
      Interested_Model(
        id: "12",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "5",
    name: "Enrique Perkins",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/images/fullApps/loveMeet/profile_e.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_e.jpg?alt=media&token=65411b2b-a06c-4e50-8e3c-ad6eb7fe2f6c",
    hash: "LFI#JftQ00-.~VWBxb%g%LbHxatR",
    interestedList: [
      Interested_Model(
        id: "13",
        name: "Foods",
      ),
      Interested_Model(
        id: "14",
        name: "Travelling",
      ),
      Interested_Model(
        id: "15",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "6",
    name: "Glen Ryan",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/images/fullApps/loveMeet/profile_f.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_f.jpg?alt=media&token=36ecf13a-53d9-4fd8-9134-e8fd29037a8c",
    hash: "LKIh5BIB0KH=~WDO=~W=FeIUxun#",
    interestedList: [
      Interested_Model(
        id: "16",
        name: "Foods",
      ),
      Interested_Model(
        id: "17",
        name: "Travelling",
      ),
      Interested_Model(
        id: "18",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "7",
    name: "Judy Kuhn",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/images/fullApps/loveMeet/profile_g.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_g.jpg?alt=media&token=7e8e5ff0-272b-4896-b562-15bcabf99cd9",
    hash: "L47KC:t79us.}qNaI;\$%oL-ANGR+",
    interestedList: [
      Interested_Model(
        id: "19",
        name: "Foods",
      ),
      Interested_Model(
        id: "20",
        name: "Travelling",
      ),
      Interested_Model(
        id: "21",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "8",
    name: "Amber Ross",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/images/fullApps/loveMeet/profile_h.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_h.jpg?alt=media&token=24f3201d-edd8-46ca-bd72-4a348bde4008",
    hash: "L6BL|x}Y0#t50f%2D%0LEgEM-V-p",
    interestedList: [
      Interested_Model(
        id: "22",
        name: "Foods",
      ),
      Interested_Model(
        id: "23",
        name: "Travelling",
      ),
      Interested_Model(
        id: "24",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "9",
    name: "Samuel Parker",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/images/fullApps/loveMeet/profile_i.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fimage_i.jpg?alt=media&token=0e2dbdca-082b-45be-91b5-ddcd3d350e7c",
    hash: "L88g]DIA_ME1.7V?ENoIxpxuaeRQ",
    interestedList: [
      Interested_Model(
        id: "25",
        name: "Foods",
      ),
      Interested_Model(
        id: "26",
        name: "Travelling",
      ),
      Interested_Model(
        id: "27",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "10",
    name: "Byron Kuhn",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/images/fullApps/loveMeet/profile_j.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_j.jpg?alt=media&token=544886db-b223-4410-8be4-a42d861f7665",
    hash: "L8HKOv_M00Dj9vXl\$+rD0MI[=}Zh",
    interestedList: [
      Interested_Model(
        id: "28",
        name: "Foods",
      ),
      Interested_Model(
        id: "29",
        name: "Travelling",
      ),
      Interested_Model(
        id: "30",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "11",
    name: "Jasmine Fisher",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Milton Keynes, United Kingdom",
    profile: "assets/images/fullApps/loveMeet/profile_k.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_k.jpg?alt=media&token=bc79f61d-f2b6-4b53-8a66-e37ad9c50b49",
    hash: "LOFzKM}DIU%2AsAYJ8WDVsxGt7M|",
    interestedList: [
      Interested_Model(
        id: "31",
        name: "Foods",
      ),
      Interested_Model(
        id: "32",
        name: "Travelling",
      ),
      Interested_Model(
        id: "33",
        name: "Designing",
      ),
    ],
  ),
  Profile_Model(
    id: "12",
    name: "Diane Wilson",
    occupation: "UX/UI Designer",
    about:
        "i'm Alex, a designer with a background in traditional graphic design user interface and experience design based in Milton Keynes.",
    location: "Toronto City, Ontario CA",
    profile: "assets/images/fullApps/loveMeet/profile_l.jpg",
    imgurl:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/datingapp%2Fprofile_l.jpg?alt=media&token=0c192144-0f52-4ab1-8961-5d83678c924d",
    hash: "LBB:4[%LD%xa~p%M9ZWX.8t7RPbI",
    interestedList: [
      Interested_Model(
        id: "34",
        name: "Foods",
      ),
      Interested_Model(
        id: "35",
        name: "Travelling",
      ),
      Interested_Model(
        id: "36",
        name: "Designing",
      ),
    ],
  ),
];
