import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:octo_image/octo_image.dart';

import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopColor.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Helper/HappyShopString.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopCatgories.dart';
import 'package:smartkit_pro/ui/fullApps/happyShop/Screen/HappyShopProductDetail.dart';

import 'HappyShopStaggeredList.dart';

List sectList = [
  {
    'section': "Offers on men's Fashion",
    'style': "default",
    'productList': [
      {
        'tag': "1",
        'localimg': "assets/images/fullApps/happyshop/man_a1.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_a1.jpg?alt=media&token=1146e1bd-b1e6-4974-95fb-cbc68562410f",
        'blurUrl': "LEBz2[Rj0Lt8_4WBM{s:D%j]%LWA",
        'imglist': [
          {
            'tag': "1",
            'localimg': "assets/images/fullApps/happyshop/man_a1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_a1.jpg?alt=media&token=1146e1bd-b1e6-4974-95fb-cbc68562410f",
            'blurUrl': "LEBz2[Rj0Lt8_4WBM{s:D%j]%LWA",
          },
          {
            'tag': "2",
            'localimg': "assets/images/fullApps/happyshop/man_a2.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_a2.jpg?alt=media&token=5b5f06e8-57dc-4b1d-a91c-fe85fc0af7fe",
            'blurUrl': "LAD04R9E00?bt9ofxaRj00xu~qM{",
          },
          {
            'tag': "3",
            'localimg': "assets/images/fullApps/happyshop/man_a3.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_a3.jpg?alt=media&token=c9757913-6905-49d1-bc15-0860f9c8b3c8",
            'blurUrl': "L8C\$~4E000R%ohNH%Ms.00WB~q%2",
          },
          {
            'tag': "4",
            'localimg': "assets/images/fullApps/happyshop/man_a4.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_a4.jpg?alt=media&token=385a3e83-e70f-411a-affc-30d0e57b5d70",
            'blurUrl': "L7E30h4n00~p?dWC-:xu00?H~p4n",
          },
          {
            'tag': "5",
            'localimg': "assets/images/fullApps/happyshop/man_a5.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_a5.jpg?alt=media&token=1d4a7303-4c0a-4b72-9d97-16be32b9475e",
            'blurUrl': "L9ECkH0J00~p-?ju%LWV00-p_3D%",
          },
        ],
        'name': "Printed Men Round Neck Maroon T-Shirt",
        'descprice': "2500",
        'price': "3500",
        'rating': "4.5",
        'noOfRating': "90"
      },
      {
        'tag': "2",
        'localimg': "assets/images/fullApps/happyshop/man_b1.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_b1.jpg?alt=media&token=c020afa6-4dfd-4dbe-b9fc-96c88623b9f4",
        'blurUrl': "L8Al^aMd00?w-obbI;e-D#o~o~R4",
        'imglist': [
          {
            'tag': "6",
            'localimg': "assets/images/fullApps/happyshop/man_b1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_b1.jpg?alt=media&token=c020afa6-4dfd-4dbe-b9fc-96c88623b9f4",
            'blurUrl': "L8Al^aMd00?w-obbI;e-D#o~o~R4",
          },
          {
            'tag': "7",
            'localimg': "assets/images/fullApps/happyshop/man_b2.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_b2.jpg?alt=media&token=695c7dd1-fb59-4e0e-87c6-5e5e6884bf48",
            'blurUrl': "L39?UnNG00?H~CWC9u%25kf8\$*ni",
          },
          {
            'tag': "8",
            'localimg': "assets/images/fullApps/happyshop/man_b3.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_b3.jpg?alt=media&token=113bd05b-e54f-452e-bcf8-c356c1281bf9",
            'blurUrl': "L4BMGe+Z00Ou]x%35?EL00tn.T9D",
          },
          {
            'tag': "9",
            'localimg': "assets/images/fullApps/happyshop/man_b4.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_b4.jpg?alt=media&token=3452fe87-530f-4471-a1ff-beacb5855a4e",
            'blurUrl': "L59?RexG00NG~Wof56R*0eR*?Ht6",
          },
          {
            'tag': "10",
            'localimg': "assets/images/fullApps/happyshop/man_b5.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_b5.jpg?alt=media&token=dad5fa3e-c267-4d79-b09c-df63ca71b244",
            'blurUrl': "L8AI[VWB0K%2~WWU9Yogb^jZRjWo",
          },
        ],
        'name': "Printed Men Round Neck Yellow, Black T-Shirt",
        'descprice': "1000",
        'price': "1200",
        'rating': "2.5",
        'noOfRating': "50"
      },
      {
        'tag': "3",
        'localimg': "assets/images/fullApps/happyshop/man_c1.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_c1.jpg?alt=media&token=3c312b6b-bce8-4ea2-900d-9fddf9c2da87",
        'blurUrl': "LdIOIZs:~qM{%MayM{WB%LWBR*ay",
        'imglist': [
          {
            'tag': "11",
            'localimg': "assets/images/fullApps/happyshop/man_c1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_c1.jpg?alt=media&token=3c312b6b-bce8-4ea2-900d-9fddf9c2da87",
            'blurUrl': "LdIOIZs:~qM{%MayM{WB%LWBR*ay",
          },
          {
            'tag': "12",
            'localimg': "assets/images/fullApps/happyshop/man_c2.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_c2.jpg?alt=media&token=b29c5e5c-99fd-4cb5-ae51-f14c51306cc5",
            'blurUrl': "LbHo2pM{~qkC%MjtM{WB%Mf6M{j]",
          },
          {
            'tag': "13",
            'localimg': "assets/images/fullApps/happyshop/man_c3.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_c3.jpg?alt=media&token=b4685680-9e50-445a-88ba-707cdbcf7f29",
            'blurUrl': "LGDSXgWB-;M{~WWBNHWBRjWBxbof",
          },
        ],
        'name': "Solid Men Round Neck Grey T-Shirt",
        'descprice': "1300",
        'price': "1400",
        'rating': "3.5",
        'noOfRating': "45"
      },
      {
        'tag': "4",
        'localimg': "assets/images/fullApps/happyshop/man_d1.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_d1.jpg?alt=media&token=29f14306-c791-4c32-95b8-92772fff1a39",
        'blurUrl': "LERv~f--~Nn9.5NLxF\${XkV[Mzxs",
        'imglist': [
          {
            'tag': "14",
            'localimg': "assets/images/fullApps/happyshop/man_d1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_d1.jpg?alt=media&token=29f14306-c791-4c32-95b8-92772fff1a39",
            'blurUrl': "LERv~f--~Nn9.5NLxF\${XkV[Mzxs",
          },
          {
            'tag': "15",
            'localimg': "assets/images/fullApps/happyshop/man_d2.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_d2.jpg?alt=media&token=6037b8d6-d9ac-4b4e-a6b7-55f4be8f7564",
            'blurUrl': "L8SWR\$_1^]0l*G-iVaIqg}V@Q;Si",
          },
          {
            'tag': "16",
            'localimg': "assets/images/fullApps/happyshop/man_d3.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_d3.jpg?alt=media&token=e1f5c801-85af-43c9-91dd-70dd08db034f",
            'blurUrl': "LDSf:M%d~fE7ynW?v%WUX3n\$i~WF",
          },
          {
            'tag': "17",
            'localimg': "assets/images/fullApps/happyshop/man_d4.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_d4.jpg?alt=media&token=6de1d68c-eb17-4f60-bad7-40fde9535d5c",
            'blurUrl': "LMS3rgt7~2W-t*kAa3Rmv\$afS}kB",
          },
        ],
        'name': "Men Regular Fit Solid Casual Shirt",
        'descprice': "1700",
        'price': "2000",
        'rating': "4.5",
        'noOfRating': "150"
      },
      {
        'tag': "5",
        'localimg': "assets/images/fullApps/happyshop/man_e1.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_e1.jpg?alt=media&token=7f176bcc-c0c9-4490-bcfe-97a458073059",
        'blurUrl': "LJLM7CV{pfNHY7oLkXWVxUf+v|r=",
        'imglist': [
          {
            'tag': "18",
            'localimg': "assets/images/fullApps/happyshop/man_e1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_e1.jpg?alt=media&token=7f176bcc-c0c9-4490-bcfe-97a458073059",
            'blurUrl': "LJLM7CV{pfNHY7oLkXWVxUf+v|r=",
          },
          {
            'tag': "19",
            'localimg': "assets/images/fullApps/happyshop/man_e2.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_e2.jpg?alt=media&token=73e3bdff-268e-49ca-a1e1-c997e1dd9590",
            'blurUrl': "LeKlz;xcXoI.yZWBnNnjxGR\$W9xb",
          },
          {
            'tag': "20",
            'localimg': "assets/images/fullApps/happyshop/man_e3.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_e3.jpg?alt=media&token=c5d0ee40-35d4-4856-841c-794d5bfaa57c",
            'blurUrl': "LiLyaGsSt:XTt,bIr=nhs=ofNFWB",
          },
          {
            'tag': "21",
            'localimg': "assets/images/fullApps/happyshop/man_e4.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_e4.jpg?alt=media&token=5d1c22b2-95eb-4c65-af0b-300c2cc12da6",
            'blurUrl': "LOL.=rrru6O[cskEogV=s6tSi^iu",
          },
          {
            'tag': "22",
            'localimg': "assets/images/fullApps/happyshop/man_e5.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fman_e5.jpg?alt=media&token=93c89678-031d-478c-b304-4732e9db4208",
            'blurUrl': "LPL{cYs=T#R-o{oexaoJK7WArqs;",
          },
        ],
        'name': "Printed Men Round Neck Maroon T-Shirt",
        'descprice': "2500",
        'price': "3500",
        'rating': "4.5",
        'noOfRating': "90"
      },
    ]
  },
  {
    'section': "Walk in Style",
    'style': "style_1",
    'productList': [
      {
        'tag': "6",
        'localimg': "assets/images/fullApps/happyshop/collections_a.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fcollections_a.jpg?alt=media&token=0fd8a58b-ace5-4b9d-89d4-50bb29b5bfff",
        'blurUrl': "LJQv2XMw_3%g-;tQofa}_NW@D*WA",
        'name': "Nike",
        'descprice': "2500",
        'price': "3500",
        'rating': "4.5",
        'noOfRating': "90"
      },
      {
        'tag': "7",
        'localimg': "assets/images/fullApps/happyshop/collections_b.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fcollections_b.jpg?alt=media&token=fea48c99-963a-4a2a-a79c-7fcd99b4974d",
        'blurUrl': "LBCi{\$%M9F-;~qozRjt79Fj[niM{",
        'name': "Bag",
        'descprice': "1000",
        'price': "1200",
        'rating': "2.5",
        'noOfRating': "50"
      },
      {
        'tag': "8",
        'localimg': "assets/images/fullApps/happyshop/collections_c.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fcollections_c.jpg?alt=media&token=44d1ca8d-3f12-4108-bc2f-17b0911a0e3f",
        'blurUrl': "LCQ[_RkP~Bm,.lrEX.pIyEO@RPn4",
        'name': "Puma Shoes",
        'descprice': "1300",
        'price': "1400",
        'rating': "3.5",
        'noOfRating': "45"
      },
      {
        'tag': "9",
        'localimg': "assets/images/fullApps/happyshop/collections_d.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fcollections_d.jpg?alt=media&token=bb3b5792-b946-4acc-a5f0-db0938083ee5",
        'blurUrl': "LXO|qgR*~W%MJ7WCnOae?bj[IURj",
        'name': "NIkeShoes",
        'descprice': "1700",
        'price': "2000",
        'rating': "4.5",
        'noOfRating': "150"
      },
      {
        'tag': "10",
        'localimg': "assets/images/fullApps/happyshop/collections_e.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fcollections_e.jpg?alt=media&token=46df9d04-9c54-4851-94e6-f0c4c1b96e10",
        'blurUrl': "LEOnz2xb~N[o}~#jDoO?-iTKNJE3",
        'name': "Nike",
        'descprice': "2500",
        'price': "3500",
        'rating': "4.5",
        'noOfRating': "90"
      },
      {
        'tag': "11",
        'localimg': "assets/images/fullApps/happyshop/collections_f.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fcollections_f.jpg?alt=media&token=2cefd34e-b765-433e-a7c3-629969ef70af",
        'blurUrl': "LTOWyu4n.8_N_N?bV?IA-BRPIoRP",
        'name': "Bag",
        'descprice': "1000",
        'price': "1200",
        'rating': "2.5",
        'noOfRating': "50"
      },
      {
        'tag': "12",
        'localimg': "assets/images/fullApps/happyshop/collections_g.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fcollections_g.jpg?alt=media&token=b4374e5e-92c4-4ab5-9494-3f96894d9ee7",
        'blurUrl': "LAQ@wg^H=.AL]{n9WIWS}*yCt2a0",
        'name': "Puma Shoes",
        'descprice': "1300",
        'price': "1400",
        'rating': "3.5",
        'noOfRating': "45"
      },
      {
        'tag': "13",
        'localimg': "assets/images/fullApps/happyshop/collections_h.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fcollections_h.jpg?alt=media&token=568d340b-2477-41e8-88e9-1fadcc7e5eae",
        'blurUrl': "LKOzSsWBM{-;%M-;D*%M_3~qV@IU",
        'name': "NIkeShoes",
        'descprice': "1700",
        'price': "2000",
        'rating': "4.5",
        'noOfRating': "150"
      },
      {
        'tag': "14",
        'localimg': "assets/images/fullApps/happyshop/collections_i.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fcollections_i.jpg?alt=media&token=6a28aacd-6c32-418f-aef0-289e5af99f94",
        'blurUrl': "LORBmq%K}\$N{}ORkJ;nOxaazV[tP",
        'name': "NIkeShoes",
        'descprice': "1700",
        'price': "2000",
        'rating': "4.5",
        'noOfRating': "150"
      },
    ]
  },
  {
    'section': "Women's Fashion",
    'style': "style_2",
    'productList': [
      {
        'tag': "15",
        'localimg': "assets/images/fullApps/happyshop/woman_a1.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_a1.jpg?alt=media&token=624b4d16-86f5-45ab-9c2c-40a6c957f10e",
        'blurUrl': "LDRAQ99y}8-7?E\$}oJNx,Cr?J-S}",
        'imglist': [
          {
            'tag': "1",
            'localimg': "assets/images/fullApps/happyshop/woman_a1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_a1.jpg?alt=media&token=624b4d16-86f5-45ab-9c2c-40a6c957f10e",
            'blurUrl': "LDRAQ99y}8-7?E\$}oJNx,Cr?J-S}",
          },
          {
            'tag': "2",
            'localimg': "assets/images/fullApps/happyshop/woman_a2.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_a2.jpg?alt=media&token=41bd7c50-f4b4-4a34-98c8-fd9bedee4198",
            'blurUrl': "LHRJ;-9d}RxD-ms,WBNx#+n%OXW;",
          },
          {
            'tag': "3",
            'localimg': "assets/images/fullApps/happyshop/woman_a3.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_a3.jpg?alt=media&token=6a394b0b-59eb-463e-b537-9f68f28c649d",
            'blurUrl': "LdPELhRQ}lWEr?s.%JagxBWENKoe",
          },
          {
            'tag': "4",
            'localimg': "assets/images/fullApps/happyshop/woman_a4.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_a4.jpg?alt=media&token=2820a9b7-f2cf-42b1-ae3d-9e0c7212f8ab",
            'blurUrl': "LcQQr@M}}l%K\$~WXoxs,i{oeW=Rk",
          },
        ],
        'name': "Casual Roll-up Sleeve Solid Women Top",
        'descprice': "2500",
        'price': "3500",
        'rating': "4.5",
        'noOfRating': "90"
      },
      {
        'tag': "16",
        'localimg': "assets/images/fullApps/happyshop/woman_b1.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b1.jpg?alt=media&token=1e8c51be-6cf4-47e3-909a-7ba0e6add4f8",
        'blurUrl': "LLIDhWxa5[JB}tocKQWZS\$R*xC\$%",
        'imglist': [
          {
            'tag': "5",
            'localimg': "assets/images/fullApps/happyshop/woman_b1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b1.jpg?alt=media&token=1e8c51be-6cf4-47e3-909a-7ba0e6add4f8",
            'blurUrl': "LLIDhWxa5[JB}tocKQWZS\$R*xC\$%",
          },
          {
            'tag': "6",
            'localimg': "assets/images/fullApps/happyshop/woman_b2.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b2.jpg?alt=media&token=7a79082c-d228-4593-8aab-1066603f56da",
            'blurUrl': "LHJQHw~XF\$9Z=xjrOYozE-NG\$Kxa",
          },
          {
            'tag': "7",
            'localimg': "assets/images/fullApps/happyshop/woman_b3.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b3.jpg?alt=media&token=3d01cc6e-86d8-4e7f-9fb0-a46a4c479e6e",
            'blurUrl': "LFG@yi%3EnEM~DoLS%ShOZS2w[xG",
          },
          {
            'tag': "8",
            'localimg': "assets/images/fullApps/happyshop/woman_b4.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b4.jpg?alt=media&token=113683b4-3adf-42fe-8945-3bf5a52bda02",
            'blurUrl': "LGGtg--W5@EM}ts:KQOFR,WBxFxb",
          },
          {
            'tag': "9",
            'localimg': "assets/images/fullApps/happyshop/woman_b5.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_b5.jpg?alt=media&token=59b141c5-b804-40d6-a951-80fba9d5eff7",
            'blurUrl': "LJHwjH%3E.Io}]ofXUbbNyWBxCxa",
          },
        ],
        'name': "Casual Sleeveless Solid Women Top",
        'descprice': "1000",
        'price': "1200",
        'rating': "2.5",
        'noOfRating': "50"
      },
      {
        'tag': "17",
        'localimg': "assets/images/fullApps/happyshop/woman_c1.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c1.jpg?alt=media&token=51fe8e98-bcc2-4ae2-b681-01efe5bedfef",
        'blurUrl': "LPQsoNI:}F-VtRofnPWB\$*ofSNjF",
        'imglist': [
          {
            'tag': "10",
            'localimg': "assets/images/fullApps/happyshop/woman_c1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c1.jpg?alt=media&token=51fe8e98-bcc2-4ae2-b681-01efe5bedfef",
            'blurUrl': "LPQsoNI:}F-VtRofnPWB\$*ofSNjF",
          },
          {
            'tag': "11",
            'localimg': "assets/images/fullApps/happyshop/woman_c2.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c2.jpg?alt=media&token=a3489a1c-02c3-443c-95b1-ecb9a5242681",
            'blurUrl': "LQRcfGRj}txaXmkCr?aexGofODV@",
          },
          {
            'tag': "12",
            'localimg': "assets/images/fullApps/happyshop/woman_c3.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c3.jpg?alt=media&token=c8dcdbf1-6376-482f-b349-2b783baba66c",
            'blurUrl': "LQQ?%:M{}Yo}kqxGwJNa-Bs:NwNa",
          },
          {
            'tag': "13",
            'localimg': "assets/images/fullApps/happyshop/woman_c4.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c4.jpg?alt=media&token=fb071301-c34e-43e5-a8a3-363db55f02bc",
            'blurUrl': "LaPz_wRj}GxG%Ks9bwS3rDaes:s:",
          },
          {
            'tag': "14",
            'localimg': "assets/images/fullApps/happyshop/woman_c5.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_c5.jpg?alt=media&token=c79fb39d-0158-4342-bea3-18bd01de80a0",
            'blurUrl': "LkP||?R*|Lxar=ofg4R*IAWVx]s:",
          },
        ],
        'name': "Casual 3/4 Sleeve Solid Women Maroon Top",
        'descprice': "1300",
        'price': "1400",
        'rating': "3.5",
        'noOfRating': "45"
      },
      {
        'tag': "18",
        'localimg': "assets/images/fullApps/happyshop/woman_d1.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_d1.jpg?alt=media&token=3f616835-8709-46a6-9304-a43eaed0e988",
        'blurUrl': "LUM%D;xay?M|?aofR-VsC6WV#Sf6",
        'imglist': [
          {
            'tag': "15",
            'localimg': "assets/images/fullApps/happyshop/woman_d1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_d1.jpg?alt=media&token=3f616835-8709-46a6-9304-a43eaed0e988",
            'blurUrl': "LUM%D;xay?M|?aofR-VsC6WV#Sf6",
          },
          {
            'tag': "16",
            'localimg': "assets/images/fullApps/happyshop/woman_d2.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_d2.jpg?alt=media&token=0cf7a9e8-4608-4336-a9f8-0c501e4fc5e3",
            'blurUrl': "LLOy0DpcQ7IAHCni,[WBLLnOozoL",
          },
          {
            'tag': "17",
            'localimg': "assets/images/fullApps/happyshop/woman_d3.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_d3.jpg?alt=media&token=c91423e8-c879-4904-bbfe-29848d06dc26",
            'blurUrl': "LUOVilv~qFXnLKNZ#UxuTdWBV@kB",
          },
          {
            'tag': "18",
            'localimg': "assets/images/fullApps/happyshop/woman_d4.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fwoman_d4.jpg?alt=media&token=45702238-9a89-4a24-90e7-c273dde919cb",
            'blurUrl': "LUOVilv~qFXnLKNZ#UxuTdWBV@kB",
          },
        ],
        'name': "Casual Petal Sleeve Solid Women Yellow Top",
        'descprice': "1700",
        'price': "2000",
        'rating': "4.5",
        'noOfRating': "150"
      },
    ]
  },
  {
    'section': "Top Brands",
    'style': "style_3",
    'productList': [
      {
        'tag': "19",
        'localimg': "assets/images/fullApps/happyshop/brands_1.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_1.jpg?alt=media&token=25d88f3f-a2b5-40b6-9aa7-c95c43e6d960",
        'blurUrl': "LBGI\$Q9YyEIA00Mw_3RiT}aK%NRP",
        'imglist': [
          {
            'tag': "1",
            'localimg': "assets/images/fullApps/happyshop/brands_1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_1.jpg?alt=media&token=25d88f3f-a2b5-40b6-9aa7-c95c43e6d960",
            'blurUrl': "LBGI\$Q9YyEIA00Mw_3RiT}aK%NRP",
          },
          {
            'tag': "2",
            'localimg': "assets/images/fullApps/happyshop/brands_1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_1.jpg?alt=media&token=e609cbe2-1a06-4c27-ae9e-a59a0782064f",
            'blurUrl': "LBGI\$Q9YyEIA00Mw_3RiT}aK%NRP",
          },
          {
            'tag': "3",
            'localimg': "assets/images/fullApps/happyshop/brands_1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_1.jpg?alt=media&token=e609cbe2-1a06-4c27-ae9e-a59a0782064f",
            'blurUrl': "LBGI\$Q9YyEIA00Mw_3RiT}aK%NRP",
          },
          {
            'tag': "4",
            'localimg': "assets/images/fullApps/happyshop/brands_1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_1.jpg?alt=media&token=e609cbe2-1a06-4c27-ae9e-a59a0782064f",
            'blurUrl': "LBGI\$Q9YyEIA00Mw_3RiT}aK%NRP",
          },
          {
            'tag': "5",
            'localimg': "assets/images/fullApps/happyshop/brands_1.jpg",
            'img':
                "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_1.jpg?alt=media&token=e609cbe2-1a06-4c27-ae9e-a59a0782064f",
            'blurUrl': "LBGI\$Q9YyEIA00Mw_3RiT}aK%NRP",
          },
        ],
        'name': "Nike",
      },
      {
        'tag': "20",
        'localimg': "assets/images/fullApps/happyshop/brands_2.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_2.jpg?alt=media&token=3f0658e9-411a-4148-8937-1f3d41a0cee5",
        'blurUrl': "LfHeOc00-oIo?wDjt6nhxuWBIot6",
        'name': "Reebok",
      },
      {
        'tag': "21",
        'localimg': "assets/images/fullApps/happyshop/brands_3.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_3.jpg?alt=media&token=54a17b4c-2636-4b0c-941b-6aef9986044d",
        'blurUrl': "LCD,1J\$~004:^kRPT1bH00NH~q-p",
        'name': "Tommy Hilfiger",
      },
      {
        'tag': "22",
        'localimg': "assets/images/fullApps/happyshop/brands_4.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_4.jpg?alt=media&token=c8fc808a-0e8b-498f-b0f9-28b137516d9c",
        'blurUrl': "LRG]2LD%_Nt7-;ocM{ae-:xubIa}",
        'name': "Levi's",
      },
      {
        'tag': "23",
        'localimg': "assets/images/fullApps/happyshop/brands_5.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_5.jpg?alt=media&token=db7278c9-c8d3-4067-af2e-3fb130ec63d5",
        'blurUrl': "LJGR-tRQ?bInOrIUIot8_Nx]Mxad",
        'name': "U.S.Polo",
      },
      {
        'tag': "24",
        'localimg': "assets/images/fullApps/happyshop/brands_6.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_6.jpg?alt=media&token=e232386e-b941-4fc5-beab-fb82efe6bd2e",
        'blurUrl': "LNH_Jav|_NW=_NI[OFs:?un%-Bt8",
        'name': "Fila",
      },
      {
        'tag': "25",
        'localimg': "assets/images/fullApps/happyshop/brands_7.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_7.jpg?alt=media&token=df7ddddb-41ae-4f65-a4fa-449ce52706fd",
        'blurUrl': "L7GSDmM{00S\$mknhysX94TtRyEMx",
        'name': "Vans",
      },
      {
        'tag': "26",
        'localimg': "assets/images/fullApps/happyshop/brands_8.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_8.jpg?alt=media&token=9bd195d6-d358-4b0d-a8f0-9cca9aac14e6",
        'blurUrl': "LsNAr5of~qRjaeofofRjxuayM{fQ",
        'name': "Polo",
      },
      {
        'tag': "27",
        'localimg': "assets/images/fullApps/happyshop/brands_9.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_9.jpg?alt=media&token=7f4d88eb-eac2-42f2-93ca-5e47d2c52d76",
        'blurUrl': "LiK^BLx].mMx^6ozK3RjXRaeRPay",
        'name': "Calvin Klein",
      },
      {
        'tag': "28",
        'localimg': "assets/images/fullApps/happyshop/brands_10.jpg",
        'img':
            "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fbrands_10.jpg?alt=media&token=98f45098-c085-412b-9879-5cfc0858876f",
        'blurUrl': "LiK^]Q~q_Nr=?bbIoyIA-;RjM|ax",
        'name': "Superdry",
      },
    ]
  },
];

class HappyShopHpmeTab extends StatefulWidget {
  const HappyShopHpmeTab({Key? key}) : super(key: key);

  @override
  _HappyShopHpmeTabState createState() => _HappyShopHpmeTabState();
}

class _HappyShopHpmeTabState extends State<HappyShopHpmeTab>
    with TickerProviderStateMixin {
  List catList = [
    {'img': "assets/images/fullApps/happyshop/cat_1.png", 'title': "Men's"},
    {'img': "assets/images/fullApps/happyshop/cat_2.png", 'title': "women's"},
    {
      'img': "assets/images/fullApps/happyshop/cat_3.png",
      'title': "Women's Shoes"
    },
    {
      'img': "assets/images/fullApps/happyshop/cat_4.png",
      'title': "Man's Shoes"
    },
    {'img': "assets/images/fullApps/happyshop/cat_5.png", 'title': "Tie"},
    {'img': "assets/images/fullApps/happyshop/cat_6.png", 'title': "Earring"},
  ];

  final _controller = PageController();

  Animation? buttonSqueezeanimation;
  late AnimationController buttonController;

  @override
  void initState() {
    super.initState();
    buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  @override
  void dispose() {
    buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                      bottom: 0, top: kToolbarHeight * 1.4, right: 0, left: 0),
                  child: CarouselWithIndicator()),
              Column(
                children: [
                  // category //
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          category,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              seeAll,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HappyShopCatogeryAll()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: catList.length < 10 ? catList.length : 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: new ClipRRect(
                                    borderRadius: BorderRadius.circular(25.0),
                                    child: new Image.asset(
                                      catList[index]['img'],
                                      height: 50.0,
                                      width: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Text(
                                    catList[index]['title'],
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  width: 50,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 1),
                                  pageBuilder: (_, __, ___) =>
                                      HappyShopStaggeredList()),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  // Most popular //
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: _getHeading("Most popular"),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GridView.count(
                        padding: EdgeInsets.only(top: 5),
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: 0.7,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(
                          4,
                          (index) {
                            return ItemCard(
                              tag: "${index}2",
                              imagurl: sectList[0]['productList'][index]['img'],
                              imagelisturl: sectList[0]['productList'][index]
                                  ['imglist'],
                              itemname: sectList[0]['productList'][index]
                                  ['name'],
                              descprice: sectList[0]['productList'][index]
                                  ['descprice'],
                              price: sectList[0]['productList'][index]['price'],
                              rating: sectList[0]['productList'][index]
                                  ['rating'],
                              shadow: false,
                              imageblururl: sectList[0]['productList'][index]
                                  ['blurUrl'],
                              localimg: sectList[0]['productList'][index]
                                  ['localimg'],
                            );
                          },
                        )),
                  ),

                  // New arrival for men's //
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: _getHeading("Top Brands"),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.width / 3.4,
                    child: ListView.builder(
                      itemCount: sectList[3]['productList'].length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.only(
                              left: index == 0 ? 15.0 : 5.0,
                              right: index == 9 ? 15.0 : 0.0),
                          elevation: 0.0,
                          child: InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.width / 3.5,
                              width: MediaQuery.of(context).size.width / 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: OctoImage(
                                      image: CachedNetworkImageProvider(
                                          sectList[3]['productList'][index]
                                              ['img']),
                                      placeholderBuilder:
                                          OctoPlaceholder.blurHash(
                                        sectList[3]['productList'][index]
                                            ['blurUrl'],
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      errorBuilder:
                                          OctoError.icon(color: textcolor),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      sectList[3]['productList'][index]['name'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: 'bold',
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(255, 255, 255, 1)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 1),
                                    pageBuilder: (_, __, ___) =>
                                        HappyShopStaggeredList()),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  // Women's Fashion //
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: _getHeading("Women's Fashion"),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: GridView.count(
                        padding: EdgeInsets.only(top: 5),
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        childAspectRatio: 0.7,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(
                          4,
                          (index) {
                            return ItemCard(
                              tag: "${index}1",
                              imagurl: sectList[2]['productList'][index]['img'],
                              imagelisturl: sectList[2]['productList'][index]
                                  ['imglist'],
                              itemname: sectList[2]['productList'][index]
                                  ['name'],
                              descprice: sectList[2]['productList'][index]
                                  ['descprice'],
                              price: sectList[2]['productList'][index]['price'],
                              rating: sectList[2]['productList'][index]
                                  ['rating'],
                              shadow: false,
                              imageblururl: sectList[2]['productList'][index]
                                  ['blurUrl'],
                              localimg: sectList[2]['productList'][index]
                                  ['localimg'],
                            );
                          },
                        )),
                  ),

                  // Collections //
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: _getHeading("Collections"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 2.5,
                    child: ListView.builder(
                      itemCount: sectList[1]['productList'].length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.only(
                              left: index == 0 ? 15.0 : 5.0,
                              right: index == 3 ? 15.0 : 0.0),
                          elevation: 0.0,
                          child: InkWell(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 2.8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: OctoImage(
                                  image: CachedNetworkImageProvider(
                                      sectList[1]['productList'][index]['img']),
                                  placeholderBuilder: OctoPlaceholder.blurHash(
                                    sectList[1]['productList'][index]
                                        ['blurUrl'],
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                  errorBuilder:
                                      OctoError.icon(color: textcolor),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HappyShopStaggeredList(),
                                ),
                              );
                              // Navigator.push(
                              //   context,
                              //   PageRouteBuilder(transitionDuration: Duration(seconds: 1), pageBuilder: (_, __, ___) => HappyShopStaggeredList()),
                              // );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: _getHeading("Top Brand Collection"),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 0.200,
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      children: listUrl
                          .map((data) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: StaggerdCard(
                                  imgurl: data['img'],
                                  itemname: data['name'],
                                  descprice: data['descprice'],
                                  price: data['price'],
                                  rating: data['rating'],
                                  imageblururl: data['blurUrl'],
                                  localimg: data['localimg'],
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _getHeading(
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title, style: Theme.of(context).textTheme.headline6),
              InkWell(
                child: Text(
                  seeAll,
                  style: Theme.of(context).textTheme.caption,
                ),
                splashColor: primary.withOpacity(0.2),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                        transitionDuration: Duration(seconds: 1),
                        pageBuilder: (_, __, ___) => HappyShopStaggeredList()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _animateSlider() {
    Future.delayed(Duration(seconds: 30)).then((_) {
      if (mounted) {
        int nextPage = _controller.hasClients
            ? _controller.page!.round() + 1
            : _controller.initialPage;

        if (nextPage == homeSliderList.length) {
          nextPage = 0;
        }
        if (_controller.hasClients) {
          _controller
              .animateToPage(nextPage,
                  duration: Duration(seconds: 1), curve: Curves.easeIn)
              .then((_) => _animateSlider());
        }
      }
    });
  }

  List<T?> map<T>(List homeSliderList, Function handler) {
    List<T?> result = [];
    for (var i = 0; i < homeSliderList.length; i++) {
      result.add(handler(i, homeSliderList[i]));
    }

    return result;
  }
}

class ItemCardSmall extends StatelessWidget {
  const ItemCardSmall({
    Key? key,
    this.imagurl,
    this.rating,
    this.itemname,
    this.descprice,
    this.price,
    this.shadow,
  }) : super(key: key);
  final String? imagurl, rating, itemname, descprice, price;
  final bool? shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: happyshopcolor5, blurRadius: 10)],
      ),
      child: Card(
        elevation: 0.0,
        child: InkWell(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: Image.asset(
                            imagurl!,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 10,
                              ),
                              Text(
                                rating!,
                                style: Theme.of(context)
                                    .textTheme
                                    .overline!
                                    .copyWith(letterSpacing: 0.2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    itemname!,
                    style: Theme.of(context).textTheme.overline!.copyWith(
                        color: Colors.black,
                        fontSize: 16.0,
                        letterSpacing: 0.5),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(CUR_CURRENCY + "" + descprice!,
                                style: Theme.of(context)
                                    .textTheme
                                    .overline!
                                    .copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        letterSpacing: 1),
                                textAlign: TextAlign.left),
                            Text(
                              CUR_CURRENCY + " " + price!,
                              style: TextStyle(color: primary),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 3),
                            child: Icon(
                              Icons.favorite,
                              size: 15,
                              color: primary,
                            ),
                          ),
                          onTap: () {})
                    ],
                  ),
                )
              ],
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  const ItemCard({
    Key? key,
    this.imagurl,
    this.rating,
    this.itemname,
    this.descprice,
    this.price,
    this.shadow,
    this.tag,
    this.imagelisturl,
    this.imageblururl,
    this.localimg,
  }) : super(key: key);

  final String? imagurl,
      rating,
      itemname,
      descprice,
      price,
      tag,
      imageblururl,
      localimg;
  final bool? shadow;
  final List? imagelisturl;

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 100,
      decoration: widget.shadow!
          ? BoxDecoration(
              boxShadow: [BoxShadow(color: happyshopcolor5, blurRadius: 10)],
            )
          : null,
      child: Card(
        elevation: 0.2,
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      child: OctoImage(
                        image: CachedNetworkImageProvider(widget.imagurl!),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          widget.imageblururl!,
                        ),
                        width: double.infinity,
                        errorBuilder: OctoError.icon(color: textcolor),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 10,
                            ),
                            Text(
                              widget.rating!,
                              style: Theme.of(context)
                                  .textTheme
                                  .overline!
                                  .copyWith(letterSpacing: 0.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 60,
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        widget.itemname!,
                        style: Theme.of(context).textTheme.overline!.copyWith(
                            color: Colors.black,
                            fontSize: 16.0,
                            letterSpacing: 0.5),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, bottom: 5),
                child: Row(
                  children: <Widget>[
                    Text(" " + CUR_CURRENCY + " " + widget.price!,
                        style: TextStyle(color: primary)),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      CUR_CURRENCY + "" + widget.descprice!,
                      style: Theme.of(context).textTheme.overline!.copyWith(
                          decoration: TextDecoration.lineThrough,
                          letterSpacing: 1),
                    ),
                  ],
                ),
              )
            ],
          ),
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 1000),
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return HappyShopProductDetail(
                    imagelisturl: widget.imagelisturl,
                    imgurl: widget.imagurl,
                    tag: widget.tag,
                    localimg: widget.localimg,
                  );
                },
                reverseTransitionDuration: Duration(milliseconds: 800),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      CarouselSlider(
        items: child,
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: false,
          viewportFraction: 1.0,
          aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: homeSliderList
            .map((item) => Container(
                  width: _current == homeSliderList.indexOf(item) ? 30.0 : 10.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: _current == homeSliderList.indexOf(item)
                          ? primary
                          : Color.fromRGBO(0, 0, 0, 0.1)),
                ))
            .toList(),
      )
    ]);
  }
}

final List<Widget> child = homeSliderList.map((item) {
  return Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(children: <Widget>[
        OctoImage(
          image: CachedNetworkImageProvider(
              /*homeSliderList[item]['img']*/ item['img']),
          placeholderBuilder: OctoPlaceholder.blurHash(
            item['blurUrl'],
          ),
          width: double.infinity,
          height: double.infinity,
          errorBuilder: OctoError.icon(color: textcolor),
          fit: BoxFit.fill,
        ),
      ]),
    ),
  );
}
    /*},*/
    ).toList();

List homeSliderList = [
  {
    'localimg': "assets/images/fullApps/happyshop/slider_a.jpg",
    "img":
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fslider_a.jpg?alt=media&token=e5430cde-1986-462b-abde-1749a7ee31a9",
    'blurUrl': "LRRA_.yA~RtQIXba%Joe-jjGI[Rk",
  },
  {
    'localimg': "assets/images/fullApps/happyshop/slider_b.jpg",
    "img":
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fslider_b.jpg?alt=media&token=96218446-8221-46c8-abd7-5962beca27aa",
    'blurUrl': "LhL4yx%2x^WV~pkCWCWBR:WVRPof",
  },
  {
    'localimg': "assets/images/fullApps/happyshop/slider_c.jpg",
    "img":
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fslider_c.jpg?alt=media&token=57cd4e83-942f-4a1a-bb94-bfdc3029e4e0",
    'blurUrl': "LSP|amkC\$esmxs\$zWCRk};R-OEt5",
  },
  {
    'localimg': "assets/images/fullApps/happyshop/slider_d.jpg",
    "img":
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fslider_d.jpg?alt=media&token=2df93016-5c38-4bd8-9446-69e16913445b",
    'blurUrl': "LOExC19~I@}:R*R*S4R+0h-5\$#I@",
  },
  {
    'localimg': "assets/images/fullApps/happyshop/slider_e.jpg",
    "img":
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fslider_e.jpg?alt=media&token=cd3334f8-37d0-44ba-83df-32868ed87b6f",
    'blurUrl': "LJGa]u}#%h4=035bMw^j~8wF%MD*",
  },
  {
    'localimg': "assets/images/fullApps/happyshop/slider_f.jpg",
    "img":
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fslider_f.jpg?alt=media&token=f9c2d4e5-344e-4f9c-88e2-c47570848b1d",
    'blurUrl': "LKG7#b0N}@%L-UIpSPV@9uEMNbv}",
  },
  {
    'localimg': "assets/images/fullApps/happyshop/slider_g.jpg",
    "img":
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/happyshop%2Fslider_g.jpg?alt=media&token=861f4417-9058-4c26-8f58-41dbc68eda5a",
    'blurUrl': "LnP62W~Vo}IoS%xCR,jbs:WBs,W?",
  },
  /*"assets/images/fullApps/happyshop/slider_a.png",
  "assets/images/fullApps/happyshop/slider_b.png",
  "assets/images/fullApps/happyshop/slider_c.png",
  "assets/images/fullApps/happyshop/slider_d.png",
  "assets/images/fullApps/happyshop/slider_e.png",
  "assets/images/fullApps/happyshop/slider_f.png",
  "assets/images/fullApps/happyshop/slider_g.png",*/
];
