import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "HackerNewsToday",
          style: TextStyle(color: Colors.black),
        ),
      ),

      ///App Bar Finishes
      body: Container(
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 10, left: 8, right: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: null,
                      itemBuilder: (context, index) {
                        return Container();
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
