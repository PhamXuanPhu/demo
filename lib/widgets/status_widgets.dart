import 'package:conasi/resource/colors.dart';
import 'package:flutter/cupertino.dart';

Container statusContainer(String name, Color color,
        [EdgeInsetsGeometry? margin]) =>
    Container(
      margin: margin,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 15, color: colorWhite),
      ),
    );
