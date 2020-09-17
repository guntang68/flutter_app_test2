import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class GetWebData {
  Future<dynamic> GetData(String URL) async {
    var data = await http.get(URL);
    var jsonData = json.decode(data.body);
    return jsonData;
  }
}
