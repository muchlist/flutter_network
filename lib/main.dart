import 'package:flutter/material.dart';
import 'package:flutter_newtwork/repository/item_request.dart';
import 'package:flutter_newtwork/widget/request_page.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  final req =
      const RequestItem(url: "https://jsonplaceholder.typicode.com/posts/10");

  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Request Demo"),
            ),
            body: Center(
              child: HTTPWidget(req),
            )));
  }
}
