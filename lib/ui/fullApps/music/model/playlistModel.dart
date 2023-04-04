import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/music_model.dart';

class PlaylistModel {
  String? id;
  String? name;
  String? duration;
  String? like;
  String? updatedDate;
  String? imgurl;
  String? artistName;
  List<MusicModel>? artistsMusicList = [];

  PlaylistModel(
      {this.id,
      this.name,
      this.duration,
      this.like,
      this.updatedDate,
      this.imgurl,
      this.artistName,
      this.artistsMusicList});
}

List<PlaylistModel> playList = [
  PlaylistModel(
    id: "1",
    name: "River Journey",
    duration: "10 min",
    like: "1",
    updatedDate: "15 Nov 2021",
    imgurl: "${imagePath}img_a.jpg",
    artistName: "Taylor Swift",
    artistsMusicList: musicsList,
  ),
  PlaylistModel(
    id: "2",
    name: "Singing Bowl",
    duration: "13 min",
    like: "0",
    updatedDate: "14 Nov 2021",
    imgurl: "${imagePath}img_b.jpg",
    artistName: "Ariana Grande ",
    artistsMusicList: musicsList,
  ),
  PlaylistModel(
    id: "3",
    name: "Jupiter",
    duration: "15 min",
    like: "0",
    updatedDate: "22 Nov 2021",
    imgurl: "${imagePath}img_c.jpg",
    artistName: "Billie Eilish",
    artistsMusicList: musicsList,
  ),
  PlaylistModel(
    id: "4",
    name: "Rustling leaves",
    duration: "29 min",
    like: "1",
    updatedDate: "25 Nov 2021",
    imgurl: "${imagePath}img_d.jpg",
    artistName: "Shawn Mendes",
    artistsMusicList: musicsList,
  ),
  PlaylistModel(
    id: "5",
    name: "Counting Sheep",
    duration: "23 min",
    like: "0",
    updatedDate: "02 Nov 2021",
    imgurl: "${imagePath}img_e.jpg",
    artistName: "Selena Gomez",
    artistsMusicList: musicsList,
  ),
  PlaylistModel(
    id: "6",
    name: "Rain on tent",
    duration: "10 min",
    like: "0",
    updatedDate: "30 Nov 2021",
    imgurl: "${imagePath}img_f.jpg",
    artistName: "Ed Sheeran",
    artistsMusicList: musicsList,
  ),
  PlaylistModel(
    id: "7",
    name: "Crowd",
    duration: "15 min",
    like: "1",
    updatedDate: "10 Nov 2021",
    imgurl: "${imagePath}img_a.jpg",
    artistName: "Dua Lipa",
    artistsMusicList: musicsList,
  ),
  PlaylistModel(
    id: "8",
    name: "Wind in Trees",
    duration: "7 min",
    like: "0",
    updatedDate: "15 Nov 2021",
    imgurl: "${imagePath}img_b.jpg",
    artistName: "Lady Gaga",
    artistsMusicList: musicsList,
  ),
];
