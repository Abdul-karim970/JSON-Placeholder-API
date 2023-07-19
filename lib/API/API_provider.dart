import 'dart:convert';

import 'package:http/http.dart' as http;

extension RESTCode on http.Response {
  bool isSuccessful() {
    return statusCode == 200;
  }

  bool isCreated() {
    return statusCode == 201;
  }
}

abstract class APIProvider {
  String get baseUrl => 'https://jsonplaceholder.typicode.com/';
  String get apiUrl;
  fetch({String endPoint = ''}) async {
    var response = await http.get(Uri.parse('$baseUrl$apiUrl$endPoint'));
    if (response.isSuccessful()) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  insert(Map<String, dynamic> map) async {
    var response =
        await http.put(Uri.parse('$baseUrl$apiUrl'), body: jsonEncode(map));

    return response.isCreated();
  }
}
