import 'package:conasi/data/contact_status.dart';
import 'package:conasi/models/contact_model.dart';
import 'package:conasi/widgets/status_widgets.dart';
import 'package:flutter/material.dart';

Widget contactItemTemplate(Object? item) {
  item as ContactModel;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            statusContainer(
                ContactStatus.getStatusByID(item.statuscode.toString()).name,
                ContactStatus.getStatusByID(item.statuscode.toString()).color),
            Expanded(
              child: Text(
                item.bsd_fullname,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            )
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(15, 3, 15, 15),
        child: SelectableText.rich(TextSpan(children: [
          const TextSpan(
              text: 'Phone number: ',
              style: TextStyle(fontSize: 15, color: Colors.grey)),
          TextSpan(
              text: item.mobilephone,
              style: const TextStyle(fontSize: 15, color: Colors.black)),
        ])),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
        child: SelectableText.rich(TextSpan(children: [
          const TextSpan(
              text: 'Contact address: ',
              style: TextStyle(fontSize: 15, color: Colors.grey)),
          TextSpan(
              text: item.bsd_contactaddress,
              style: const TextStyle(fontSize: 15, color: Colors.black)),
        ])),
      ),
    ],
  );
}
