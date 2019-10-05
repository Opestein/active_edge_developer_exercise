// To parse this JSON data, do
//
//     final errorrResponse = errorrResponseFromJson(jsonString);

//ErrorrResponse errorrResponseFromJson(String str) => ErrorrResponse.fromJson(json.decode(str));
//
//String errorrResponseToJson(ErrorrResponse data) => json.encode(data.toJson());

class ErrorResponse {
  int statusCode;
  String message;
  String responseType;
  String response;

  ErrorResponse({
    this.statusCode,
    this.message,
    this.responseType,
    this.response,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      new ErrorResponse(
        statusCode: json["statusCode"] == null ? null : json["statusCode"],
        message: json["message"] == null ? null : json["message"],
        responseType:
            json["responseType"] == null ? null : json["responseType"],
        response: json["response"] == null ? null : json["response"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "responseType": responseType == null ? null : responseType,
        "response": response == null ? null : response,
      };
}
