import 'dart:convert';

import 'package:flutter/material.dart';
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
          const ScaffoldMessenger(
            child: SnackBar(
              content: Text('Format response tidak valid'),
            ),
          );
        }
      } else {
        ScaffoldMessenger(
          child: SnackBar(
            content:
                Text('Gagal memuat data. Status Code: ${response.statusCode}'),
          ),
        );
      }
    }
  } catch (error) {
    ScaffoldMessenger(
      child: SnackBar(
        content: Text(
          'Terjadi error sebagai berikut: $error',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }

  return userDataList;
}
