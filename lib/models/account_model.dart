import 'package:equatable/equatable.dart';

class AccountModel extends Equatable {
  final String accountid;
  final String bsd_name;
  String? telephone1;
  String? bsd_address;
  int? statuscode;
  String? primarycontact_name;
  AccountModel({
    required this.accountid,
    required this.bsd_name,
    this.telephone1,
    this.bsd_address,
    this.statuscode,
    this.primarycontact_name,
  }) {
    telephone1 = telephone1 ?? "";
    bsd_address = bsd_address ?? "";
    statuscode = statuscode ?? 0;
    primarycontact_name = primarycontact_name ?? "";
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accountid': accountid,
      'bsd_name': bsd_name,
      'telephone1': telephone1,
      'bsd_address': bsd_address,
      'statuscode': statuscode,
      'primarycontact_name': primarycontact_name,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      accountid: map['accountid'] as String,
      bsd_name: map['bsd_name'] as String,
      telephone1:
          map['telephone1'] != null ? map['telephone1'] as String : null,
      bsd_address:
          map['bsd_address'] != null ? map['bsd_address'] as String : null,
      statuscode: map['statuscode'] != null ? map['statuscode'] as int : null,
      primarycontact_name: map['primarycontact_name'] != null
          ? map['primarycontact_name'] as String
          : null,
    );
  }

  @override
  List<Object?> get props => [
        accountid,
        bsd_name,
        telephone1,
        bsd_address,
        statuscode,
        primarycontact_name
      ];
}
