import 'package:get/get.dart';

import '../../beranda/model/book_model.dart';

class FavoriteController extends GetxController {
  RxList<Book> favoriteBooks = <Book>[].obs;

  void addToFavorites(Book book) {
    favoriteBooks.add(book);
    update();
  }

  void removeFromFavorites(Book book) {
    favoriteBooks.remove(book);
    update();
  }

  bool isFavorite(Book book) {
    return favoriteBooks.contains(book);
  }
}
