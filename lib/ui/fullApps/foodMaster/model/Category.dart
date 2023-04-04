class Category {
  String? id;
  String? name;
  String? restorantid;
  String? createdat;
  String? updatedat;
  String? orderindex;
  String? active;
  Category({
    this.id,
    this.name,
    this.restorantid,
    this.createdat,
    this.updatedat,
    this.orderindex,
    this.active,
  });
}

List<Category> categorylist = [
  Category(
      id: "1",
      name: "Salads",
      restorantid: "1",
      createdat: "2021-02-18T10:09:05.000000Z",
      updatedat: "2021-02-18T10:09:05.000000Z",
      orderindex: "0",
      active: "1"),
  Category(
      id: "2",
      name: "Pizza",
      restorantid: "2",
      createdat: "2021-02-18T10:09:05.000000Z",
      updatedat: "2021-02-18T10:09:05.000000Z",
      orderindex: "0",
      active: "1"),
  Category(
      id: "3",
      name: "Fresh Pasta and Risotto",
      restorantid: "3",
      createdat: "2021-02-18T10:09:05.000000Z",
      updatedat: "2021-02-18T10:09:05.000000Z",
      orderindex: "0",
      active: "1"),
  Category(
      id: "4",
      name: "Lasagna",
      restorantid: "4",
      createdat: "2021-02-18T10:09:05.000000Z",
      updatedat: "2021-02-18T10:09:05.000000Z",
      orderindex: "0",
      active: "1"),
];
