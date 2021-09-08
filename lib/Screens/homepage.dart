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
    super.initState();
    setState(() {
      _loading = false;
    });
  }

  getNews() async {
    News newsClass = News();
    var article = await newsClass.getNews();
    setState(() {
      articles = article;
    });
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
              margin: EdgeInsets.all(8),
              child: Column(
                textDirection: TextDirection.ltr,
                children: [
                  TextField(
                    cursorColor: Colors.black12,
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    showCursor: true,
                    // textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ClipRRect(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              print(articles.length);
                              return BlogTile(
                                  text: articles[index].text,
                                  title: articles[index].title,
                                  type: articles[index].type);
                            }),
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
  final title, text, type;
  BlogTile({@required this.text, @required this.title, @required this.type});
  @override
  Widget build(BuildContext context) {
    return Column(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 15,
        ),
        Text(type)
      ],
    );
  }
}
