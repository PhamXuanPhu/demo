part of 'lead_bloc.dart';

abstract class LeadEvent extends Equatable {
  const LeadEvent();

  @override
  List<Object> get props => [];
}

class LoadData extends LeadEvent {
  const LoadData();
  @override
  List<Object> get props => [];
}

class LoadLead extends LeadEvent {
  final String leadID;
  const LoadLead({
    required this.leadID,
  });
  @override
  List<Object> get props => [leadID];
}

class UpdateLead extends LeadEvent {
  final LeadModel oldLead;
  final LeadModel newLead;
  const UpdateLead({
    required this.oldLead,
    required this.newLead,
  });
  @override
  List<Object> get props => [oldLead, newLead];
}
