// import 'dart:convert';

// import 'package:http/http.dart' as http;

// const String url =
//     'https://jsm-challenges.s3.amazonaws.com/frontend-challenge.json';

// void main() async {
//   final Map<String, String> headers = {
//     'Content-Type': 'Application/json',
//   };
//   http.Response resp = await http.get(Uri.parse(url), headers: headers);
//   Map<String, dynamic> json = jsonDecode(utf8.decode(resp.bodyBytes));

//   for (Map<String, dynamic> _ in json['results']) {
//     print(_['location']['city']);
//   }

//   print(resp.headers);
// }
