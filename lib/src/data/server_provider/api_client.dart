//import 'dart:convert';
//
//import 'package:http/http.dart' as http;
//import 'package:query_params/query_params.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:workwise/src/model/appointments/local_appointments.dart';
//import 'package:workwise/src/model/auth/auth_request.dart';
//import 'package:workwise/src/model/auth/signup_response.dart';
//import 'package:workwise/src/model/checkin/checkin_employee_info.dart';
//import 'package:workwise/src/model/checkin/checkin_log.dart';
//import 'package:workwise/src/model/checkin/checkin_person.dart';
//import 'package:workwise/src/model/checkin/checkin_remap.dart';
//import 'package:workwise/src/model/checkin/checkin_request.dart';
//import 'package:workwise/src/model/checkout/checkout_remap.dart';
//import 'package:workwise/src/model/checkout/checkout_request.dart';
//import 'package:workwise/src/model/checkout/checkout_response.dart';
//import 'package:workwise/src/model/checkout/checkout_response_log.dart';
//import 'package:workwise/src/model/companies/companies.dart';
//import 'package:workwise/src/model/companies/companiesTenant.dart';
//import 'package:workwise/src/model/delivery/delivery_employee_info.dart';
//import 'package:workwise/src/model/delivery/delivery_log.dart';
//import 'package:workwise/src/model/delivery/delivery_person.dart';
//import 'package:workwise/src/model/delivery/delivery_remap.dart';
//import 'package:workwise/src/model/delivery/package_delivery_request.dart';
//import 'package:workwise/src/model/employees/employees.dart';
//import 'package:workwise/src/model/feedback/feedback.dart';
//import 'package:workwise/src/model/get_returning_visitor/get_returning_visitor.dart';
//import 'package:workwise/src/model/visitor/visitorByEmail.dart';
//import 'package:workwise/src/model/visitor/visitorByPhone.dart';
//import 'package:workwise/src/provider/server_provider/base_url.dart';
//import 'package:workwise/src/utils/app_utilities.dart';
//import 'package:workwise/src/utils/functions/save_auth.dart';
//import 'package:workwise/src/utils/functions/save_checkout.dart';
//import 'package:workwise/src/utils/operation.dart';
//
////var authKey = "key";
//
//final authKey = getUrlToUse("key");
//
//class ApiClient {
//  Future<Operation> authAPI(SharedPreferences preferences, http.Client client,
//      context, AuthRequest authRequest
////      String code, String deviceInfo, bool isAuto
//      ) async {
//    URLQueryParams queryParams = URLQueryParams();
//    queryParams.append('device', authRequest.deviceInfo);
//
//    final url = baseUrl +
//        "get/devicebycode/${authRequest.code}?" +
//        queryParams.toString();
//
//    print(url);
//    print(authKey);
//
//    final response = await client.get(url, headers: {
//      "Authorization": "Bearer $authKey",
//      "Accept": "application/json",
//      "Content-Type": "application/json"
//    }).timeout(Duration(seconds: authRequest.isAuto ? 10 : 120),
//        onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
//    }).catchError((error) {
//      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      final responseJson = json.decode(response.body);
//
//      var authResponse = AuthResponse.fromJson(responseJson);
//
//      saveCurrentLogin(responseJson);
//
//      return Operation(response.statusCode, authResponse);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//
////  https://demo.workwise.ng/api/get/devicebycode/ADHHH747D?device=
//
//  Future<Operation> getCompanyAPI(SharedPreferences preferences,
//      http.Client client, context, String serialNumber) async {
////    URLQueryParams queryParams = URLQueryParams();
////    queryParams.append('location', serialNumber);
//
//    print("ok");
//
//    final url = baseUrl + "get/company/" + serialNumber;
//
//    print(url);
//
//    final response = await client.get(url, headers: {
//      "Authorization": "Bearer $authKey",
//      "Accept": "application/json",
//      "Content-Type": "application/json"
//    }).timeout(Duration(minutes: 2), onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
//    }).catchError((error) {
//      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      final responseJson = json.decode(response.body);
//
//      var companies = Companies.fromJson(responseJson);
//
//      return Operation(response.statusCode, companies);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//
//  Future<Operation> companyTenantAPI(
//    SharedPreferences preferences,
//    http.Client client,
//    String serialNumber,
//  ) async {
////    URLQueryParams queryParams = URLQueryParams();
////    queryParams.append('location', "");
////    queryParams.append('item', item);
////    queryParams.append('offset', offset);
//
//    final url = baseUrl + "get/companytenants/" + serialNumber;
//
//    final response = await client.get(url, headers: {
//      "Authorization": "Bearer $authKey",
//      "Accept": "application/json",
//      "Content-Type": "application/json"
//    }).timeout(Duration(minutes: 2), onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
//    }).catchError((error) {
//      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      final responseJson = json.decode(response.body);
//
//      var companies = CompaniesTenant.fromJson(responseJson);
//
//      return Operation(response.statusCode, companies);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//
//  Future<Operation> singleCompanyAPI(
//    context,
//    String serialNumber,
//  ) async {
//    final url = baseUrl + "get/singlecompany/" + serialNumber;
//
//    final response = await http.get(
//      url,
//    );
//
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      final responseJson = json.decode(response.body);
//    } else {}
//
//    return null;
//  }
//
//  Future<Operation> singleCompanyTenantAPI(
//    context,
//    String serialNumber,
//  ) async {
//    final url = baseUrl + "get/singlecompanytenants/" + serialNumber;
//
//    final response = await http.get(
//      url,
//    );
//
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      final responseJson = json.decode(response.body);
//    } else {}
//
//    return null;
//  }
//
//  Future<Operation> visitorByEmailAPI(
//    SharedPreferences preferences,
//    http.Client client,
//    context,
//    String email,
//  ) async {
//    print(email);
//    URLQueryParams queryParams = URLQueryParams();
//    queryParams.append('email', email);
//
//    final url = baseUrl + "get/visitor?" + queryParams.toString();
//
//    final response = await client.get(url, headers: {
//      "Authorization": "Bearer $authKey",
//      "Accept": "application/json",
//      "Content-Type": "application/json"
//    }).timeout(Duration(minutes: 2), onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
//    }).catchError((error) {
//      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      final responseJson = json.decode(response.body);
//
//      var visitorByEmail = VisitorByEmail.fromJson(responseJson);
//
//      return Operation(response.statusCode, visitorByEmail);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//
//  Future<Operation> visitorByPhoneAPI(
//    SharedPreferences preferences,
//    http.Client client,
//    context,
//    String phoneNumber,
//  ) async {
//    URLQueryParams queryParams = URLQueryParams();
//    queryParams.append('phoneNumber', phoneNumber);
//
//    final url = baseUrl + "get/visitorbyphone?" + queryParams.toString();
//
//    final response = await client.get(url, headers: {
//      "Authorization": "Bearer $authKey",
//      "Accept": "application/json",
//      "Content-Type": "application/json"
//    }).timeout(Duration(minutes: 2), onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
//    }).catchError((error) {
//      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      final responseJson = json.decode(response.body);
//
//      var visitorByPhone = VisitorByPhone.fromJson(responseJson);
//
//      return Operation(response.statusCode, visitorByPhone);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//
//  Future<Operation> getEmployeesAPI(
//    SharedPreferences preferences,
//    http.Client client,
//    context,
//    String serialNumber,
//  ) async {
//    final url = baseUrl + "get/employees/" + serialNumber;
//
//    final response = await client.get(url, headers: {
//      "Authorization": "Bearer $authKey",
//      "Accept": "application/json",
//      "Content-Type": "application/json"
//    }).timeout(Duration(minutes: 2), onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
//    }).catchError((error) {
//      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      final responseJson = json.decode(response.body);
//
//      var employees = Employees.fromJson(responseJson);
//
//      return Operation(response.statusCode, employees);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//
//  Future<Operation> checkInVisitorAPI(
//    SharedPreferences preferences,
//    http.Client client,
//    context,
//    CheckInRequest checkInRequest,
//    String serialNumber,
////    String companyID,
////    String email,
////    String first_name,
////    String last_name,
////    String phone_number,
////    String employee,
////    String purpose_of_visit,
////    String picture,
////    String company,
////    String comment,
//  ) async {
////    final url = baseUrl + "company/checkin/" + serialNumber;
//
////    Map<String, String> body = {
////      "companyID": companyID,
////      "email": email,
////      "first_name": first_name,
////      "last_name": last_name,
////      "phone_number": phone_number,
////      "employee": employee,
////      "purpose_of_visit": purpose_of_visit,
////      "picture": picture,
////      "company": company,
////      "comment": comment
////    };
//
//    final url = baseUrl + "company/checkin/" + serialNumber;
////    "companyID": companyID == null ? null : companyID,
////    "email": email == null ? null : email,
////    "first_name": first_name == null ? null : first_name,
////    "last_name": last_name == null ? null : last_name,
////    "phone_number": phone_number == null ? null : phone_number,
////    "employee": employee == null ? null : employee,
////    "purpose_of_visit": purpose_of_visit == null ? null : purpose_of_visit,
////    "picture": picture == null ? null : picture,
////    "company": company == null ? null : company,
////    "comment": comment == null ? null : comment,
//
////    json.encode(checkInRequest.toJson())
//
////    just 1 companyID checkInRequest.companyID = "7";
//
////    parent checkInRequest.serialNO = "CHCO122DF4SN";
////    first tenant checkInRequest.serialNO = "CHCO1D0888SN";
////    checkInRequest.purpose_of_visit = "OF";
////    checkInRequest.comment = "ooof";
////    checkInRequest.picture =
////        "data:image/png;base64,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";
////    checkInRequest.signature =
////        "data:image/png;base64,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";
//    print(checkInRequest.toJson().toString());
//
////    showDialogSingleButton(context, "OK", checkInRequest.toString(), "OK");
//
//    final response = await client
//        .post(url,
//            body: {
//              "companyID": checkInRequest.companyID ?? "",
//              "email": checkInRequest.email ?? "",
//              "first_name": checkInRequest.first_name ?? "",
//              "last_name": checkInRequest.last_name ?? "",
//              "phone_number": checkInRequest.phone_number ?? "",
//              "employee": checkInRequest.employee ?? "",
//              "purpose_of_visit": checkInRequest.purpose_of_visit ?? "",
//              "picture": checkInRequest.picture ?? "",
//              "signature": checkInRequest.signature ?? "",
//              "company": checkInRequest.company ?? "",
//              "comment": checkInRequest.comment ?? "",
//            },
//            headers: {
//              "Authorization": "Bearer $authKey",
//              "Accept": "application/x-www-form-urlencoded",
//              "Content-Type": "application/x-www-form-urlencoded",
////              "Content-Length": "application/x-www-form-urlencoded"
//            },
//            encoding: Encoding.getByName("utf-8"))
//        .timeout(Duration(minutes: 2), onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
//    }).catchError((error) {
//      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print(response.body.toString());
//    if (response.statusCode == 200 || response.statusCode == 201) {
//      final responseJson = json.decode(response.body);
//
////      var employees = Employees.fromJson(responseJson);
//
//      List list = responseJson["response"];
//
//      print(list.elementAt(0));
//
//      CheckInPerson checkInPerson = CheckInPerson.fromJson(list.elementAt(0));
//      CheckInEmployeeInfo checkInEmployeeInfo =
//          CheckInEmployeeInfo.fromJson(list.elementAt(1));
//      CheckInLog checkInLog = CheckInLog.fromJson(list.elementAt(2));
//
//      CheckInRemap checkInRemap = CheckInRemap(
//          statusCode: responseJson['statusCode'],
//          message: responseJson['message'],
//          responseType: responseJson['responseType'],
//          checkInPerson: checkInPerson,
//          checkInEmployeeInfo: checkInEmployeeInfo,
//          checkInLog: checkInLog);
//
//      return Operation(response.statusCode, checkInRemap);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//
//  Future<Operation> checkDeliveryAPI(
//    SharedPreferences preferences,
//    http.Client client,
//    context,
//    PackageDeliveryRequest packageDeliveryRequest,
//    String serialNumber,
//  ) async {
//    final url = baseUrl + "company/delivery/" + serialNumber;
//
//    print(url);
//    print(packageDeliveryRequest.toJson().toString());
//
//    print("stop");
//
//    final response = await client
//        .post(url,
//            body: {
//              "first_name": packageDeliveryRequest.first_name ?? "",
//              "last_name": packageDeliveryRequest.last_name ?? "",
//              "phone_number": packageDeliveryRequest.phone_number ?? "",
//              "employee": packageDeliveryRequest.employee ?? "",
//              "purpose_of_visit": packageDeliveryRequest.purpose_of_visit ?? "",
//              "company": packageDeliveryRequest.company ?? "",
//              "comment": packageDeliveryRequest.comment ?? "",
//            },
//            headers: {
//              "Authorization": "Bearer $authKey",
//              "Accept": "application/x-www-form-urlencoded",
//              "Content-Type": "application/x-www-form-urlencoded",
////              "Content-Length": "application/x-www-form-urlencoded"
//            },
//            encoding: Encoding.getByName("utf-8"))
//        .timeout(Duration(minutes: 2), onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
//    }).catchError((error) {
//      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print(response.body.toString());
//    if (response.statusCode == 200 || response.statusCode == 201) {
//      final responseJson = json.decode(response.body);
//
////      var employees = Employees.fromJson(responseJson);
//
//      List list = responseJson["response"];
//
//      DeliveryPerson deliveryPerson =
//          DeliveryPerson.fromJson(list.elementAt(0));
//      DeliveryEmployeeInfo deliveryEmployeeInfo =
//          DeliveryEmployeeInfo.fromJson(list.elementAt(1));
//      DeliveryLog deliveryLog = DeliveryLog.fromJson(list.elementAt(2));
//
//      DeliveryRemap deliveryRemap = DeliveryRemap(
//          statusCode: responseJson['statusCode'],
//          message: responseJson['message'],
//          responseType: responseJson['responseType'],
//          deliveryPerson: deliveryPerson,
//          deliveryEmployeeInfo: deliveryEmployeeInfo,
//          deliveryLog: deliveryLog);
//
//      return Operation(response.statusCode, deliveryRemap);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//
//  Future<Operation> checkVisitorOutAPI(
//    SharedPreferences preferences,
//    http.Client client,
//    context,
//    CheckOutRequest checkOutRequest,
//    String serialNumber,
//  ) async {
//    final url = baseUrl + "company/checkout/" + serialNumber;
//
//    print(checkOutRequest.toJson());
//    final response = await client
//        .post(url,
//            body: {
//              "email": checkOutRequest.email,
//              "companyID": checkOutRequest.companyID,
//            },
//            headers: {
//              "Authorization": "Bearer $authKey",
//              "Accept": "application/x-www-form-urlencoded",
//              "Content-Type": "application/x-www-form-urlencoded",
////              "Content-Length": "application/x-www-form-urlencoded"
//            },
//            encoding: Encoding.getByName("utf-8"))
//        .timeout(Duration(minutes: 2), onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
//    }).catchError((error) {
//      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print(response.body.toString());
//    if (response.statusCode == 200 || response.statusCode == 201) {
//      final responseJson = json.decode(response.body);
//
////      var employees = Employees.fromJson(responseJson);
//
//      var list = responseJson["response"];
//
//      CheckoutResponse checkoutResponse =
//          CheckoutResponse.fromJson(list["visitor"]);
//      CheckoutResponseLog checkoutResponseLog =
//          CheckoutResponseLog.fromJson(list["visitLog"]);
//
//      CheckOutRemap checkOutRemap = CheckOutRemap(
//          statusCode: responseJson['statusCode'],
//          message: responseJson['message'],
//          responseType: responseJson['responseType'],
//          checkoutResponse: checkoutResponse,
//          checkoutResponseLog: checkoutResponseLog);
//
//      saveLogout(context);
//
//      return Operation(response.statusCode, checkOutRemap);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//
//  Future<Operation> appointmentAPI(
//    SharedPreferences preferences,
//    http.Client client,
//    context,
//    String serialNumber,
//  ) async {
//    final url = baseUrl + "company/invites/" + serialNumber;
//
//    final response = await client.get(url, headers: {
//      "Authorization": "Bearer $authKey",
//      "Accept": "application/json",
//      "Content-Type": "application/json"
//    }).timeout(Duration(minutes: 2), onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
////    }).catchError((error) {
////      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print("appointment API:" + response.body.toString());
//    if (response.statusCode == 200) {
//      final responseJson = json.decode(response.body);
//
//      var localAppointment = LocalAppointments.fromJson(responseJson);
//
//      return Operation(response.statusCode, localAppointment);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//
//  Future<Operation> setVisitLogFeedbackAPI(
//      SharedPreferences preferences,
//      http.Client client,
//      context,
//      String serialNumber,
//      String visitLogID,
//      String feedback) async {
//    final url = baseUrl + "company/visitfeedback/" + serialNumber;
//
//    final response = await client.post(url, body: {
//      "visitLogID": visitLogID,
//      "feedback": feedback,
//    }, headers: {
//      "Authorization": "Bearer $authKey",
//      "Accept": "application/json",
////      "Content-Type": "application/json"
//    }).timeout(Duration(minutes: 2), onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
////    }).catchError((error) {
////      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print(response.body.toString());
//    if (response.statusCode == 200) {
//      final responseJson = json.decode(response.body);
//
//      var feedback = Feedback.fromJson(responseJson);
//
//      return Operation(response.statusCode, feedback);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//
//  Future<Operation> returningVisitorAPI(
//    SharedPreferences preferences,
//    http.Client client,
//    context,
//    String serialNumber,
//    String email,
//    String employeeID,
//  ) async {
//    URLQueryParams queryParams = URLQueryParams();
//    queryParams.append('email', email);
//    queryParams.append('employeeID', employeeID);
//
//    final url =
//        baseUrl + "company/getreturningvisitor/${serialNumber}?$queryParams";
//
//    final response = await client.get(url, headers: {
//      "Authorization": "Bearer $authKey",
//      "Accept": "application/json",
//      "Content-Type": "application/json"
//    }).timeout(Duration(minutes: 2), onTimeout: () async {
//      return http.Response(
//          '{"message":"Connection Timed out. Please try again"}', 408);
////    }).catchError((error) {
////      return http.Response('{"message":"Error Connecting"}', 508);
//    });
//
//    print("appointment API:" + response.body.toString());
//    if (response.statusCode == 200) {
//      final responseJson = json.decode(response.body);
//
//      var getReturningVisitor = GetReturningVisitor.fromJson(responseJson);
//
//      return Operation(response.statusCode, getReturningVisitor);
//    } else {
//      final error = json.decode(response.body);
//
//      print("error: " + error.toString());
//      return Operation(response.statusCode, error);
//    }
//  }
//}
//
//final apiClient = ApiClient();
