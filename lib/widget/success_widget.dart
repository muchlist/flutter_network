import 'package:flutter/material.dart';
import 'package:flutter_newtwork/repository/item.dart';

class SuccessItemWidget extends StatelessWidget {
  final Item? data;
  const SuccessItemWidget(this.data);

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      return Text("${data!.id} - ${data!.title}");
    } else {
      return const Text("No data to show");
    }
  }
}
