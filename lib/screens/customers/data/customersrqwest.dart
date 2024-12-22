import 'dart:convert';
import 'package:amwal/core/network/global.dart';
import 'package:amwal/core/utils/prefrences.dart';
import 'package:http/http.dart' as http;

class CustomersReqwest {
  static Future<http.Response> getcustomers(
    String token,
  ) async {
    var url = Uri.parse("${Global.url}/client");
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${Preferences.getToken()!}",
      "p-connection": Preferences.getpconnection()!,
      "p-host": Preferences.getphost()!,
      "p-port": Preferences.getpport()!,
      "p-database": Preferences.getpdatabase()!,
      "p-username": Preferences.getpusername()!,
      "p-password": Preferences.getppassword()!,
      "POSGUID": Preferences.getPOSGUID()!,
    };
    http.Response response = await http.get(url, headers: headers);
    var responsemap = jsonDecode(response.body);
    print(Global.headers);
    print("responsemap=");
    print(responsemap);
    return response;
  }

  // static Future<http.Response> creatgroup(
  //   String token,
  //   String name,
  //   List<Lawyer> members,
  // ) async {
  //   List<int> membersid = [];
  //   for (var i = 0; i < members.length; i++) {
  //     membersid.add(members[i].id);
  //   }
  //   Map<String, String> headers = {
  //     "Content-type": "application/json",
  //     "Accept": "application/json",
  //     "Authorization": "Bearer $token"
  //   };
  //   Map data = {
  //     "name": name,
  //     "members": membersid,
  //   };
  //   print(data);
  //   var body = jsonEncode(data);
  //   var url = Uri.parse("${Global.url}group");
  //   http.Response response = await http.post(url, headers: headers, body: body);
  //   print(response.statusCode);
  //   var responsemap = jsonDecode(response.body);
  //   print("responsemap=");
  //   print(responsemap);
  //   return response;
  // }
}
