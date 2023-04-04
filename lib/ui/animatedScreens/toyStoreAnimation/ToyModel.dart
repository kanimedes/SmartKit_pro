class ToyModel {
  String? title, image, blurUrl, localimg, type, price;
  int? id;

  ToyModel(
      {this.title,
      this.image,
      this.type,
      this.price,
      this.id,
      this.blurUrl,
      this.localimg});
}

List<ToyModel> toylist = [
  ToyModel(
    id: 1,
    title: "Event",
    type: "Dash",
    price: "\$50",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/bear_1.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fbear_1.png?alt=media&token=2c878e7c-6c5c-4c31-9002-7fd48570e1bc",
    blurUrl: "LBE|heS[8hTC.RRVV@VznWxam]sq",
  ),
  ToyModel(
    id: 2,
    title: "Twitter",
    type: "Dash",
    price: "\$10",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/bear_2.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fbear_2.png?alt=media&token=74757e25-1d93-44d5-b8c2-e0a81c1adddc",
    blurUrl: "LGE:x9bpudXL?aRnRjj1WGs;a8s:",
  ),
  ToyModel(
    id: 3,
    title: "Musical",
    type: "Dash",
    price: "\$30",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/bear_3.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fbear_3.png?alt=media&token=2b038c2c-d526-43be-a78a-41d3062d81ba",
    blurUrl: "LJH1[GbWGtf|}sV_\$*ahD,sqresp",
  ),
  ToyModel(
    id: 4,
    title: "Party",
    type: "Dash",
    price: "\$50",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/bear_4.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fbear_4.png?alt=media&token=402f5c34-f42f-4b0c-9d27-0922d0201629",
    blurUrl: "LaGSWYr=nLT0YRS5vzjFQ+bwj]nN",
  ),
  ToyModel(
    id: 5,
    title: "Unique",
    type: "Dash",
    price: "\$60",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/bear_5.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fbear_5.png?alt=media&token=a8cabdfa-5189-4d55-9e66-6d6d3cb15d8f",
    blurUrl: "LiL4W:bb0zo~ysW=RQj[E+s.r=i^",
  ),
  ToyModel(
    id: 6,
    title: "Bird",
    type: "Dash",
    price: "\$20",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_1.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_1.png?alt=media&token=9e36ff28-aa2f-4596-a7b6-53a8cbe0c74a",
    blurUrl: "LGG9gNTyTwXUKOp0?dR*xtr@H[ng",
  ),
  ToyModel(
    id: 7,
    title: "Angel",
    type: "Dash",
    price: "70",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_2.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_2.png?alt=media&token=3c852eb3-227d-4f8a-b0ab-a47845cd6409",
    blurUrl: "LFGSovGHO@_N?w%#MKM_EN=|wI0",
  ),
  ToyModel(
    id: 8,
    title: "Twitter",
    type: "Dash",
    price: "\$80",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_3.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_3.png?alt=media&token=7ff6c1bd-fb96-4994-8b5d-42fd2a578865",
    blurUrl: "LGIr{J.T0hL2O@o}+vt,01Ip+],B",
  ),
  ToyModel(
    id: 9,
    title: "Musical",
    type: "Dash",
    price: "\$90",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_4.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_5.png?alt=media&token=105aed76-8663-4dfe-ac1d-55d171c84a79",
    blurUrl: "LSNIzOxv0hnP}doLR5Sg0dR*pGWS",
  ),
  ToyModel(
    id: 10,
    title: "Roger",
    type: "Dash",
    price: "\$100",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_5.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_5.png?alt=media&token=105aed76-8663-4dfe-ac1d-55d171c84a79",
    blurUrl: "LUNH?HnPJZtl{ZkDX2WA1#t7KERP",
  ),
  ToyModel(
    id: 11,
    title: "Rabbit",
    type: "Dash",
    price: "\$110",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_6.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_6.png?alt=media&token=db2931fb-08ff-40f8-8a46-e57645c9567a",
    blurUrl: "LVHf|*baLMS~?^aKRPbvDij]vMo0",
  ),
  ToyModel(
    id: 12,
    title: "Thumper",
    type: "Dash",
    price: "\$20",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_7.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_7.png?alt=media&token=bd98d20c-8c72-459a-9f4b-2d9006997a01",
    blurUrl: "LXMPCbbuGIXR}KofRRnS4=r^XcjG",
  ),
  ToyModel(
    id: 13,
    title: "Oswald",
    type: "Dash",
    price: "\$120",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_8.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_8.png?alt=media&token=7b71cd94-6a8c-4778-a730-6e4d37428acb",
    blurUrl: "LAM?_H%#00M#@WX7x2sr00Vs.l\$S",
  ),
  ToyModel(
    id: 14,
    title: "Clover",
    type: "Dash",
    price: "\$130",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_9.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_9.png?alt=media&token=6c324348-6333-465f-935e-e36dc2e5fae3",
    blurUrl: "LBKe4k\$-00xc{E\$S?JkE8xVsShoy",
  ),
  ToyModel(
    id: 15,
    title: "Thumper",
    type: "Dash",
    price: "\$140",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_10.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_10.png?alt=media&token=451b20a2-a4fe-4974-835b-b9bcb21c6452",
    blurUrl: "LDPh2lkt2{kY#bs?KnoM5EnPE4aI",
  ),
  ToyModel(
    id: 16,
    title: "Monster",
    type: "Dash",
    price: "\$150",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_11.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_11.png?alt=media&token=ea8dd437-8a97-40f7-a570-015e3f954ba8",
    blurUrl: "LUM?6\$ozD*og}XbbE3a#01n~pxaf",
  ),
  ToyModel(
    id: 17,
    title: "Jerk",
    type: "Dash",
    price: "\$160",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_1.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_1.png?alt=media&token=ced0b622-35c3-447f-b2da-b7b105706625",
    blurUrl: "LWLzdSofC+og?wbbIpa#9Gj@vMjZ",
  ),
  ToyModel(
    id: 18,
    title: "Bird",
    type: "Dash",
    price: "\$170",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_2.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_2.png?alt=media&token=ecb62d26-0273-46c4-9e36-9e7e80b4dd3b",
    blurUrl: "LSJ7]y%1yXJE~VxFJWEkH?ofV^RP",
  ),
  ToyModel(
    id: 19,
    title: "Rabit",
    type: "Dash",
    price: "\$180",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_3.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_3.png?alt=media&token=12e1e150-7a4c-4502-ae97-4385927af031",
    blurUrl: "LDJ@d--V%~M~~qozKQR.00kCtmNa",
  ),
];
List<ToyModel> toylist1 = [
  ToyModel(
    id: 20,
    title: "Party",
    type: "Dash",
    price: "\$50",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/bear_4.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fbear_4.png?alt=media&token=402f5c34-f42f-4b0c-9d27-0922d0201629",
    blurUrl: "LaGSWYr=nLT0YRS5vzjFQ+bwj]nN",
  ),
  ToyModel(
    id: 21,
    title: "Unique",
    type: "Dash",
    price: "\$60",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/bear_5.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fbear_5.png?alt=media&token=a8cabdfa-5189-4d55-9e66-6d6d3cb15d8f",
    blurUrl: "LiL4W:bb0zo~ysW=RQj[E+s.r=i^",
  ),
  ToyModel(
    id: 22,
    title: "Bird",
    type: "Dash",
    price: "\$20",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_1.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_1.png?alt=media&token=9e36ff28-aa2f-4596-a7b6-53a8cbe0c74a",
    blurUrl: "LGG9gNTyTwXUKOp0?dR*xtr@H[ng",
  ),
  ToyModel(
    id: 23,
    title: "Angel",
    type: "Dash",
    price: "70",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_2.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_2.png?alt=media&token=3c852eb3-227d-4f8a-b0ab-a47845cd6409",
    blurUrl: "LFGSovGHO@_N?w%#MKM_EN=|wI0",
  ),
  ToyModel(
    id: 8,
    title: "Twitter",
    type: "Dash",
    price: "\$80",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_3.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_3.png?alt=media&token=7ff6c1bd-fb96-4994-8b5d-42fd2a578865",
    blurUrl: "LGIr{J.T0hL2O@o}+vt,01Ip+],B",
  ),
  ToyModel(
    id: 24,
    title: "Musical",
    type: "Dash",
    price: "\$90",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_4.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_5.png?alt=media&token=105aed76-8663-4dfe-ac1d-55d171c84a79",
    blurUrl: "LSNIzOxv0hnP}doLR5Sg0dR*pGWS",
  ),
  ToyModel(
    id: 25,
    title: "Roger",
    type: "Dash",
    price: "\$100",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_5.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_5.png?alt=media&token=105aed76-8663-4dfe-ac1d-55d171c84a79",
    blurUrl: "LUNH?HnPJZtl{ZkDX2WA1#t7KERP",
  ),
  ToyModel(
    id: 26,
    title: "Rabbit",
    type: "Dash",
    price: "\$110",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_6.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_6.png?alt=media&token=db2931fb-08ff-40f8-8a46-e57645c9567a",
    blurUrl: "LVHf|*baLMS~?^aKRPbvDij]vMo0",
  ),
  ToyModel(
    id: 27,
    title: "Thumper",
    type: "Dash",
    price: "\$20",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_7.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_7.png?alt=media&token=bd98d20c-8c72-459a-9f4b-2d9006997a01",
    blurUrl: "LXMPCbbuGIXR}KofRRnS4=r^XcjG",
  ),
  ToyModel(
    id: 28,
    title: "Oswald",
    type: "Dash",
    price: "\$120",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_8.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_8.png?alt=media&token=7b71cd94-6a8c-4778-a730-6e4d37428acb",
    blurUrl: "LAM?_H%#00M#@WX7x2sr00Vs.l\$S",
  ),
  ToyModel(
    id: 29,
    title: "Clover",
    type: "Dash",
    price: "\$130",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_9.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_9.png?alt=media&token=6c324348-6333-465f-935e-e36dc2e5fae3",
    blurUrl: "LBKe4k\$-00xc{E\$S?JkE8xVsShoy",
  ),
  ToyModel(
    id: 30,
    title: "Thumper",
    type: "Dash",
    price: "\$140",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_10.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_10.png?alt=media&token=451b20a2-a4fe-4974-835b-b9bcb21c6452",
    blurUrl: "LDPh2lkt2{kY#bs?KnoM5EnPE4aI",
  ),
  ToyModel(
    id: 31,
    title: "Monster",
    type: "Dash",
    price: "\$150",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_11.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_11.png?alt=media&token=ea8dd437-8a97-40f7-a570-015e3f954ba8",
    blurUrl: "LUM?6\$ozD*og}XbbE3a#01n~pxaf",
  ),
  ToyModel(
    id: 32,
    title: "Jerk",
    type: "Dash",
    price: "\$160",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_1.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_1.png?alt=media&token=ced0b622-35c3-447f-b2da-b7b105706625",
    blurUrl: "LWLzdSofC+og?wbbIpa#9Gj@vMjZ",
  ),
  ToyModel(
    id: 33,
    title: "Bird",
    type: "Dash",
    price: "\$170",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_2.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_2.png?alt=media&token=ecb62d26-0273-46c4-9e36-9e7e80b4dd3b",
    blurUrl: "LSJ7]y%1yXJE~VxFJWEkH?ofV^RP",
  ),
  ToyModel(
    id: 34,
    title: "Rabit",
    type: "Dash",
    price: "\$180",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_3.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_3.png?alt=media&token=12e1e150-7a4c-4502-ae97-4385927af031",
    blurUrl: "LDJ@d--V%~M~~qozKQR.00kCtmNa",
  ),
];
List<ToyModel> toylist2 = [
  ToyModel(
    id: 35,
    title: "Angel",
    type: "Dash",
    price: "70",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_2.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_2.png?alt=media&token=3c852eb3-227d-4f8a-b0ab-a47845cd6409",
    blurUrl: "LFGSovGHO@_N?w%#MKM_EN=|wI0",
  ),
  ToyModel(
    id: 36,
    title: "Twitter",
    type: "Dash",
    price: "\$80",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_3.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_3.png?alt=media&token=7ff6c1bd-fb96-4994-8b5d-42fd2a578865",
    blurUrl: "LGIr{J.T0hL2O@o}+vt,01Ip+],B",
  ),
  ToyModel(
    id: 37,
    title: "Musical",
    type: "Dash",
    price: "\$90",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_4.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_5.png?alt=media&token=105aed76-8663-4dfe-ac1d-55d171c84a79",
    blurUrl: "LSNIzOxv0hnP}doLR5Sg0dR*pGWS",
  ),
  ToyModel(
    id: 38,
    title: "Roger",
    type: "Dash",
    price: "\$100",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_5.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_5.png?alt=media&token=105aed76-8663-4dfe-ac1d-55d171c84a79",
    blurUrl: "LUNH?HnPJZtl{ZkDX2WA1#t7KERP",
  ),
  ToyModel(
    id: 39,
    title: "Rabbit",
    type: "Dash",
    price: "\$110",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_6.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_6.png?alt=media&token=db2931fb-08ff-40f8-8a46-e57645c9567a",
    blurUrl: "LVHf|*baLMS~?^aKRPbvDij]vMo0",
  ),
  ToyModel(
    id: 40,
    title: "Thumper",
    type: "Dash",
    price: "\$20",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_7.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_7.png?alt=media&token=bd98d20c-8c72-459a-9f4b-2d9006997a01",
    blurUrl: "LXMPCbbuGIXR}KofRRnS4=r^XcjG",
  ),
  ToyModel(
    id: 41,
    title: "Oswald",
    type: "Dash",
    price: "\$120",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_8.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_8.png?alt=media&token=7b71cd94-6a8c-4778-a730-6e4d37428acb",
    blurUrl: "LAM?_H%#00M#@WX7x2sr00Vs.l\$S",
  ),
  ToyModel(
    id: 42,
    title: "Clover",
    type: "Dash",
    price: "\$130",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_9.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_9.png?alt=media&token=6c324348-6333-465f-935e-e36dc2e5fae3",
    blurUrl: "LBKe4k\$-00xc{E\$S?JkE8xVsShoy",
  ),
  ToyModel(
    id: 43,
    title: "Thumper",
    type: "Dash",
    price: "\$140",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_10.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_10.png?alt=media&token=451b20a2-a4fe-4974-835b-b9bcb21c6452",
    blurUrl: "LDPh2lkt2{kY#bs?KnoM5EnPE4aI",
  ),
  ToyModel(
    id: 44,
    title: "Monster",
    type: "Dash",
    price: "\$150",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_11.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_11.png?alt=media&token=ea8dd437-8a97-40f7-a570-015e3f954ba8",
    blurUrl: "LUM?6\$ozD*og}XbbE3a#01n~pxaf",
  ),
  ToyModel(
    id: 45,
    title: "Jerk",
    type: "Dash",
    price: "\$160",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_1.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_1.png?alt=media&token=ced0b622-35c3-447f-b2da-b7b105706625",
    blurUrl: "LWLzdSofC+og?wbbIpa#9Gj@vMjZ",
  ),
  ToyModel(
    id: 46,
    title: "Bird",
    type: "Dash",
    price: "\$170",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_2.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_2.png?alt=media&token=ecb62d26-0273-46c4-9e36-9e7e80b4dd3b",
    blurUrl: "LSJ7]y%1yXJE~VxFJWEkH?ofV^RP",
  ),
  ToyModel(
    id: 47,
    title: "Rabit",
    type: "Dash",
    price: "\$180",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_3.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_3.png?alt=media&token=12e1e150-7a4c-4502-ae97-4385927af031",
    blurUrl: "LDJ@d--V%~M~~qozKQR.00kCtmNa",
  ),
];
List<ToyModel> toylist3 = [
  ToyModel(
    id: 48,
    title: "Thumper",
    type: "Dash",
    price: "\$20",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_7.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_7.png?alt=media&token=bd98d20c-8c72-459a-9f4b-2d9006997a01",
    blurUrl: "LXMPCbbuGIXR}KofRRnS4=r^XcjG",
  ),
  ToyModel(
    id: 49,
    title: "Oswald",
    type: "Dash",
    price: "\$120",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_8.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_8.png?alt=media&token=7b71cd94-6a8c-4778-a730-6e4d37428acb",
    blurUrl: "LAM?_H%#00M#@WX7x2sr00Vs.l\$S",
  ),
  ToyModel(
    id: 50,
    title: "Clover",
    type: "Dash",
    price: "\$130",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_9.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_9.png?alt=media&token=6c324348-6333-465f-935e-e36dc2e5fae3",
    blurUrl: "LBKe4k\$-00xc{E\$S?JkE8xVsShoy",
  ),
  ToyModel(
    id: 51,
    title: "Thumper",
    type: "Dash",
    price: "\$140",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_10.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_10.png?alt=media&token=451b20a2-a4fe-4974-835b-b9bcb21c6452",
    blurUrl: "LDPh2lkt2{kY#bs?KnoM5EnPE4aI",
  ),
  ToyModel(
    id: 52,
    title: "Monster",
    type: "Dash",
    price: "\$150",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_11.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_11.png?alt=media&token=ea8dd437-8a97-40f7-a570-015e3f954ba8",
    blurUrl: "LUM?6\$ozD*og}XbbE3a#01n~pxaf",
  ),
  ToyModel(
    id: 53,
    title: "Jerk",
    type: "Dash",
    price: "\$160",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_1.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_1.png?alt=media&token=ced0b622-35c3-447f-b2da-b7b105706625",
    blurUrl: "LWLzdSofC+og?wbbIpa#9Gj@vMjZ",
  ),
  ToyModel(
    id: 54,
    title: "Bird",
    type: "Dash",
    price: "\$170",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_2.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_2.png?alt=media&token=ecb62d26-0273-46c4-9e36-9e7e80b4dd3b",
    blurUrl: "LSJ7]y%1yXJE~VxFJWEkH?ofV^RP",
  ),
  ToyModel(
    id: 55,
    title: "Rabit",
    type: "Dash",
    price: "\$180",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_3.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_3.png?alt=media&token=12e1e150-7a4c-4502-ae97-4385927af031",
    blurUrl: "LDJ@d--V%~M~~qozKQR.00kCtmNa",
  ),
  ToyModel(
    id: 56,
    title: "Angel",
    type: "Dash",
    price: "70",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_2.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_2.png?alt=media&token=3c852eb3-227d-4f8a-b0ab-a47845cd6409",
    blurUrl: "LFGSovGHO@_N?w%#MKM_EN=|wI0",
  ),
  ToyModel(
    id: 57,
    title: "Twitter",
    type: "Dash",
    price: "\$80",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_3.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_3.png?alt=media&token=7ff6c1bd-fb96-4994-8b5d-42fd2a578865",
    blurUrl: "LGIr{J.T0hL2O@o}+vt,01Ip+],B",
  ),
  ToyModel(
    id: 58,
    title: "Musical",
    type: "Dash",
    price: "\$90",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_4.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_5.png?alt=media&token=105aed76-8663-4dfe-ac1d-55d171c84a79",
    blurUrl: "LSNIzOxv0hnP}doLR5Sg0dR*pGWS",
  ),
  ToyModel(
    id: 59,
    title: "Roger",
    type: "Dash",
    price: "\$100",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_5.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_5.png?alt=media&token=105aed76-8663-4dfe-ac1d-55d171c84a79",
    blurUrl: "LUNH?HnPJZtl{ZkDX2WA1#t7KERP",
  ),
  ToyModel(
    id: 60,
    title: "Rabbit",
    type: "Dash",
    price: "\$110",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_6.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_6.png?alt=media&token=db2931fb-08ff-40f8-8a46-e57645c9567a",
    blurUrl: "LVHf|*baLMS~?^aKRPbvDij]vMo0",
  ),
];
List<ToyModel> toylist4 = [
  ToyModel(
    id: 61,
    title: "Clover",
    type: "Dash",
    price: "\$130",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_9.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_9.png?alt=media&token=6c324348-6333-465f-935e-e36dc2e5fae3",
    blurUrl: "LBKe4k\$-00xc{E\$S?JkE8xVsShoy",
  ),
  ToyModel(
    id: 62,
    title: "Thumper",
    type: "Dash",
    price: "\$140",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_10.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_10.png?alt=media&token=451b20a2-a4fe-4974-835b-b9bcb21c6452",
    blurUrl: "LDPh2lkt2{kY#bs?KnoM5EnPE4aI",
  ),
  ToyModel(
    id: 63,
    title: "Thumper",
    type: "Dash",
    price: "\$20",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_7.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_7.png?alt=media&token=bd98d20c-8c72-459a-9f4b-2d9006997a01",
    blurUrl: "LXMPCbbuGIXR}KofRRnS4=r^XcjG",
  ),
  ToyModel(
    id: 64,
    title: "Oswald",
    type: "Dash",
    price: "\$120",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_8.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_8.png?alt=media&token=7b71cd94-6a8c-4778-a730-6e4d37428acb",
    blurUrl: "LAM?_H%#00M#@WX7x2sr00Vs.l\$S",
  ),
  ToyModel(
    id: 65,
    title: "Monster",
    type: "Dash",
    price: "\$150",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_11.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_11.png?alt=media&token=ea8dd437-8a97-40f7-a570-015e3f954ba8",
    blurUrl: "LUM?6\$ozD*og}XbbE3a#01n~pxaf",
  ),
  ToyModel(
    id: 66,
    title: "Jerk",
    type: "Dash",
    price: "\$160",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_1.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_1.png?alt=media&token=ced0b622-35c3-447f-b2da-b7b105706625",
    blurUrl: "LWLzdSofC+og?wbbIpa#9Gj@vMjZ",
  ),
  ToyModel(
    id: 67,
    title: "Bird",
    type: "Dash",
    price: "\$170",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_2.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_2.png?alt=media&token=ecb62d26-0273-46c4-9e36-9e7e80b4dd3b",
    blurUrl: "LSJ7]y%1yXJE~VxFJWEkH?ofV^RP",
  ),
  ToyModel(
    id: 68,
    title: "Rabit",
    type: "Dash",
    price: "\$180",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/rabit_3.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Frabit_3.png?alt=media&token=12e1e150-7a4c-4502-ae97-4385927af031",
    blurUrl: "LDJ@d--V%~M~~qozKQR.00kCtmNa",
  ),
  ToyModel(
    id: 69,
    title: "Angel",
    type: "Dash",
    price: "70",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_2.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_2.png?alt=media&token=3c852eb3-227d-4f8a-b0ab-a47845cd6409",
    blurUrl: "LFGSovGHO@_N?w%#MKM_EN=|wI0",
  ),
  ToyModel(
    id: 70,
    title: "Twitter",
    type: "Dash",
    price: "\$80",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_3.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_3.png?alt=media&token=7ff6c1bd-fb96-4994-8b5d-42fd2a578865",
    blurUrl: "LGIr{J.T0hL2O@o}+vt,01Ip+],B",
  ),
  ToyModel(
    id: 71,
    title: "Musical",
    type: "Dash",
    price: "\$90",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_4.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_5.png?alt=media&token=105aed76-8663-4dfe-ac1d-55d171c84a79",
    blurUrl: "LSNIzOxv0hnP}doLR5Sg0dR*pGWS",
  ),
  ToyModel(
    id: 72,
    title: "Roger",
    type: "Dash",
    price: "\$100",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_5.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_5.png?alt=media&token=105aed76-8663-4dfe-ac1d-55d171c84a79",
    blurUrl: "LUNH?HnPJZtl{ZkDX2WA1#t7KERP",
  ),
  ToyModel(
    id: 73,
    title: "Rabbit",
    type: "Dash",
    price: "\$110",
    localimg: "assets/images/animatedScreens/toyStoreAnimation/cat_6.png",
    image:
        "https://firebasestorage.googleapis.com/v0/b/smartkit-8e62c.appspot.com/o/toystore%2Fcat_6.png?alt=media&token=db2931fb-08ff-40f8-8a46-e57645c9567a",
    blurUrl: "LVHf|*baLMS~?^aKRPbvDij]vMo0",
  ),
];

class ToyItem {
  int qty;
  final ToyModel? item;

  ToyItem({this.qty = 1, this.item});

  void increment() {
    qty++;
  }
}
