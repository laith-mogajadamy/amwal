import 'dart:convert';
import 'package:amwal/core/network/global.dart';
import 'package:http/http.dart' as http;

class Auth {
  static Future<http.Response> login(
    String email,
    String password,
  ) async {
    Map data = {
      "username": email,
      "password": password,
      "accept_logout": "true"
    };
    var body = jsonEncode(data);
    print("url");
    print(Global.url);
    print("headers");
    print(Global.headers);
    var url = Uri.parse("${Global.url}/auth/login");
    http.Response response =
        await http.post(url, headers: Global.headers, body: body);
    return response;
  }

  static Future<http.Response> logout(String token) async {
    var url = Uri.parse("${Global.url}logout");
    http.Response response = await http.post(
      url,
      headers: Global.headers,
    );
    return response;
  }
}
