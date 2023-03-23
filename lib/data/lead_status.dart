import 'package:conasi/models/status_model.dart';
import 'package:flutter/material.dart';

class LeadStatus {
  static List<StatusModel> listStatus = [
    StatusModel(id: '1', name: 'Mới', color: Colors.blue),
    StatusModel(id: '2', name: 'Đã liên hệ', color: Colors.orange),
    StatusModel(id: '3', name: 'Đã xác nhận', color: Colors.green),
    StatusModel(id: '4', name: 'Mất khách hàng', color: Colors.yellow),
    StatusModel(id: '5', name: 'Không liên lạc', color: Colors.pink),
    StatusModel(id: '7', name: 'Đã hủy', color: Colors.grey),
  ];
  static StatusModel getStatusByID(String id) {
    return listStatus.firstWhere((element) => element.id == id, orElse: () {
      return StatusModel(id: '', name: '', color: Colors.white);
    });
  }
}
