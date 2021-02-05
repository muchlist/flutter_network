import 'dart:convert';

import 'package:flutter_newtwork/repository/base_request.dart';
import 'package:flutter_newtwork/repository/item.dart';
import 'package:http/http.dart' as http;

class RequestItem implements HTTPRequest<Item> {
  final String url;
  const RequestItem({required this.url});

  Future<Item> execute() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw http.ClientException("Oh darn!");
    }

    return _parseJson(response.body);
  }

  Item _parseJson(String response) =>
      Item.fromJson(jsonDecode(response) as Map<String, dynamic>);
}
