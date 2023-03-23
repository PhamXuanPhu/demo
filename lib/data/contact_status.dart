import 'package:conasi/models/status_model.dart';
import 'package:flutter/material.dart';

class ContactStatus {
  static List<StatusModel> listStatus = [
    StatusModel(id: '1', name: 'Tiềm năng', color: Colors.blue),
    StatusModel(id: '2', name: 'Nháp', color: Colors.yellow),
    StatusModel(id: '100000000', name: 'Chính thức', color: Colors.green),
    StatusModel(id: '100000001', name: 'Nháp', color: Colors.orange),
  ];
  static StatusModel getStatusByID(String id) {
    return listStatus.firstWhere((element) => element.id == id, orElse: () {
      return StatusModel(id: '', name: '', color: Colors.white);
    });
  }
}
