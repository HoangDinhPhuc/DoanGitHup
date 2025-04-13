import 'package:book_01/service/book_repository.dart';
import 'package:book_01/service/models/book_detail_model.dart';
import 'package:book_01/service/models/book_model.dart';
import 'package:get/get.dart';

class SystemController extends GetxController {
  RxInt page = 0.obs;
  RxBool isLoading = false.obs;
  var books = <BookModel>[].obs;
  var pathUrls = <String>[].obs;
  var detailBookMoMel = BookDetailModel().obs;

  BookRepository repository = BookRepository();

  onInitialController() {
    onRefreshPage();
  }

  onRefreshPage() {
    page.value = 1;
    onFetchBooks();
  }

  onFetchImagePicture(String urlChapter) async {
    isLoading.value = true;
    List<String> urlsImage = await repository.getStngUrlImages(urlChapter);
    isLoading.value = false;
    pathUrls.value = urlsImage;
  }

  onFetchDetailData(String slug) async {
    isLoading.value = true;
    BookDetailModel book = await repository.getDetailStory(slug);
    detailBookMoMel.value = book;
    isLoading.value = false;
  }

  onFetchBooks() async {
    List<BookModel> bookReponse = await repository.getPageStory(page.value);
    books.value = [...books, ...bookReponse];
    if (page.value == 1) {
      books.value = bookReponse;
    }

    page.value++;
  }
}
