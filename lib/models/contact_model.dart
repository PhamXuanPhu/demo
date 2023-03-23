import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  final String contactid;
  final String bsd_fullname;
  String? bsd_contactaddress;
  String? mobilephone;
  int? statuscode;
  ContactModel({
    required this.contactid,
    required this.bsd_fullname,
    this.bsd_contactaddress,
    this.mobilephone,
    this.statuscode,
  }) {
    bsd_contactaddress = bsd_contactaddress ?? "";
    mobilephone = mobilephone ?? "";
    statuscode = statuscode ?? 0;
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contactid': contactid,
      'bsd_fullname': bsd_fullname,
      'bsd_contactaddress': bsd_contactaddress,
      'mobilephone': mobilephone,
      'statuscode': statuscode,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      contactid: map['contactid'] as String,
      bsd_fullname: map['bsd_fullname'] as String,
      bsd_contactaddress: map['bsd_contactaddress'] != null
          ? map['bsd_contactaddress'] as String
          : null,
      mobilephone:
          map['mobilephone'] != null ? map['mobilephone'] as String : null,
      statuscode: map['statuscode'] != null ? map['statuscode'] as int : null,
    );
  }
  @override
  List<Object?> get props => [];
}
