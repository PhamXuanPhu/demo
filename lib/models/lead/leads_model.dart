import 'package:equatable/equatable.dart';

class LeadsModel extends Equatable {
  final String leadid;
  final String fullname;
  final String? emailaddress1;
  final String? mobilephone;
  final int? statuscode;
  final int? leadqualitycode;

  const LeadsModel({
    this.leadid = "",
    this.fullname = "",
    this.emailaddress1 = "",
    this.mobilephone = "",
    this.statuscode = 0,
    this.leadqualitycode = 0,
  });

  LeadsModel copyWith({
    String? leadid,
    String? fullname,
    String? emailaddress1,
    String? mobilephone,
    int? statuscode,
    int? leadqualitycode,
  }) {
    return LeadsModel(
      leadid: leadid ?? this.leadid,
      fullname: fullname ?? this.fullname,
      emailaddress1: emailaddress1 ?? this.emailaddress1,
      mobilephone: mobilephone ?? this.mobilephone,
      statuscode: statuscode ?? this.statuscode,
      leadqualitycode: leadqualitycode ?? this.leadqualitycode,
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
    };
  }

  factory LeadsModel.fromMap(Map<String, dynamic> map) {
    return LeadsModel(
      leadid: map['leadid'] as String,
      fullname: map['fullname'] as String,
      emailaddress1:
          map['emailaddress1'] != null ? map['emailaddress1'] as String : null,
      mobilephone:
          map['mobilephone'] != null ? map['mobilephone'] as String : null,
      statuscode: map['statuscode'] != null ? map['statuscode'] as int : null,
      leadqualitycode:
          map['leadqualitycode'] != null ? map['leadqualitycode'] as int : null,
    );
  }

  @override
  List<Object?> get props => [
        leadid,
        fullname,
        emailaddress1,
        mobilephone,
        statuscode,
        leadqualitycode
      ];
}
