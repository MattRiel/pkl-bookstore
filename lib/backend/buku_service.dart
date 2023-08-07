import 'dart:convert';
import 'package:http/http.dart';
import 'config.dart';

Future<List<Map<String, dynamic>>> fetchBooksByQuery(String query) async {
  List<Map<String, dynamic>> booksList = [];

  try {
    final apiKey = googleBooksApiKey;
    final response = await get(Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=$query&maxResults=10&key=$apiKey'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData.containsKey('items') && jsonData['items'] is List) {
        for (var item in jsonData['items']) {
          final volumeInfo = item['volumeInfo'];
          final title = volumeInfo['title'];
          final imageUrl =
              volumeInfo['imageLinks']?['thumbnail'] ?? 'figma/book_icon.png';
          booksList.add({'title': title, 'imageUrl': imageUrl});
        }
      } else {
        print('Format response tidak valid');
      }
    } else {
      print('Gagal memuat data. Cek status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Terjadi error sebagai berikut: $error');
  }

  return booksList;
}

Future<List<Map<String, dynamic>>> fetchLatestBooks() async {
  return fetchBooksByQuery('latest computer');
}

Future<List<Map<String, dynamic>>> fetchGeneralBooks() async {
  return fetchBooksByQuery('computer science');
}

Future<List<Map<String, dynamic>>> fetchJournals() async {
  return fetchBooksByQuery('computer journal');
}

Future<List<Map<String, dynamic>>> fetchProceedings() async {
  return fetchBooksByQuery('computer proceeding');
}
