import 'package:conasi/base/base_screen.dart';
import 'package:conasi/blocs/lead/lead_bloc.dart';
import 'package:conasi/models/lead/lead_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeadFormScreen extends BaseScreen {
  const LeadFormScreen({Key? key, this.leadid = ''}) : super(key: key);
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

  Widget content() => BlocBuilder<LeadBloc, LeadState>(
        builder: (context, state) {
          if (leadid.isNotEmpty) {
            context.read<LeadBloc>().add(LoadLead(leadID: leadid));
            if (state.lead.leadid.isNotEmpty) {
              LeadModel lead = state.lead;
              return Container(
                child: Column(
                  children: [
                    Text(lead.fullname),
                    Text(lead.leadid),
                    Text(lead.emailaddress1 ?? ""),
                    Text(lead.mobilephone ?? ""),
                    Text(lead.fullname),
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
