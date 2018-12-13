import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app/model/post.dart';
import 'package:sample_app/repositories/post_repository.dart';
import 'package:sample_app/repositories/posts.dart';

class HomePage extends StatelessWidget {
  static String tag = "home_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: FutureBuilder<List<Post>>(
            future: fetchPosts(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);

              return snapshot.hasData
                  ? ListViewPosts(posts: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }));
  }
}
