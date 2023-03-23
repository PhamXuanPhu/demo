import 'dart:convert';
import 'dart:io';
import 'package:conasi/config/config.dart';
import 'package:http/http.dart' as http;

class API {
  // đăng nhập vào crm
  static Future loginCRM() async {
    try {
      var body = {
        'grant_type': 'client_credentials',
        'resource': Config.resource,
        'client_id': Config.clientId,
        'client_secret': Config.clientSecret
      };
      final response = await http.post(
        Uri.parse(Config.url),
        body: body,
      );
      if (response.statusCode == HttpStatus.ok) {
        Config.accessToken = jsonDecode(response.body)['access_token'];
      } else {
        throw Exception('Failed to login.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

// login bằng employee
  static Future<bool> loginEmployee(String userName, String passWord) async {
    try {
      if (Config.accessToken == '') {
        await loginCRM();
      }
      var headers = {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${Config.accessToken}",
      };
      String fetch =
          "<fetch version='1.0' output-format='xml-platform' mapping='logical' distinct='false'>"
          "<entity name='bsd_employee'>"
          "<attribute name='bsd_employeeid' />"
          "<attribute name='bsd_name' />"
          "<attribute name='bsd_password' />"
          "<filter type='and'>"
          "<condition attribute='bsd_name' operator='eq' value='$userName' />"
          "<condition attribute='bsd_password' operator='eq' value='$passWord' />"
          "</filter>"
          "</entity>"
          "</fetch>";
      final response = await http.get(
        Uri.parse('${Config.apiUrl}/bsd_employees?fetchXml=$fetch'),
        headers: headers,
      );
      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> listEmployee = jsonDecode(response.body)['value'];
        if (listEmployee.isNotEmpty) {
          return true;
        } else {
          return false;
        }
      } else {
        throw Exception('Failed to get login.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // get danh sach từ entity và fetch
  static Future<List<dynamic>> getListDataFromCRM(
      String entity, String fetch) async {
    try {
      var headers = {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${Config.accessToken}",
      };
      final response = await http.get(
        Uri.parse('${Config.apiUrl}/$entity?fetchXml=$fetch'),
        headers: headers,
      );
      if (response.statusCode == HttpStatus.ok) {
        return jsonDecode(response.body)['value'];
      } else {
        throw Exception('Failed to get data.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // get data từ entity và fetch với id
  static Future<Map<String, dynamic>> getDataFromCRM(
      String entity, String fetch) async {
    try {
      var headers = {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer ${Config.accessToken}",
      };
      final response = await http.get(
        Uri.parse('${Config.apiUrl}/$entity?fetchXml=$fetch'),
        headers: headers,
      );
      if (response.statusCode == HttpStatus.ok) {
        var list = jsonDecode(response.body)['value'] as List<dynamic>;
        if (list.isNotEmpty) {
          return list.first;
        } else {
          throw Exception('Failed to get data.');
        }
      } else {
        throw Exception('Failed to get data.');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
