class Article {
  int? id;
  String? title;
  String? shortdesc;
  String? author;
  String? description;
  String? image;
  String? imgurl;
  String? hash;
  String? publshedAt;
  String? newstype;

  Article(
      {this.id,
      this.title,
      this.shortdesc,
      this.description,
      this.author,
      this.publshedAt,
      this.image,
      this.newstype,
      this.imgurl,
      this.hash});
}
