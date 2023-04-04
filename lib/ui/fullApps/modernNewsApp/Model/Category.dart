//category model fetch category data from server side
class Category {
  String? id, image, categoryName, categoryId;
  List<SubCategory>? subData;
  bool? status;

  Category(
      {this.id,
      this.image,
      this.categoryName,
      this.categoryId,
      this.subData,
      this.status});
}

List<Category> catList = [
  Category(
      id: "1",
      image: "assets/images/fullApps/modernNews/topNewsCategories.png",
      categoryName: "Top News",
      categoryId: "1",
      subData: [
        SubCategory(
            id: "0",
            image: "assets/images/fullApps/modernNews/topNewsCategories.png",
            categoryId: "1",
            subCatName: "All Top 10"),
        SubCategory(
            id: "4",
            image: "assets/images/fullApps/modernNews/topNewsCategories.png",
            categoryId: "1",
            subCatName: "Top 10"),
      ],
      status: false),
  Category(
      id: "2",
      image: "assets/images/fullApps/modernNews/travelsCategories.png",
      categoryName: "Travels",
      categoryId: "2",
      subData: [],
      status: false),
  Category(
      id: "3",
      image: "assets/images/fullApps/modernNews/sportsCategories.png",
      categoryName: "Sports",
      categoryId: "3",
      subData: [
        SubCategory(
            id: "0",
            image: "assets/images/fullApps/modernNews/sportsCategories.png",
            categoryId: "3",
            subCatName: "All Sports"),
        SubCategory(
            id: "5",
            image: "assets/images/fullApps/modernNews/sportsCategories.png",
            categoryId: "3",
            subCatName: "BasketBall"),
        SubCategory(
            id: "6",
            image: "assets/images/fullApps/modernNews/sportsCategories.png",
            categoryId: "3",
            subCatName: "FootBall"),
        SubCategory(
            id: "7",
            image: "assets/images/fullApps/modernNews/sportsCategories.png",
            categoryId: "3",
            subCatName: "Cricket"),
      ],
      status: false),
  Category(
      id: "4",
      image: "assets/images/fullApps/modernNews/healthCategories.png",
      categoryName: "Health",
      categoryId: "4",
      subData: [
        SubCategory(
          id: "0",
          image: "assets/images/fullApps/modernNews/healthCategories.png",
          categoryId: "4",
          subCatName: "All Health",
        ),
        SubCategory(
          id: "1",
          image: "assets/images/fullApps/modernNews/healthCategories.png",
          categoryId: "4",
          subCatName: "Corona",
        ),
      ],
      status: false),
  Category(
      id: "5",
      image: "assets/images/fullApps/modernNews/entertainmentCategories.png",
      categoryName: "Entertainment",
      categoryId: "5",
      subData: [
        SubCategory(
          id: "0",
          image:
              "assets/images/fullApps/modernNews/entertainmentCategories.png",
          categoryId: "5",
          subCatName: "All Entertainment",
        ),
        SubCategory(
          id: "2",
          image:
              "assets/images/fullApps/modernNews/entertainmentCategories.png",
          categoryId: "5",
          subCatName: "Hollywood",
        ),
        SubCategory(
          id: "3",
          image:
              "assets/images/fullApps/modernNews/entertainmentCategories.png",
          categoryId: "5",
          subCatName: "Bollywood",
        ),
      ],
      status: false),
  Category(
      id: "6",
      image: "assets/images/fullApps/modernNews/worldCategories.png",
      categoryName: "World",
      categoryId: "6",
      subData: [],
      status: false),
];

class SubCategory {
  String? id, image, categoryId, subCatName;

  SubCategory({this.id, this.image, this.categoryId, this.subCatName});
}
