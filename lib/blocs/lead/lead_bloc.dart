import 'package:conasi/api/api_crm.dart';
import 'package:conasi/data/data.dart';
import 'package:conasi/models/lead/lead_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../fetch/lead_fetch_data.dart';
import '../../models/lead/leads_model.dart';
part 'lead_event.dart';
part 'lead_state.dart';

class LeadBloc extends Bloc<LeadEvent, LeadState> {
  LeadBloc() : super(const LeadState()) {
    on<LoadData>(_onLoadData);
    on<LoadLead>(_onLoadLead);
    on<UpdateLead>(_onUpdateLead);
  }

  void _onLoadData(LoadData event, Emitter<LeadState> emit) async {
    final state = this.state;
    int page = state.page;
    List<LeadsModel> data = [];

    try {
      var result = await API.getListDataFromCRM(
          LeadFetch.leadEntity, LeadFetch.leads(page));
      if (result.isNotEmpty) {
        page++;
        data = List<LeadsModel>.from(result.map((e) => LeadsModel.fromMap(e)));
      }
      emit(LeadState(
          listLead: List.from(state.listLead)..addAll(data), page: page));
    } catch (e) {
      throw Exception(e);
    }
  }

  void _onLoadLead(LoadLead event, Emitter<LeadState> emit) async {
    LeadModel lead;

    try {
      var result = await API.getDataFromCRM(
        LeadFetch.leadEntity,
        LeadFetch.leadDetail(event.leadID),
      );
      if (result.isNotEmpty) {
        lead = LeadModel.fromMap(result);
        emit(LeadState(lead: lead, listLead: state.listLead, page: state.page));
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void _onUpdateLead(UpdateLead event, Emitter<LeadState> emit) {}
}
