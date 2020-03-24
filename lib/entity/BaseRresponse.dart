import 'dart:convert';

class BaseResponse<T> {
  String code;
  String message;
  T data;

  BaseResponse.formJson(json) {
    code = json["code"];
    message = json["message"];
    data = json["data"];
  }
}
