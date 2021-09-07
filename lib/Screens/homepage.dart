import 'package:flutter/material.dart';
import 'package:hackerapp/helper/news.dart';
import 'package:hackerapp/models/articleModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
    _loading = false;
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Hacker News",
          style: TextStyle(color: Colors.black),
        ),
      ),

      ///App Bar Finishes
      body: _loading
          ? Container(child: Center(child: CircularProgressIndicator()))
          : Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      cursorColor: Colors.black12,
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      showCursor: true,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 10, left: 8, right: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: articles.length,
                              itemBuilder: (context, index) {
                                return BlogTile(
                                    imageUrl: articles[index].imageUrl,
                                    text: articles[index].text,
                                    title: articles[index].title,
                                    type: articles[index].type);
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final imageUrl, title, text, type;
  BlogTile(
      {@required this.imageUrl,
      @required this.text,
      @required this.title,
      @required this.type});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.network(imageUrl), Text(title), Text(text), Text(type)],
    );
  }
}
