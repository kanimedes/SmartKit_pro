class Category_Model{
  String? id;
  String? CategoryName;

  Category_Model({this.id,this.CategoryName});
}

List<Category_Model> CategoryList = [
  Category_Model(
    id: "1",
    CategoryName: "Design",
  ),
  Category_Model(
    id: "2",
    CategoryName: "Development",
  ),
  Category_Model(
    id: "3",
    CategoryName: "IT & Software",
  ),
  Category_Model(
    id: "4",
    CategoryName: "Business",
  ),
  Category_Model(
    id: "5",
    CategoryName: "Marketing",
  ),
  Category_Model(
    id: "6",
    CategoryName: "Music",
  ),
  Category_Model(
    id: "7",
    CategoryName: "Lifestyle",
  ),
];
