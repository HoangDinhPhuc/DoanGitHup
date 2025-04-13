class BookDetailModel {
  String id;
  String name;
  String imageThumbNailURL;
  String author;
  String ogURL;
  String descriptionHead;
  List<String> catogories;
  List<String> chapterUrls;
  String slug;
  int quanityChapters;
  BookDetailModel({
    this.id = '',
    this.name = '',
    this.imageThumbNailURL = '',
    this.author = '',
    this.ogURL = '',
    this.quanityChapters = 0,
    this.descriptionHead = '',
    this.chapterUrls =  const [] , 
    this.catogories = const [],
    this.slug = '',
  });
}
