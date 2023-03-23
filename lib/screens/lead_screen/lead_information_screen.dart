import 'package:conasi/base/base_screen.dart';
import 'package:conasi/blocs/lead/lead_bloc.dart';
import 'package:conasi/models/lead/lead_model.dart';
import 'package:conasi/widgets/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/field_detail.dart';

class LeadInformationScreen extends BaseScreen {
  const LeadInformationScreen({Key? key, this.leadid = ''}) : super(key: key);
  static const id = 'lead_information_screen';
  final String leadid;

  @override
  String appBarTitle() {
    return "Lead Information";
  }

  @override
  Widget body() {
    return content();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LeadBloc>(context);
    return super.build(context);
  }

  Widget content() => BlocBuilder<LeadBloc, LeadState>(
        builder: (context, state) {
          if (leadid.isNotEmpty) {
            context.read<LeadBloc>().add(LoadLead(leadID: leadid));
            if (state.lead.leadid.isNotEmpty) {
              LeadModel lead = state.lead;
              return Container(
                child: Column(
                  children: [
                    fieldDetail('Tên :', lead.fullname),
                    fieldDetail('ID :', lead.leadid),
                    fieldDetail('Email :', lead.emailaddress1 ?? ''),
                    fieldDetail('Phone :', lead.mobilephone ?? ''),
                    fieldDetail('Công ty :', lead.companyname ?? ''),
                    ButtonCustom(
                        text: 'Login',
                        voidCallback: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  LeadInformationScreen(leadid: lead.leadid),
                            ),
                          );
                        }),
                  ],
                ),
              );
            }
          } else {
            Navigator.pop(context);
          }
          return Container();
        },
      );
}

class Information extends StatelessWidget {
  const Information({Key? key, required this.leadid}) : super(key: key);
  static const id = 'lead_information_screen';
  final String leadid;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LeadBloc>(context);
    bloc.add(LoadLead(leadID: leadid));
    LeadModel lead = bloc.state.lead;

    Future loadData() {
      bloc.add(LoadLead(leadID: leadid));
      return Future.value();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lead Information'),
        ),
        body: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            return lead.leadid.isNotEmpty
                ? Container(
                    child: Column(
                      children: [
                        fieldDetail('Tên :', lead.fullname),
                        fieldDetail('ID :', lead.leadid),
                        fieldDetail('Email :', lead.emailaddress1 ?? ''),
                        fieldDetail('Phone :', lead.mobilephone ?? ''),
                        fieldDetail('Công ty :', lead.companyname ?? ''),
                        ButtonCustom(
                            text: 'Login',
                            voidCallback: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LeadInformationScreen(
                                      leadid: lead.leadid),
                                ),
                              );
                            }),
                      ],
                    ),
                  )
                : Container();
          },
        ));
  }
}
