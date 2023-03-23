import 'package:equatable/equatable.dart';

class LeadModel extends Equatable {
  final String leadid;
  final String fullname;
  final String? emailaddress1;
  final String? mobilephone;
  final int? statuscode;
  final int? leadqualitycode;
  final String? companyname;

  const LeadModel({
    this.leadid = "",
    this.fullname = "",
    this.emailaddress1 = "",
    this.mobilephone = "",
    this.statuscode = 0,
    this.leadqualitycode = 0,
    this.companyname = "",
  });

  LeadModel copyWith({
    String? leadid,
    String? fullname,
    String? emailaddress1,
    String? mobilephone,
    int? statuscode,
    int? leadqualitycode,
    String? companyname,
  }) {
    return LeadModel(
      leadid: leadid ?? this.leadid,
      fullname: fullname ?? this.fullname,
      emailaddress1: emailaddress1 ?? this.emailaddress1,
      mobilephone: mobilephone ?? this.mobilephone,
      statuscode: statuscode ?? this.statuscode,
      leadqualitycode: leadqualitycode ?? this.leadqualitycode,
      companyname: companyname ?? this.companyname,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'leadid': leadid,
      'fullname': fullname,
      'emailaddress1': emailaddress1,
      'mobilephone': mobilephone,
      'statuscode': statuscode,
      'leadqualitycode': leadqualitycode,
      'companyname': companyname,
    };
  }

  factory LeadModel.fromMap(Map<String, dynamic> map) {
    return LeadModel(
      leadid: map['leadid'] as String,
      fullname: map['fullname'] as String,
      emailaddress1:
          map['emailaddress1'] != null ? map['emailaddress1'] as String : null,
      mobilephone:
          map['mobilephone'] != null ? map['mobilephone'] as String : null,
      statuscode: map['statuscode'] != null ? map['statuscode'] as int : null,
      leadqualitycode:
          map['leadqualitycode'] != null ? map['leadqualitycode'] as int : null,
      companyname:
          map['companyname'] != null ? map['companyname'] as String : null,
    );
  }

  @override
  List<Object?> get props => [
        leadid,
        fullname,
        emailaddress1,
        mobilephone,
        statuscode,
        leadqualitycode,
        companyname
      ];
}
