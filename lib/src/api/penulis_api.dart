import 'dart:convert';

import 'package:http/http.dart';

Future<List<Map<String, dynamic>>> fetchUserData() async {
  List<Map<String, dynamic>> userDataList = [];

  try {
    userDataList.clear();
    for (int i = 1; i <= 3; i++) {
      final response =
          await get(Uri.parse('https://randomuser.me/api?inc=name,picture'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey('results') && jsonData['results'] is List) {
          userDataList.add(jsonData['results'][0]);
        } else {
          print('Format response tidak valid');
        }
      } else {
        print('Gagal memuat data. Cek status code: ${response.statusCode}');
      }
    }
  } catch (error) {
    print('Terjadi error sebagai berikut: $error');
  }

  return userDataList;
}
