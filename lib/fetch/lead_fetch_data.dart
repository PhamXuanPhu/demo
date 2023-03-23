import '../data/data.dart';

class LeadFetch {
  LeadFetch._();
  static const String leadEntity = "leads";
  static String leads(int page) =>
      """<fetch version='1.0' count='${Data.numList}' page='$page' output-format='xml-platform' mapping='logical' distinct='false'>
                      <entity name='lead'>
                        <attribute name='fullname' />
                        <attribute name='statuscode' />
                        <attribute name='mobilephone'/>
                        <attribute name='emailaddress1' />
                        <attribute name='leadid' />
                        <attribute name='leadqualitycode' />
                        <attribute name='bsd_customercode' />
                      </entity>
                    </fetch>""";
  static String leadDetail(String id) =>
      """<fetch version='1.0' output-format='xml-platform' mapping='logical' distinct='false'>
                      <entity name='lead'>
                        <attribute name='fullname' />
                        <attribute name='statuscode' />
                        <attribute name='mobilephone'/>
                        <attribute name='emailaddress1' />
                        <attribute name='leadid' />
                        <attribute name='leadqualitycode' />
                        <attribute name='bsd_customercode' />
                        <attribute name='companyname' />
                        <filter type='and'>
                          <condition attribute='leadid' operator='eq' value='$id' />
                        </filter>
                      </entity>
                    </fetch>""";
}
