// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:juntossomosmais_app/constants.dart';

import '../models/member.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode, utf8;

class JSMApi {
  Future<List<Member>> getAllUsers() async {
    const String endpoint = '/frontend-challenge.json';
    const String url = kBaseUrl + endpoint;

    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('$url -> http status ${response.statusCode}');
    }

    List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes))['results'];

    return compute(parseMembers, json);
  }

  List<Member> parseMembers(List<dynamic> membersAsJson) {
    return List<Member>.generate(
        membersAsJson.length, (index) => Member.fromJson(membersAsJson[index]));
  }
}
