import 'package:conasi/models/status_model.dart';
import 'package:flutter/material.dart';

class LeadQualityCode {
  static List<StatusModel> listQualityCode = [
    StatusModel(id: '3', name: 'Cold', color: Colors.blue),
    StatusModel(id: '2', name: 'Warm', color: Colors.orange),
    StatusModel(id: '1', name: 'Hot', color: Colors.pink),
  ];
  static StatusModel getQualityCodeByID(String id) {
    return listQualityCode.firstWhere((element) => element.id == id,
        orElse: () {
      return StatusModel(id: '', name: '', color: Colors.white);
    });
  }
}
