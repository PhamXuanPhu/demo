import 'package:conasi/data/account_status.dart';
import 'package:conasi/models/account_model.dart';
import 'package:conasi/widgets/status_widgets.dart';
import 'package:flutter/material.dart';

Widget accountItemTemplate(Object? item) {
  item as AccountModel;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            statusContainer(
                AccountStatus.getStatusByID(item.statuscode.toString()).name,
                AccountStatus.getStatusByID(item.statuscode.toString()).color),
            Expanded(
              child: Text(
                item.bsd_name,
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
        padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
        child: SelectableText.rich(TextSpan(children: [
          const TextSpan(
              text: 'Đại diện: ',
              style: TextStyle(fontSize: 15, color: Colors.grey)),
          TextSpan(
              text: item.primarycontact_name,
              style: const TextStyle(fontSize: 15, color: Colors.black)),
        ])),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
        child: SelectableText.rich(TextSpan(children: [
          const TextSpan(
              text: 'Phone number: ',
              style: TextStyle(fontSize: 15, color: Colors.grey)),
          TextSpan(
              text: item.telephone1,
              style: const TextStyle(fontSize: 15, color: Colors.black)),
        ])),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(15, 3, 15, 15),
        child: SelectableText.rich(TextSpan(children: [
          const TextSpan(
              text: 'Contact Address: ',
              style: TextStyle(fontSize: 15, color: Colors.grey)),
          TextSpan(
              text: item.bsd_address,
              style: const TextStyle(fontSize: 15, color: Colors.black)),
        ])),
      ),
    ],
  );
}
