import 'package:conasi/data/lead_qualitycode.dart';
import 'package:conasi/data/lead_status.dart';
import 'package:conasi/models/lead/lead_model.dart';
import 'package:conasi/screens/lead_screen/lead_information_screen.dart';
import 'package:conasi/widgets/status_widgets.dart';
import 'package:flutter/material.dart';
import '../models/lead/leads_model.dart';

Widget leadItemTemplate(Object? item, BuildContext context) {
  item as LeadsModel;
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LeadInformationScreen(leadid: item.leadid),
        ),
      );
    },
    // onTap: () =>
    //     Navigator.of(context).pushReplacementNamed(LeadInformationScreen.id()),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              statusContainer(
                  LeadStatus.getStatusByID(item.statuscode.toString()).name,
                  LeadStatus.getStatusByID(item.statuscode.toString()).color,
                  const EdgeInsets.fromLTRB(0, 0, 5, 0)),
              Container(
                color: Colors.grey,
                width: 2,
                height: 20,
              ),
              statusContainer(
                  LeadQualityCode.getQualityCodeByID(
                          item.leadqualitycode.toString())
                      .name,
                  LeadQualityCode.getQualityCodeByID(
                          item.leadqualitycode.toString())
                      .color,
                  const EdgeInsets.fromLTRB(5, 0, 7, 0)),
              Expanded(
                child: Text(
                  item.fullname,
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
                text: 'Email: ',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            TextSpan(
                text: item.emailaddress1,
                style: const TextStyle(fontSize: 15, color: Colors.black)),
          ])),
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
      ],
    ),
  );
}
