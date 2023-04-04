import 'package:smartkit_pro/ui/fullApps/hotelBooking/helper/constants.dart';


class Rating {
  String name, image, dateAndTime, message, rating;

  Rating(
      {required this.name,
      required this.image,
      required this.dateAndTime,
      required this.message,
      required this.rating});
}

List<String> ratings = ['4.8', '4.5', '5', '4', '3.9', '4.8', '4.8', '4.5'];

List<String> dateAndTime = [
  "21 May, 2012",
  "24 Nov, 2013",
  "20 Mar, 2015",
  "03 May, 2015",
  "17 Jun, 2017",
  "28 Aug, 2019",
  "19 Jun, 2020",
  "08 Jan, 2021"
];

List<String> personName = [
  'Bradley Edwards',
  'Cody Lester',
  'Robert Guerrero',
  'Bradley Harper',
  'Claudia Thompson',
  'Michael Friedman',
  'John Jimenez',
  'Michael Snyder'
];

List<String> messages = [
  "Beds were not made on arrival. This is the only hostel I have stayed in where beds are not made (including generator in Dublin) This was a real pain when we checked in late as we then had to make beds at 2am around everyone else sleeping. The person on reception was also rude on check in. Overall would not stay again based on that.",
  "My locker didn't work, the atmosphere in the hostel is not that lively, it's not cozy.",
  "All doors in the room were squeaky, not very nice towards neighbours when you come back late at night. The room was very small for 6 people, bed sheets were with holes",
  "Bookings.com misled me into paying 5 euros for a towel I did not need, The room was great. Quiet and lovely to be high up and in the trees.",
  "Location is great. Beautiful park nearby. It was clean in the room, nice lobby, tasty coffee and food.",
  "However, on the first night, the fire alarm which was false sounded at around 1 AM in the morning, and it took about 45 minutes to fix the alarm. We were extremely annoyed because of that sound and my children didn't have a good sleep that night.",
  "The room is comfortable for my family. The location is pretty nice because it is located in the park, and there is a playground right in front of the hostel. So it is a plus for those who travel with small children.",
  "The view from the room was beautiful, straight to a huge park. Staff was always very nice, friendly, and eager to help us when needed. The hotel decor is very cool, I liked the mural view from the elevator."
];

List<Rating> ratingList = [
  Rating(
      name: personName[0],
      image: "${imagePath}avatar.png",
      dateAndTime: dateAndTime[0],
      message: messages[0],
      rating: ratings[0])
];
