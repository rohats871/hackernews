import 'package:flutter/material.dart';
import 'package:hackerapp/Screens/article_view.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hacker",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.lime),
            ),
          ],
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
                    onTap: () {},
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
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              print(articles.length);
                              return BlogTile(
                                  text: articles[index].text,
                                  url: articles[index].url,
                                  title: articles[index].title);
                              // type: articles[index].type);
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
  final title, url, text;
  BlogTile({
    @required this.text,
    @required this.title,
    @required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("printed");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        child: Column(
          textDirection: TextDirection.ltr,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
