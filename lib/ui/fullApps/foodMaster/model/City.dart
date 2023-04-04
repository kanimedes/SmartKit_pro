class City {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? alias;
  String? image;
  String? headerTitle;
  String? headerSubtitle;
  String? deletedAt;
  String? logo;

  City(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.name,
      this.alias,
      this.image,
      this.headerTitle,
      this.headerSubtitle,
      this.deletedAt,
      this.logo});
}

List<City> citylist = [
  City(
      id: 1,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Brooklyn",
      alias: "br",
      image: "assets/images/fullApps/foodMaster/City_1.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>Brooklyn</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_1.jpg"),
  City(
      id: 2,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Queens",
      alias: "qe",
      image: "assets/images/fullApps/foodMaster/City_2.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>Queens</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_2.jpg"),
  City(
      id: 3,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Manhattn",
      alias: "mh",
      image: "assets/images/fullApps/foodMaster/City_3.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>Manhattn</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_3.jpg"),
  City(
      id: 4,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Richmond",
      alias: "ri",
      image: "assets/images/fullApps/foodMaster/City_4.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>Richmond</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_4.jpg"),
  City(
      id: 5,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Buffalo",
      alias: "bf",
      image: "assets/images/fullApps/foodMaster/City_5.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>Buffalo</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_5.jpg"),
  City(
      id: 6,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Rochester",
      alias: "rh",
      image: "assets/images/fullApps/foodMaster/City_6.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>Rochester</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_6.jpg"),
  City(
      id: 7,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Yonkers",
      alias: "yo",
      image: "assets/images/fullApps/foodMaster/City_7.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>Yonkers</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_7.jpg"),
  City(
      id: 8,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Syracuse",
      alias: "sy",
      image: "assets/images/fullApps/foodMaster/City_8.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>Syracuse</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_8.jpg"),
  City(
      id: 9,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Albany",
      alias: "al",
      image: "assets/images/fullApps/foodMaster/City_9.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>Albany</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_9.jpg"),
  City(
      id: 10,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "New Rochelle",
      alias: "nr",
      image: "assets/images/fullApps/foodMaster/City_10.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>New Rochelle</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_10.jpg"),
  City(
      id: 11,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Mount Vernon",
      alias: "mv",
      image: "assets/images/fullApps/foodMaster/City_11.jpg",
      headerTitle:
          "Food Delivery from<br /><strong> Mount Vernon</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_11.jpg"),
  City(
      id: 12,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Schenectady",
      alias: " sc",
      image: "assets/images/fullApps/foodMaster/City_12.jpg",
      headerTitle:
          "Food Delivery from<br /><strong> Schenectady</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_12.jpg"),
  City(
      id: 13,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Utica",
      alias: "ut",
      image: "assets/images/fullApps/foodMaster/City_13.jpg",
      headerTitle:
          "Food Delivery from<br /><strong> Utica</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_13.jpg"),
  City(
      id: 14,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: " White Plains",
      alias: " wp",
      image: "assets/images/fullApps/foodMaster/City_14.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>  White Plains</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_14.jpg"),
  City(
      id: 15,
      createdAt: "2021-02-18T10:09:05.000000Z",
      updatedAt: "2021-02-18T10:09:05.000000Z",
      name: "Niagara Falls",
      alias: " nf",
      image: "assets/images/fullApps/foodMaster/City_15.jpg",
      headerTitle:
          "Food Delivery from<br /><strong>  Niagara Falls</strong>\u2019s Best Restaurants",
      headerSubtitle: "The meals you love, delivered with care",
      deletedAt: null,
      logo: "assets/images/fullApps/foodMaster/City_15.jpg"),
];
