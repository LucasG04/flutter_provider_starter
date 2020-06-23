import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  Future<dynamic> fetchData(String url, {Map<String, String> params}) async {
    var responseJson;

    var uri = url + ((params != null) ? this.queryParameters(params) : "");
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http.get(uri, headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  String queryParameters(Map<String, String> params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }

  Future<dynamic> postData(String url, dynamic body) async {
    var responseJson;
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response =
          await http.post(url, body: body, headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class HttpException implements Exception {
  final _message;
  final _prefix;

  HttpException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends HttpException {
  FetchDataException([String message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends HttpException {
  InvalidInputException([String message]) : super(message, "Invalid Input: ");
}

class AuthenticationException extends HttpException {
  AuthenticationException([String message]) : super(message, "Authentication Failed: ");
}

class HttpResponse<T> {
  Status status;

  T data;

  String message;

  HttpResponse.loading(this.message) : status = Status.LOADING;

  HttpResponse.completed(this.data) : status = Status.COMPLETED;

  HttpResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }