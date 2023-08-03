import 'dart:convert';
import 'package:http/http.dart';
import 'config.dart';

Future<List<Map<String, dynamic>>> fetchBooks() async {
  List<Map<String, dynamic>> computerBooksList = [];

  try {
    final apiKey = googleBooksApiKey;
    final response = await get(Uri.parse(
        'https://www.googleapis.com/books/v1/volumes?q=computer&maxResults=10&key=$apiKey'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData.containsKey('items') && jsonData['items'] is List) {
        for (var item in jsonData['items']) {
          final volumeInfo = item['volumeInfo'];
          final title = volumeInfo['title'];
          final imageUrl = volumeInfo['imageLinks']?['thumbnail'] ?? 'No Image';
          computerBooksList.add({'title': title, 'imageUrl': imageUrl});
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

  return computerBooksList;
}
