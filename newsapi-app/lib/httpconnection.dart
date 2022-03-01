import 'package:http/http.dart';
import 'package:redcarpetassignment/newsdetails.dart';
import 'dart:convert';

class HttpConnection{


  String uri="https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=6e71b8d980934f07a7eb22d08d59121d";

  Future<List<NewsDetails>> fetchNews() async{
     Response response = await get(Uri.parse(uri));

    if (response.statusCode == 200) {

      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<NewsDetails> articles =
      body.map((dynamic item) => NewsDetails.fromJson(item)).toList();

      return articles;

    } else {
      throw Exception('Failed to load the news');
    }
  }

}
