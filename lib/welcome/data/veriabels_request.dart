import 'dart:convert';
import 'package:amwal/core/network/global.dart';
import 'package:amwal/core/utils/prefrences.dart';
import 'package:http/http.dart' as http;

class VeriabelsRequest {
  static Future<http.Response> getcurrency() async {
    var url = Uri.parse("${Global.url}/accounting/currency");
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
}
