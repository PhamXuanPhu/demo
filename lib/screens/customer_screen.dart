import 'package:conasi/base/base_listview.dart';
import 'package:conasi/base/base_screen.dart';
import 'package:conasi/blocs/lead/lead_bloc.dart';
import 'package:conasi/models/account_model.dart';
import 'package:conasi/models/contact_model.dart';
import 'package:conasi/models/lead/lead_model.dart';
import 'package:conasi/widgets/account_itemtemplate.dart';
import 'package:conasi/widgets/contact_itemtemplate.dart';
import 'package:conasi/widgets/lead_itemtemplate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api/api_crm.dart';

class CustomerScreen extends BaseScreen {
  CustomerScreen({Key? key}) : super(key: key);
  static const id = 'customer_screen';
  ScrollController scrollController2 = ScrollController();

  @override
  String appBarTitle() {
    return "Customer";
  }

  @override
  Widget body() {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Wrap(children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              child: const TabBar(
                isScrollable: true,
                tabs: [
                  Text('K.h tiềm năng'),
                  Text('K.h cá nhân'),
                  Text('K.h doanh nghiệp')
                ],
                labelPadding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.blue, width: 2.5),
                  insets: EdgeInsets.symmetric(horizontal: 20),
                ),
                labelColor: Colors.blue,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                unselectedLabelColor: Color.fromRGBO(128, 128, 128, 0.7),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          ]),
          Expanded(
            child: TabBarView(
              children: [
                BlocBuilder<LeadBloc, LeadState>(
                  builder: (context, state) {
                    return Container(
                        height: 500, child: ListLead(state, context));
                  },
                ),
                ListContact(),
                Expanded(child: ListAccount()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// List Lead - danh sách khách hàng tiềm năng
class ListLead extends BaseListView {
  const ListLead(this.state, this.context, {Key? key}) : super(key: key);
  final LeadState state;
  final BuildContext context;

  @override
  Widget itemTemplate(Object? item) {
    return leadItemTemplate(item, context);
  }

  @override
  Future loadMoreCallBack() async {
    context.read<LeadBloc>().add(LoadData());
  }

  @override
  List<Object> get list => state.listLead;
}

// List Contact - danh sách khách hàng cá nhân
class ListContact extends Base {
  ListContact({Key? key}) : super(key: key);
  int page = 0;
  final List<ContactModel> listitem = [];

  @override
  Widget itemTemplate(Object? item) {
    return contactItemTemplate(item);
  }

  @override
  Future loadMoreCallBack() async {
    page++;
    String entity = 'contacts';
    String fetchXml =
        """<fetch version='1.0' count='10' page='$page' output-format='xml-platform' mapping='logical' distinct='false'>
                      <entity name='contact'>
                        <attribute name='bsd_fullname' />
                        <attribute name='mobilephone' />
                        <attribute name='bsd_contactaddress' />
                        <attribute name='contactid' />
                        <attribute name='statuscode' />
                      </entity>
                    </fetch>""";
    var result = await API.getListDataFromCRM(entity, fetchXml);
    if (result.isNotEmpty) {
      final listCoin =
          List<ContactModel>.from(result.map((e) => ContactModel.fromMap(e)));
      listitem.addAll(listCoin);
    }
  }

  @override
  List<Object> get list => listitem;
}

// List Account - danh sách khách hàng doanh nghiệp
class ListAccount extends BaseListView {
  ListAccount({Key? key}) : super(key: key);
  int page = 0;
  final List<AccountModel> listitem = [];

  @override
  Widget itemTemplate(Object? item) {
    return accountItemTemplate(item);
  }

  @override
  Future loadMoreCallBack() async {
    page++;
    String entity = 'accounts';
    String fetchXml =
        """<fetch version='1.0' count='10' page='$page' output-format='xml-platform' mapping='logical' distinct='false'>
                  <entity name='account'>
                    <attribute name='bsd_name' />
                    <attribute name='statuscode' />
                    <attribute name='telephone1' />
                    <attribute name='accountid' />
                    <attribute name='address1_composite' alias='bsd_address' />
                    <order attribute='createdon' descending='true' />
                    <link-entity name='contact' from='contactid' to='primarycontactid' visible='false' link-type='outer' alias='a'>
                         <attribute name='bsd_fullname' alias='primarycontact_name' />
                    </link-entity>
                  </entity>
                </fetch>""";
    var result = await API.getListDataFromCRM(entity, fetchXml);
    if (result.isNotEmpty) {
      final listCoin =
          List<AccountModel>.from(result.map((e) => AccountModel.fromMap(e)));
      listitem.addAll(listCoin);
    }
  }

  @override
  List<Object> get list => listitem;
}
