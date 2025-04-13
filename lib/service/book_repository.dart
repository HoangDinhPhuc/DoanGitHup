import 'http_service.dart';
import 'models/book_detail_model.dart';
import 'models/book_model.dart';

class BookRepository {
  String domainMain = 'https://img.otruyenapi.com/';
  String domainFE = 'https://otruyen.cc';
  String domainCDN = 'https://img.otruyenapi.com';
  String urlThumbnail = 'https://img.otruyenapi.com/uploads/comics/';

  FetchClient service = FetchClient();

  Future<List<BookModel>> getPageStory(int page) async {
    final response = await service.getData(
        // danh sách truyện
        domainApp: 'https://otruyenapi.com/v1/api/',
        path: 'danh-sach/ngon-tinh?page=$page');
    List<BookModel> books = [];
    if (response.statusCode == 200) {
      final data = response.data['data']['items'];
      for (var e in data) {
        books.add(BookModel(
            slug: e['slug'],
            idBook: e['_id'],
            nameBook: e['name'],
            thumbNailURL: e['thumb_url']));
      }
      return books;
    } else {
      return [];
    }
  }

  Future<BookDetailModel> getDetailStory(String slug) async {
    final response = await service.getData(
        // danh sách truyện
        domainApp: 'https://otruyenapi.com/v1/api/',
        path: 'truyen-tranh/$slug');

    if (response.statusCode == 200) {
      final data = response.data['data']['item'];
      List<String> categories = [];
      List<String> chaptersURL = [];
      for (var e in data['category']) {
        categories.add(e['name']);
      }
      if (data['chapters'].isEmpty) {
        return BookDetailModel(
            name: data['name'],
            author: data['author'][0],
            catogories: categories,
            slug: data['slug'],
            quanityChapters: chaptersURL.length,
            descriptionHead: data['content'],
            chapterUrls: []);
      } else {
        for (var e in data['chapters'][0]['server_data']) {
          chaptersURL.add(e['chapter_api_data']);
        }
      }

      return BookDetailModel(
          name: data['name'],
          author: data['author'][0],
          catogories: categories,
          slug: data['slug'],
          quanityChapters: chaptersURL.length,
          descriptionHead: data['content'],
          chapterUrls: chaptersURL);
    } else {
      return BookDetailModel();
    }
  }

  Future<List<String>> getStngUrlImages(String urlImageList) async {
    final response = await service.getData(
        // danh sách truyện
        domainApp: urlImageList,
        path: '');
    List<String> chaptersURL = [];

    if (response.statusCode == 200) {
      final domain = response.data['data']['domain_cdn'];
      final data = response.data['data']['item'];
      final pathImage = data['chapter_path'];

      for (var e in data['chapter_image']) {
        String url = domain + '/' + pathImage + '/' + e['image_file'];
        chaptersURL.add(url);
      }

      return chaptersURL;
    } else {
      return [];
    }
  }
}
