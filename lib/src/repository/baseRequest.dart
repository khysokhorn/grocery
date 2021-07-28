import 'dart:convert';

import 'package:grocery/src/constants/api_path.dart';
import 'package:http/http.dart' as http;

class AppBaseRequest {

  final _baseUrl = APICONST.BASE_URL;
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

  void get1(
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
    } else {
      error(jsonDecode(resBody)['message']);
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

    print("===> post : body response $resBody");

    if (response.statusCode >= 200 || response.statusCode <= 300) {
      return resBody;
    } else {
      throw Exception(resBody);
    }
  }

  Future post1(
    String endPoint,
    Map<String, String> body,
    Function(http.Response response) res,
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
    res(response);
    print("===> post : body response $resBody");
  }

  Future getWithCallBackRes(
      String endPoint, Function(http.Response response) res) async {
    final url = '$_baseUrl$endPoint';
    print("===> get : Api Request with $url");
    print("===> get : Api Request header ${_header().toString()}");
    var responses = await this._httpClient.get(
          Uri.parse(url),
          headers: _header(),
        );

    res(responses);
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
