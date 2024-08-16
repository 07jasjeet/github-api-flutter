import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'exceptions.dart';

class ResponseParser {

  // Usually base url is the same across all repositories.
  final String _baseUrl = "https://api.github.com/";

  Future<dynamic> get(String url) async {
    late dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    final code = response.statusCode;
    var responseJson = json.decode(response.body.toString());
    if (code >= 200 && code <= 299) {
      if (kDebugMode) {
        print(responseJson);
      }
      return responseJson;
    } else if (code >= 300 && code <= 399) {
      // redirection
      return responseJson;
    } else if (code == 400) {
      throw BadRequestException(responseJson["message"] as String);
    } else if (code == 401) {
      throw UnauthorisedException(responseJson["message"] as String);
    } else if (code == 403) {
      throw ForbiddenException(responseJson["message"] as String);
    } else if (code == 404) {
      throw DoesNotExistException(responseJson["message"] as String);
    } else if (code == 429) {
      throw RateLimitExceededException(responseJson["message"] as String);
    } else if (code >= 500) {
      throw ServerException(responseJson["message"] as String);
    } else {
      throw FetchDataException(
          "Error occurred while communicating with server with statuscode : ${response
              .statusCode} : ${responseJson["message"]}");
    }
  }
}