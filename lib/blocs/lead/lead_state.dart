part of 'lead_bloc.dart';

class LeadState extends Equatable {
  final List<LeadsModel> listLead;
  final int page;
  final LeadModel lead;

  const LeadState(
      {this.listLead = const <LeadsModel>[],
      this.page = 1,
      this.lead = const LeadModel()});

  @override
  List<Object?> get props => [listLead, page, lead];
}
