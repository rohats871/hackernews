import 'dart:convert';

import 'package:hackerapp/models/articleModel.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var url = Uri.parse("http://hn.algolia.com/api/v1/search?tags=front_page");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 200) {
      jsonData["articles"].forEach((element) {
        ArticleModel articleModel = ArticleModel(
          type: element['type'],
          title: element['title'],
          imageUrl: element['imageUrl'],
          text: element['text'],
        );
        news.add(articleModel);
      });
    }
  }
}
