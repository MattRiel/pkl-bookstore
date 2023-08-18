import 'package:bookstore/src/api/config.dart';
import 'package:flutter/foundation.dart';

import '../../../api/buku_api.dart';
import '../../../api/penulis_api.dart';
import '../model/beranda_model.dart';
import '../model/book_model.dart';

class BerandaController {
  final BerandaModel model = BerandaModel();
  final BookService bookService = BookService(googleBooksApiKey);

  Future<void> loadData() async {
    try {
      List<Map<String, dynamic>> userData = await fetchUserData();
      List<Book> latestBookData = await bookService.fetchLatestBooks();
      List<Book> generalBookData = await bookService.fetchGeneralBooks();
      List<Book> journalBookData = await bookService.fetchJournals();
      List<Book> proceedingBookData = await bookService.fetchProceedings();

      model.userDataList = userData;
      model.latestBooks = latestBookData.cast<Map<String, dynamic>>();
      model.generalBooks = generalBookData.cast<Map<String, dynamic>>();
      model.journals = journalBookData.cast<Map<String, dynamic>>();
      model.proceedings = proceedingBookData.cast<Map<String, dynamic>>();
    } catch (error) {
      if (kDebugMode) {
        print('Error loading data: $error');
      }
    }
  }
}
