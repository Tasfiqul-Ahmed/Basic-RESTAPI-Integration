import 'package:basic_restapi_integration/comment_helper.dart';
import 'package:flutter/material.dart';

import 'comment.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Comment>? comments;
  bool isLoaded = false;
  getData() async {
    comments = await CommentHelper().getComments();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Integration"),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: comments?.length??0,
            itemBuilder: (context, index){
              return Card(
                elevation: 5,
                child: ListTile(
                  title: Text(comments![index].name),
                  subtitle: Text(comments![index].body),
                ),
              );
            }
        ),
      ),
    );
  }
}
