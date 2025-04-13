import '../themes/app_constant.dart';

class BookModel {
  String? idBook;
  String? nameBook;
  String? slug;
  String? thumbNailURL;

  BookModel(
      {required this.slug,
      required this.idBook,
      required this.nameBook,
      required this.thumbNailURL});

  static List<BookModel> skeletonTemplate() {
    return [
      BookModel(
          slug: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 1',
          thumbNailURL: AppConstants.stringOverviewExample),
      BookModel(
          slug: 'Author 2',
          idBook: 'idBook_2',
          nameBook: 'nameBook 2',
          thumbNailURL: AppConstants.stringOverviewExample),
      BookModel(
          slug: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 3',
          thumbNailURL: AppConstants.stringOverviewExample),
      BookModel(
          slug: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 4',
          thumbNailURL: AppConstants.stringOverviewExample),
      BookModel(
          slug: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 5',
          thumbNailURL: AppConstants.stringOverviewExample),
      BookModel(
          slug: 'Author 2',
          idBook: 'idBook_2',
          nameBook: 'nameBook 6',
          thumbNailURL: AppConstants.stringOverviewExample),
      BookModel(
          slug: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 7',
          thumbNailURL: AppConstants.stringOverviewExample),
      BookModel(
          slug: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 8',
          thumbNailURL: AppConstants.stringOverviewExample),
      BookModel(
          slug: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 9',
          thumbNailURL: AppConstants.stringOverviewExample),
      BookModel(
          slug: 'Author 2',
          idBook: 'idBook_2',
          nameBook: 'nameBook 10',
          thumbNailURL: AppConstants.stringOverviewExample),
      BookModel(
          slug: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 11',
          thumbNailURL: AppConstants.stringOverviewExample),
      BookModel(
          slug: 'Author 1',
          idBook: 'idBook_1',
          nameBook: 'nameBook 12',
          thumbNailURL: AppConstants.stringOverviewExample),
    ];
  }
}
