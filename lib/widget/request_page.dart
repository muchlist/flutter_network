import 'package:flutter_newtwork/repository/base_request.dart';
import 'package:flutter_newtwork/repository/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_newtwork/widget/success_widget.dart';

import 'error_widget.dart';

class HTTPWidget extends StatefulWidget {
  final HTTPRequest<Item> _request;

  // Sangat penting untuk menerapkan const karena FutureBuilder akan dipanggil beberapa kali
  // sehigga widget tidak di create ulang terus menerus
  const HTTPWidget(this._request);

  @override
  _HTTPWidgetState createState() => _HTTPWidgetState();
}

class _HTTPWidgetState extends State<HTTPWidget> {
  late final Future<Item> futureItem;

  @override
  void initState() {
    super.initState();
    futureItem = widget._request.execute();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Item>(
        future: futureItem,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const ErrorItemWidget();
          }

          if (snapshot.hasData) {
            return SuccessItemWidget(snapshot.data);
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
