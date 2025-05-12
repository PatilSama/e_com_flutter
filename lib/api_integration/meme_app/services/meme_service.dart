import 'dart:convert';

import 'package:e_com_flutter/api_integration/meme_app/models/meme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MemeService {
  static Future<List<Meme>?> fetchMemes(BuildContext context) async {
    final url = Uri.parse("https://meme-api.com/gimme/wholesomememes/50");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final memes =
            (data['memes'] as List).map((meme) => Meme.fromJson(meme)).toList();
        return memes;
      } else {
        throw Exception("Failed to load memes");
      }
    } catch (ex) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error to load memes"),
        ),
      );
    }
  }
}
