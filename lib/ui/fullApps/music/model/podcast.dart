import 'package:smartkit_pro/ui/fullApps/music/helper/constanat.dart';
import 'package:smartkit_pro/ui/fullApps/music/model/music_model.dart';

class PodcastModel {
  String? id;
  String? name;
  String? duration;
  String? imgurl;
  String? artistName;
  List<MusicModel>? artistsMusicList = [];

  PodcastModel(
      {this.id,
      this.name,
      this.duration,
      this.imgurl,
      this.artistName,
      this.artistsMusicList});
}

List<PodcastModel> podcastList = [
  PodcastModel(
    id: "9",
    name: "River Journey",
    duration: "10 min",
    imgurl: "${imagePath}img_a.jpg",
    artistName: "Taylor Swift",
    artistsMusicList: musicsList,
  ),
  PodcastModel(
    id: "10",
    name: "Singing Bowl",
    duration: "13 min",
    imgurl: "${imagePath}img_b.jpg",
    artistName: "Ariana Grande ",
    artistsMusicList: musicsList,
  ),
  PodcastModel(
    id: "11",
    name: "Jupiter",
    duration: "15 min",
    imgurl: "${imagePath}img_c.jpg",
    artistName: "Billie Eilish",
    artistsMusicList: musicsList,
  ),
  PodcastModel(
    id: "12",
    name: "Rustling leaves",
    duration: "29 min",
    imgurl: "${imagePath}img_d.jpg",
    artistName: "Shawn Mendes",
    artistsMusicList: musicsList,
  ),
  PodcastModel(
    id: "13",
    name: "Counting Sheep",
    duration: "23 min",
    imgurl: "${imagePath}img_e.jpg",
    artistName: "Selena Gomez",
    artistsMusicList: musicsList,
  ),
  PodcastModel(
    id: "14",
    name: "Rain on tent",
    duration: "10 min",
    imgurl: "${imagePath}img_f.jpg",
    artistName: "Ed Sheeran",
    artistsMusicList: musicsList,
  ),
  PodcastModel(
    id: "15",
    name: "Crowd",
    duration: "15 min",
    imgurl: "${imagePath}img_a.jpg",
    artistName: "Dua Lipa",
    artistsMusicList: musicsList,
  ),
  PodcastModel(
    id: "16",
    name: "Wind in Trees",
    duration: "7 min",
    imgurl: "${imagePath}img_b.jpg",
    artistName: "Lady Gaga",
    artistsMusicList: musicsList,
  ),
];
