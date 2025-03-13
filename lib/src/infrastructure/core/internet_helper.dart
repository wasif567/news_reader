import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:reader/src/domain/core/internet_service/i_base_client.dart';

@LazySingleton(as: IBaseClient)
class InternetHelper extends IBaseClient {
  InternetHelper(this.client);
  final http.Client client;

  String regUrl = 'https://newsapi.org/v2/';

  @override
  Future<http.Response> get(String url) async {
    try {
      var header = {"content-type": "application/json", "accept": "application/json"};

      Uri uri = Uri.parse(regUrl + url);
      final response = await client.get(uri, headers: header);

      if (response.statusCode == 200) {
        return response;
      } else {
        throw Error();
      }
    } on SocketException {
      throw const SocketException('Internet service not found');
    } on TimeoutException {
      throw TimeoutException('Time out');
    } catch (e) {
      throw ("something went wrong");
    }
  }

  @override
  Future<http.Response> post(String url, {required Map<String, dynamic> body}) async {
    try {
      var header = {
        "content-type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "POST,GET,DELETE,PUT,OPTIONS",
      };

      // fetching application register url

      var jsonData = jsonEncode(body);
      Uri uri = Uri.parse(regUrl + url);
      final response = await client.post(uri, body: jsonData, headers: header);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Error();
      }
    } on SocketException {
      throw const SocketException('Internet service not found');
    } on TimeoutException {
      throw TimeoutException('Time out');
    }
  }
}
