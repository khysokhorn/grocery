import 'dart:convert';

import 'package:http/http.dart' as http;

class AppBaseRequest {

  final _baseUrl = "http://192.168.1.109:8000/api";
  http.Client _httpClient = http.Client();

  Future<String> get(String endPoint) async {
    final url = '$_baseUrl$endPoint';
    print("===> get : Api Request with $url");
    print("===> get : Api Request header ${_header().toString()}");
    final response = await this._httpClient.get(
          Uri.parse(url),
          headers: _header(),
        );

    String resBody = response.body;
    print("===> get : body request $resBody");
    if (response.statusCode == 200) {
      return resBody;
    } else {
      print("===> get : body request error $resBody");
      throw Exception(jsonDecode(resBody)['message']);
    }
  }

  Future<String> get1(
    String endPoint,
    Function error(String error),
    Function success(String json),
  ) async {
    final url = '$_baseUrl$endPoint';
    print("===> get : Api Request with $url");
    print("===> get : Api Request header ${_header().toString()}");
    final response = await this._httpClient.get(
          Uri.parse(url),
          headers: _header(),
        );

    String resBody = response.body;
    print("===> get : body request $resBody");
    if (response.statusCode == 200) {
      success(resBody);
      return resBody;
    } else {
      print("===> get : body request error $resBody");
      error(jsonDecode(resBody)['message']);
      throw Exception(jsonDecode(resBody)['message']);
    }
  }

  Future<String> post(
    String endPoint,
    Map<String, String> body,
  ) async {
    final url = '$_baseUrl/$endPoint';
    print("===> post : Api Request with $url ");
    print("===> post : Api body $body");
    print("===> post : Api cookie $_header()");

    final response = await this._httpClient.post(
          Uri.parse(url),
          body: jsonEncode(body),
          headers: _header(),
        );
    String resBody = response.body;

    print("===> post : body request $resBody");

    if (response.statusCode == 200) {
      return resBody;
    } else {
      throw Exception(jsonDecode(resBody)['message']);
    }
  }

  Map<String, String> _header() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer ${_hiveLocalDB.getLoinModel().token}',
        // 'cookie': "${_hiveLocalDB.getLoinModel().cookie}"
      };

  void closeHttp() {
    _httpClient.close();
  }
}
