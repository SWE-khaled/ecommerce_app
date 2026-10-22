import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    fetchPosts();
    super.initState();
  }

  void fetchPosts() async {
    try {
      final response = await Dio().get(
        "https://jsonplaceholder.typicode.com/users",
      );
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}
