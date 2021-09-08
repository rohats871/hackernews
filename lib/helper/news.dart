import 'dart:convert';

import 'package:hackerapp/models/articleModel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<dynamic> getNews() async {
    var url = Uri.parse("http://hn.algolia.com/api/v1/search?tags=front_page");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      jsonData["hits"]?.forEach((element) {
        ArticleModel articleModel = ArticleModel(
          type: element['type'] ?? "type",
          title: element['title'],
          text: element['title'],
        );
        news.add(articleModel);
      });
    }
    return news;
  }
}
