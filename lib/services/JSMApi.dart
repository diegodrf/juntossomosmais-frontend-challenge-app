import 'package:juntossomosmais_app/constants.dart';

import '../models/member.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

class JSMApi {
  Future<List<Member>> getAllUsers() async {
    const String endpoint = '/frontend-challenge.json';
    const String url = kBaseUrl + endpoint;

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('$url -> http status ${response.statusCode}');
    }

    List<dynamic> json = jsonDecode(response.body)['results'];

    return List<Member>.generate(
        json.length, (index) => Member.fromJson(json[index]));
  }
}
