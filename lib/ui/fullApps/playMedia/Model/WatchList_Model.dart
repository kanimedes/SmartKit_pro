import 'package:smartkit_pro/ui/fullApps/playMedia/Model/MovieImage_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/MovieType_Model.dart';
import 'package:smartkit_pro/ui/fullApps/playMedia/Model/Review_Model.dart';

class WatchList_Model {
  String? id;
  String? like;
  String? name;
  String? time;
  String? rating;
  String? watchOption;
  String? image;
  String? duration;
  String? description;
  List<Review_Model>? reviewList;
  List<MovieImage_Model>? movieImageList;
  List<MovieType_Model>? movieTypeList;
  String? imgurl;
  String? hash;

  WatchList_Model(
      {this.id,
      this.like,
      this.name,
      this.time,
      this.rating,
      this.watchOption,
      this.image,
      this.duration,
      this.description,
      this.reviewList,
      this.movieImageList,
      this.movieTypeList,
      this.imgurl,
      this.hash});
}

List<WatchList_Model> watchList = [
  WatchList_Model(
      id: "1",
      name: "Ganpat",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "9.2",
      watchOption: "Watch options",
      image: "assets/images/fullApps/playMedia/slider_1.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_1.jpg?alt=media&token=c041cdea-873d-4905-a687-348d9c2f4d88",
      hash: "LmHBuQRjRjWW~pWBWAfko~Rkaxj]",
      duration: "2:34:14",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      movieTypeList: [
        MovieType_Model(id: "1", name: "Action"),
        MovieType_Model(id: "2", name: "Drama"),
      ],
      movieImageList: [
        MovieImage_Model(
          id: "1",
          image: "assets/images/fullApps/playMedia/slider_11.jpg",
          hash: "LpHK*BogWZNGL4R-NHn\$F~s:Rlj[",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_11.jpg?alt=media&token=7fc3650c-981c-4c80-9d81-e1ac033e0510",
          name: "Ganpat Trailers",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "2",
          image: "assets/images/fullApps/playMedia/slider_12.jpg",
          hash: "L01oqZaK00tlnOayS~kCI;bb\$*nO",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_12.jpg?alt=media&token=878ced6d-ddcd-4225-9718-4bab21184853",
          name: "Ganpat Review",
          like: "1",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "3",
          image: "assets/images/fullApps/playMedia/slider_13.jpg",
          hash: "LDCs%I0\$+Eq[u%e8u6X.0-t8D*M{",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_13.jpg?alt=media&token=fcdfba60-367a-4900-bf19-fb5fae12db1c",
          name: "Ganpat Song",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "4",
          image: "assets/images/fullApps/playMedia/slider_14.jpg",
          hash: "L95F5+DNV??w.AI9V?%hRiofjtWU",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_14.jpg?alt=media&token=6cd4348f-80cd-44da-9cc5-8298b56dc525",
          name: "Ganpat Movie",
          like: "1",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
      ],
      reviewList: [
        Review_Model(
            id: "17",
            name: "Ganpat",
            time: "2 hours ago",
            rating: "9.2",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_12.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_12.jpg?alt=media&token=7734a9e0-d1ef-422f-8d3d-efa7da264ae8",
            hash: "LACPOp0NEO^\$01%K\$%IC~ARkEMtQ"),
        Review_Model(
            id: "18",
            name: "Tadap",
            time: "2 hours ago",
            rating: "9.4",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_2.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_2.jpg?alt=media&token=706a33b6-1e60-457f-92ab-0d26134f6b6c",
            hash: "L89H34~p000L,*s9TLTK9aNI-p\$e"),
        Review_Model(
            id: "19",
            name: "Vikrant Rona",
            time: "2 hours ago",
            rating: "9.5",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_3.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_3.jpg?alt=media&token=ee3b229e-2b9a-4abb-b421-c12be5baeb21",
            hash: "LCCsmm?byY4;.TpJ?vx]cZ9b_2-p"),
        Review_Model(
            id: "20",
            name: "Liger",
            time: "2 hours ago",
            rating: "9.6",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_4.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_4.jpg?alt=media&token=750ee46a-315d-4f4c-a052-ef12c3d5c0ff",
            hash: "LpLEE5V@_NWB~pkCNHayjYa#a}WB"),
      ]),
  WatchList_Model(
      id: "2",
      name: "Tadap",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "9.4",
      watchOption: "Watch options",
      image: "assets/images/fullApps/playMedia/slider_10.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_10.jpg?alt=media&token=5b838a2a-3954-44c0-a204-b11d04094d3c",
      hash: "L025+8xa009Z^lt755ELRkays:of",
      duration: "3:14:20",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      movieTypeList: [
        MovieType_Model(id: "3", name: "Action"),
        MovieType_Model(id: "4", name: "Drama"),
      ],
      movieImageList: [
        MovieImage_Model(
          id: "5",
          image: "assets/images/fullApps/playMedia/slider_15.jpg",
          hash: "LPFYos-:NEg1~q-;NFkC%NW@t7Rl",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_15.jpg?alt=media&token=439a4398-cbf9-48e0-b97f-689d02caf126",
          name: "Tadap Trailers",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "6",
          image: "assets/images/fullApps/playMedia/slider_16.jpg",
          hash: "L78DIS13,DJSNHRjs,R+0i}qK4wd",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_16.jpg?alt=media&token=cc2d6e46-2783-4e65-aebe-3be5d6dbdcb0",
          name: "Tadap Review",
          like: "1",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "7",
          image: "assets/images/fullApps/playMedia/slider_17.jpg",
          hash: "LjG^hQM|M{t7~pbvbbfkspaes:WV",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_17.jpg?alt=media&token=1e221302-cecd-4628-9feb-a8188ff49ff6",
          name: "Tadap Song",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "8",
          image: "assets/images/fullApps/playMedia/slider_18.jpg",
          hash: "LAF=mZ01D\$yDI-e=R+WB01~nR,R5",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_18.jpg?alt=media&token=e64a63f8-c318-43a7-ad8d-daaa7c7b55ba",
          name: "Tadap Movie",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
      ],
      reviewList: [
        Review_Model(
            id: "21",
            name: "Ganpat",
            time: "2 hours ago",
            rating: "9.2",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_5.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_5.jpg?alt=media&token=3e89ae85-98cd-41bb-bfeb-b7bc1a5cd5a8",
            hash: "L66H\$F.8%h-;~q%MtlxuR*RjRjax"),
        Review_Model(
            id: "22",
            name: "Tadap",
            time: "2 hours ago",
            rating: "9.4",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_6.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_6.jpg?alt=media&token=e3ddce56-69c0-4690-a345-eafffe80bb0e",
            hash: "LBFNI|S201i{MeOW^Pn%02nj~U\$j"),
        Review_Model(
            id: "23",
            name: "Vikrant Rona",
            time: "2 hours ago",
            rating: "9.5",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_7.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_7.jpg?alt=media&token=8fdc8c75-4613-449d-bece-8a03047a69b5",
            hash: "LjG[_{_N_No~-ot6a|RkoJjsaej["),
        Review_Model(
            id: "24",
            name: "Liger",
            time: "2 hours ago",
            rating: "9.6",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_8.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_8.jpg?alt=media&token=f654ffa2-dea5-4836-bc69-a81f72acecb8",
            hash: "LBE.69=_0iE3~Bw^0f9^RjSg5QRi"),
      ]),
  WatchList_Model(
      id: "3",
      name: "Vikrant Rona",
      like: "1",
      time: "2021 9eps Tv-PG",
      rating: "9.5",
      watchOption: "Watch options",
      image: "assets/images/fullApps/playMedia/slider_11.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_11.jpg?alt=media&token=7fc3650c-981c-4c80-9d81-e1ac033e0510",
      hash: "LpHK*BogWZNGL4R-NHn\$F~s:Rlj[",
      duration: "2:54:53",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      movieTypeList: [
        MovieType_Model(id: "5", name: "Action"),
        MovieType_Model(id: "6", name: "Drama"),
      ],
      movieImageList: [
        MovieImage_Model(
          id: "9",
          image: "assets/images/fullApps/playMedia/slider_19.jpg",
          hash: "L29PcjOO:,iQuh+HsRkW050oA:t\$",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_19.jpg?alt=media&token=3221583a-e90f-4693-9f19-4d8e1bf463b4",
          name: "Vikrant Rona Trailers",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "10",
          image: "assets/images/fullApps/playMedia/slider_2.jpg",
          hash: "LC8qNgD%00_3~qIU4n-;%MWBM{of",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_2.jpg?alt=media&token=98dd4c7e-51b2-46b0-9120-2b51c658bdce",
          name: "Ganpat Review",
          like: "1",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "11",
          image: "assets/images/fullApps/playMedia/slider_3.jpg",
          hash: "LPFj~MWA%%o#1UogMxWB8_WDitn#",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_3.jpg?alt=media&token=bbde912a-cc79-44ec-a618-0a2980233257",
          name: "Ganpat Song",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "12",
          image: "assets/images/fullApps/playMedia/slider_4.jpg",
          hash: "LGA,zk00of~qRjofayae00?bxu9F",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_4.jpg?alt=media&token=b99d58be-c808-4470-90dd-bc7c092f5b3c",
          name: "Ganpat Movie",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
      ],
      reviewList: [
        Review_Model(
            id: "25",
            name: "Ganpat",
            time: "2 hours ago",
            rating: "9.2",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_9.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_9.jpg?alt=media&token=2c83bf65-b2de-4643-80a6-613be0b2a53b",
            hash: "L7DSUS~V009Fo~E20LIpNFNGxu?G"),
        Review_Model(
            id: "26",
            name: "Tadap",
            time: "2 hours ago",
            rating: "9.4",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_1.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_1.jpg?alt=media&token=fe740920-7f6d-414c-a94d-e342a0623f94",
            hash: "LACjCB.lO+#Tk#KbEkwJ.kyVt7xa"),
        Review_Model(
            id: "27",
            name: "Vikrant Rona",
            time: "2 hours ago",
            rating: "9.5",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_10.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_10.jpg?alt=media&token=159d97a4-a103-425e-a777-f8d373411b24",
            hash: "L4D8,q0\$?a~B.4NyQ-I:8^j@9FrX"),
        Review_Model(
            id: "28",
            name: "Liger",
            time: "2 hours ago",
            rating: "9.6",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_11.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_11.jpg?alt=media&token=a4937cb8-f34f-4f56-a2ec-0485667f5084",
            hash: "LB9H95%gKQ%1_Nxu%Mj]D*I9xCRk"),
      ]),
  WatchList_Model(
      id: "4",
      name: "Liger",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "9.6",
      watchOption: "Watch options",
      image: "assets/images/fullApps/playMedia/slider_12.jpg",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_12.jpg?alt=media&token=878ced6d-ddcd-4225-9718-4bab21184853",
      hash: "L01oqZaK00tlnOayS~kCI;bb\$*nO",
      duration: "2:54:20",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      movieTypeList: [
        MovieType_Model(id: "7", name: "Action"),
        MovieType_Model(id: "8", name: "Drama"),
      ],
      movieImageList: [
        MovieImage_Model(
          id: "13",
          image: "assets/images/fullApps/playMedia/slider_5.jpg",
          hash: "LZJ%j=-o~UtQxtS5ENs.s:NHIpjs",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_5.jpg?alt=media&token=bfbe9dd6-e5e0-4ed8-9273-abe7a07f964b",
          name: "Liger Trailers",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "14",
          image: "assets/images/fullApps/playMedia/slider_6.jpg",
          hash: "L37BTGjG00DO*0IUQ-RPNuNFI9tR",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_6.jpg?alt=media&token=90556821-a790-4be9-9316-0304b2d0620a",
          name: "Liger Review",
          like: "1",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "15",
          image: "assets/images/fullApps/playMedia/slider_7.jpg",
          hash: "LfIg[jD2o~#l^*PAoMn\$IVoLV@nP",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_7.jpg?alt=media&token=f266040d-aa39-420d-8c84-4377262ac1b9",
          name: "Liger Song",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "16",
          image: "assets/images/fullApps/playMedia/slider_8.jpg",
          hash: "L33bzII94m?w.SROD%%gRPkDozad",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_8.jpg?alt=media&token=363bd3b2-51a9-4493-8d38-160af1948c35",
          name: "Ganpat Movie",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
      ],
      reviewList: [
        Review_Model(
            id: "29",
            name: "Ganpat",
            time: "2 hours ago",
            rating: "9.2",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_12.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_12.jpg?alt=media&token=7734a9e0-d1ef-422f-8d3d-efa7da264ae8",
            hash: "LACPOp0NEO^\$01%K\$%IC~ARkEMtQ"),
        Review_Model(
            id: "30",
            name: "Tadap",
            time: "2 hours ago",
            rating: "9.4",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_2.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_2.jpg?alt=media&token=706a33b6-1e60-457f-92ab-0d26134f6b6c",
            hash: "L89H34~p000L,*s9TLTK9aNI-p\$e"),
        Review_Model(
            id: "31",
            name: "Vikrant Rona",
            time: "2 hours ago",
            rating: "9.5",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_3.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_3.jpg?alt=media&token=ee3b229e-2b9a-4abb-b421-c12be5baeb21",
            hash: "LCCsmm?byY4;.TpJ?vx]cZ9b_2-p"),
        Review_Model(
            id: "32",
            name: "Liger",
            time: "2 hours ago",
            rating: "9.6",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_4.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_4.jpg?alt=media&token=750ee46a-315d-4f4c-a052-ef12c3d5c0ff",
            hash: "LpLEE5V@_NWB~pkCNHayjYa#a}WB"),
      ]),

//
];
List<WatchList_Model> topScoreList = [
  WatchList_Model(
      id: "1",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "9.2",
      watchOption: "Watch options",
      name: "The Croods",
      image: "assets/images/fullApps/playMedia/slider_11.jpg",
      hash: "LpHK*BogWZNGL4R-NHn\$F~s:Rlj[",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_11.jpg?alt=media&token=7fc3650c-981c-4c80-9d81-e1ac033e0510",
      duration: "2:34:14",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      movieTypeList: [
        MovieType_Model(id: "1", name: "Action"),
        MovieType_Model(id: "2", name: "Drama"),
      ],
      movieImageList: [
        MovieImage_Model(
          id: "1",
          image: "assets/images/fullApps/playMedia/slider_9.jpg",
          hash: "LfKvZ:Men5S6~TnNRnayELoyX9n#",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_9.jpg?alt=media&token=4232549f-ed35-424f-997e-5d8bdd7d4ecd",
          name: "Ganpat Trailers",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "2",
          image: "assets/images/fullApps/playMedia/slider_20.jpg",
          hash: "LT6+|wo}MxWYyZo#R*a#j]f,aejY",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_20.jpg?alt=media&token=ff519df3-f65f-4473-b01a-e929a29548f6",
          name: "Ganpat Review",
          like: "1",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "3",
          image: "assets/images/fullApps/playMedia/slider_1.jpg",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_1.jpg?alt=media&token=c041cdea-873d-4905-a687-348d9c2f4d88",
          hash: "LmHBuQRjRjWW~pWBWAfko~Rkaxj]",
          name: "Ganpat Song",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "4",
          image: "assets/images/fullApps/playMedia/slider_10.jpg",
          hash: "L025+8xa009Z^lt755ELRkays:of",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_10.jpg?alt=media&token=5b838a2a-3954-44c0-a204-b11d04094d3c",
          name: "Ganpat Movie",
          like: "1",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
      ],
      reviewList: [
        Review_Model(
            id: "1",
            name: "Ganpat",
            time: "2 hours ago",
            rating: "9.2",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_1.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_1.jpg?alt=media&token=fe740920-7f6d-414c-a94d-e342a0623f94",
            hash: "LACjCB.lO+#Tk#KbEkwJ.kyVt7xa"),
        Review_Model(
            id: "30",
            name: "Tadap",
            time: "2 hours ago",
            rating: "9.4",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_5.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_5.jpg?alt=media&token=3e89ae85-98cd-41bb-bfeb-b7bc1a5cd5a8",
            hash: "L66H\$F.8%h-;~q%MtlxuR*RjRjax"),
        Review_Model(
            id: "31",
            name: "Vikrant Rona",
            time: "2 hours ago",
            rating: "9.5",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_6.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_6.jpg?alt=media&token=e3ddce56-69c0-4690-a345-eafffe80bb0e",
            hash: "LBFNI|S201i{MeOW^Pn%02nj~U\$j"),
        Review_Model(
            id: "32",
            name: "Liger",
            time: "2 hours ago",
            rating: "9.6",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_7.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_7.jpg?alt=media&token=8fdc8c75-4613-449d-bece-8a03047a69b5",
            hash: "LjG[_{_N_No~-ot6a|RkoJjsaej["),
      ]),
  WatchList_Model(
      id: "2",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "9.4",
      watchOption: "Watch options",
      name: "The Smurfs",
      image: "assets/images/fullApps/playMedia/slider_15.jpg",
      hash: "LPFYos-:NEg1~q-;NFkC%NW@t7Rl",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_15.jpg?alt=media&token=439a4398-cbf9-48e0-b97f-689d02caf126",
      duration: "3:14:20",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      movieTypeList: [
        MovieType_Model(id: "3", name: "Action"),
        MovieType_Model(id: "4", name: "Drama"),
      ],
      movieImageList: [
        MovieImage_Model(
          id: "5",
          image: "assets/images/fullApps/playMedia/slider_11.jpg",
          hash: "LpHK*BogWZNGL4R-NHn\$F~s:Rlj[",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_11.jpg?alt=media&token=7fc3650c-981c-4c80-9d81-e1ac033e0510",
          name: "Tadap Trailers",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "6",
          image: "assets/images/fullApps/playMedia/slider_12.jpg",
          hash: "L01oqZaK00tlnOayS~kCI;bb\$*nO",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_12.jpg?alt=media&token=878ced6d-ddcd-4225-9718-4bab21184853",
          name: "Tadap Review",
          like: "1",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "7",
          image: "assets/images/fullApps/playMedia/slider_13.jpg",
          hash: "LDCs%I0\$+Eq[u%e8u6X.0-t8D*M{",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_13.jpg?alt=media&token=fcdfba60-367a-4900-bf19-fb5fae12db1c",
          name: "Tadap Song",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "8",
          image: "assets/images/fullApps/playMedia/slider_14.jpg",
          hash: "L95F5+DNV??w.AI9V?%hRiofjtWU",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_14.jpg?alt=media&token=6cd4348f-80cd-44da-9cc5-8298b56dc525",
          name: "Tadap Movie",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
      ],
      reviewList: [
        Review_Model(
            id: "5",
            name: "Ganpat",
            time: "2 hours ago",
            rating: "9.2",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_2.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_2.jpg?alt=media&token=706a33b6-1e60-457f-92ab-0d26134f6b6c",
            hash: "L89H34~p000L,*s9TLTK9aNI-p\$e"),
        Review_Model(
            id: "6",
            name: "Tadap",
            time: "2 hours ago",
            rating: "9.4",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_3.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_3.jpg?alt=media&token=ee3b229e-2b9a-4abb-b421-c12be5baeb21",
            hash: "LCCsmm?byY4;.TpJ?vx]cZ9b_2-p"),
        Review_Model(
            id: "7",
            name: "Vikrant Rona",
            time: "2 hours ago",
            rating: "9.5",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_4.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_4.jpg?alt=media&token=750ee46a-315d-4f4c-a052-ef12c3d5c0ff",
            hash: "LpLEE5V@_NWB~pkCNHayjYa#a}WB"),
        Review_Model(
            id: "8",
            name: "Liger",
            time: "2 hours ago",
            rating: "9.6",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_5.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_5.jpg?alt=media&token=3e89ae85-98cd-41bb-bfeb-b7bc1a5cd5a8",
            hash: "L66H\$F.8%h-;~q%MtlxuR*RjRjax"),
      ]),
  WatchList_Model(
      id: "3",
      like: "1",
      time: "2021 9eps Tv-PG",
      rating: "9.5",
      watchOption: "Watch options",
      name: "Godzilla vs Kong",
      image: "assets/images/fullApps/playMedia/slider_7.jpg",
      hash: "LfIg[jD2o~#l^*PAoMn\$IVoLV@nP",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_7.jpg?alt=media&token=f266040d-aa39-420d-8c84-4377262ac1b9",
      duration: "2:54:53",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      movieTypeList: [
        MovieType_Model(id: "5", name: "Action"),
        MovieType_Model(id: "6", name: "Drama"),
      ],
      movieImageList: [
        MovieImage_Model(
          id: "9",
          image: "assets/images/fullApps/playMedia/slider_15.jpg",
          hash: "LPFYos-:NEg1~q-;NFkC%NW@t7Rl",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_15.jpg?alt=media&token=439a4398-cbf9-48e0-b97f-689d02caf126",
          name: "Vikrant Rona Trailers",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "10",
          image: "assets/images/fullApps/playMedia/slider_16.jpg",
          hash: "L78DIS13,DJSNHRjs,R+0i}qK4wd",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_16.jpg?alt=media&token=cc2d6e46-2783-4e65-aebe-3be5d6dbdcb0",
          name: "Ganpat Review",
          like: "1",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "11",
          image: "assets/images/fullApps/playMedia/slider_17.jpg",
          hash: "LjG^hQM|M{t7~pbvbbfkspaes:WV",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_17.jpg?alt=media&token=1e221302-cecd-4628-9feb-a8188ff49ff6",
          name: "Ganpat Song",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "12",
          image: "assets/images/fullApps/playMedia/slider_18.jpg",
          hash: "LAF=mZ01D\$yDI-e=R+WB01~nR,R5",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_18.jpg?alt=media&token=e64a63f8-c318-43a7-ad8d-daaa7c7b55ba",
          name: "Ganpat Movie",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
      ],
      reviewList: [
        Review_Model(
            id: "1",
            name: "Ganpat",
            time: "2 hours ago",
            rating: "9.2",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_1.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_1.jpg?alt=media&token=fe740920-7f6d-414c-a94d-e342a0623f94",
            hash: "LACjCB.lO+#Tk#KbEkwJ.kyVt7xa"),
        Review_Model(
            id: "10",
            name: "Tadap",
            time: "2 hours ago",
            rating: "9.4",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_6.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_6.jpg?alt=media&token=e3ddce56-69c0-4690-a345-eafffe80bb0e",
            hash: "LBFNI|S201i{MeOW^Pn%02nj~U\$j"),
        Review_Model(
            id: "11",
            name: "Vikrant Rona",
            time: "2 hours ago",
            rating: "9.5",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_7.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_7.jpg?alt=media&token=8fdc8c75-4613-449d-bece-8a03047a69b5",
            hash: "LjG[_{_N_No~-ot6a|RkoJjsaej["),
        Review_Model(
            id: "12",
            name: "Liger",
            time: "2 hours ago",
            rating: "9.6",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_8.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_8.jpg?alt=media&token=f654ffa2-dea5-4836-bc69-a81f72acecb8",
            hash: "LBE.69=_0iE3~Bw^0f9^RjSg5QRi"),
      ]),
  WatchList_Model(
      id: "4",
      like: "0",
      time: "2021 9eps Tv-PG",
      rating: "9.6",
      watchOption: "Watch options",
      name: "Pirates Of Caribbean",
      image: "assets/images/fullApps/playMedia/slider_18.jpg",
      hash: "LAF=mZ01D\$yDI-e=R+WB01~nR,R5",
      imgurl:
          "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_18.jpg?alt=media&token=e64a63f8-c318-43a7-ad8d-daaa7c7b55ba",
      duration: "2:54:20",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      movieTypeList: [
        MovieType_Model(id: "7", name: "Action"),
        MovieType_Model(id: "8", name: "Drama"),
      ],
      movieImageList: [
        MovieImage_Model(
          id: "13",
          image: "assets/images/fullApps/playMedia/slider_19.jpg",
          hash: "L29PcjOO:,iQuh+HsRkW050oA:t\$",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_19.jpg?alt=media&token=3221583a-e90f-4693-9f19-4d8e1bf463b4",
          name: "Liger Trailers",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "14",
          image: "assets/images/fullApps/playMedia/slider_2.jpg",
          hash: "LC8qNgD%00_3~qIU4n-;%MWBM{of",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_2.jpg?alt=media&token=98dd4c7e-51b2-46b0-9120-2b51c658bdce",
          name: "Liger Review",
          like: "1",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "15",
          image: "assets/images/fullApps/playMedia/slider_3.jpg",
          hash: "LPFj~MWA%%o#1UogMxWB8_WDitn#",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_3.jpg?alt=media&token=bbde912a-cc79-44ec-a618-0a2980233257",
          name: "Liger Song",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
        MovieImage_Model(
          id: "16",
          image: "assets/images/fullApps/playMedia/slider_4.jpg",
          hash: "LGA,zk00of~qRjofayae00?bxu9F",
          imgurl:
              "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fslider_4.jpg?alt=media&token=b99d58be-c808-4470-90dd-bc7c092f5b3c",
          name: "Ganpat Movie",
          like: "0",
          time: "2021 9eps Tv-PG",
          rating: "9.2",
          watchOption: "Watch options",
          duration: "2:34",
        ),
      ],
      reviewList: [
        Review_Model(
            id: "13",
            name: "Ganpat",
            time: "2 hours ago",
            rating: "9.2",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_9.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_9.jpg?alt=media&token=2c83bf65-b2de-4643-80a6-613be0b2a53b",
            hash: "L7DSUS~V009Fo~E20LIpNFNGxu?G"),
        Review_Model(
            id: "14",
            name: "Tadap",
            time: "2 hours ago",
            rating: "9.4",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_1.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_1.jpg?alt=media&token=fe740920-7f6d-414c-a94d-e342a0623f94",
            hash: "LACjCB.lO+#Tk#KbEkwJ.kyVt7xa"),
        Review_Model(
            id: "15",
            name: "Vikrant Rona",
            time: "2 hours ago",
            rating: "9.5",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_10.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_10.jpg?alt=media&token=159d97a4-a103-425e-a777-f8d373411b24",
            hash: "L4D8,q0\$?a~B.4NyQ-I:8^j@9FrX"),
        Review_Model(
            id: "16",
            name: "Liger",
            time: "2 hours ago",
            rating: "9.6",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            image: "assets/images/fullApps/playMedia/castings_11.jpg",
            imgurl:
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/movieapp%2Fcastings_11.jpg?alt=media&token=a4937cb8-f34f-4f56-a2ec-0485667f5084",
            hash: "LB9H95%gKQ%1_Nxu%Mj]D*I9xCRk"),
      ]),

//
];
