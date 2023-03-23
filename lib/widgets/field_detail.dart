import 'package:flutter/cupertino.dart';

Row fieldDetail(String title, String value) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Text(value)],
    );
