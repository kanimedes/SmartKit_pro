import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/music_model.dart';

class SingerModel {
  String? id;
  String? name;
  String? imgurl;
  List<MusicModel>? artistsMusicList = [];

  SingerModel({this.id, this.name, this.imgurl, this.artistsMusicList});
}

List<SingerModel> singerList = [
  SingerModel(
    id: "1",
    name: "Selena Gomez",
    imgurl: "${imagePath}singer1.jpg",
    artistsMusicList: musicsList,
  ),
  SingerModel(
    id: "2",
    name: "Shawn Mendes",
    imgurl: "${imagePath}singer2.jpg",
    artistsMusicList: musicsList,
  ),
  SingerModel(
    id: "3",
    name: "Halsey",
    imgurl: "${imagePath}singer3.jpg",
    artistsMusicList: musicsList,
  ),
  SingerModel(
    id: "4",
    name: "The weekend",
    imgurl: "${imagePath}singer4.jpg",
    artistsMusicList: musicsList,
  ),
  SingerModel(
    id: "5",
    name: "Ariana Grande",
    imgurl: "${imagePath}singer5.jpg",
    artistsMusicList: musicsList,
  ),
  SingerModel(
    id: "6",
    name: "Justin Bieber",
    imgurl: "${imagePath}singer6.jpg",
    artistsMusicList: musicsList,
  ),
  SingerModel(
    id: "7",
    name: "Dua Lipa",
    imgurl: "${imagePath}singer7.jpg",
    artistsMusicList: musicsList,
  ),
  SingerModel(
    id: "8",
    name: "Billie Eilish",
    imgurl: "${imagePath}singer8.jpg",
    artistsMusicList: musicsList,
  ),
  SingerModel(
    id: "9",
    name: "Ed Sheeran",
    imgurl: "${imagePath}singer9.jpg",
    artistsMusicList: musicsList,
  ),
];
