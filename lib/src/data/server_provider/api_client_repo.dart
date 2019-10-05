//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:workwise/src/model/auth/auth_request.dart';
//import 'package:workwise/src/model/checkin/checkin_request.dart';
//import 'package:workwise/src/model/checkout/checkout_request.dart';
//import 'package:workwise/src/model/delivery/package_delivery_request.dart';
//import 'package:workwise/src/provider/server_provider/api_client.dart';
//import 'package:workwise/src/utils/operation.dart';
//
//class ApiClientRepo {
//  Future<Operation> auth(SharedPreferences preferences, http.Client client,
//          BuildContext context, AuthRequest authRequest
////          String code,
////          String deviceInfo,
////          bool isAuto
//          ) async =>
//      apiClient.authAPI(preferences, client, context, authRequest
////          code, deviceInfo, isAuto
//          );
//
//  Future<Operation> getCompany(
//          SharedPreferences preferences,
//          http.Client client,
//          BuildContext context,
//          String serialNumber) async =>
//      apiClient.getCompanyAPI(preferences, client, context, serialNumber);
//
//  Future<Operation> companyTenant(
//    SharedPreferences preferences,
//    http.Client client,
//    BuildContext context,
//    String serialNumber,
//  ) async =>
//      apiClient.companyTenantAPI(
//        preferences,
//        client,
//        serialNumber,
//      );
//
//  Future<Operation> singleCompany(
//          SharedPreferences preferences,
//          http.Client client,
//          BuildContext context,
//          String serialNumberr) async =>
//      apiClient.singleCompanyAPI(context, serialNumberr);
//
//  Future<Operation> singleCompanyTenant(
//          SharedPreferences preferences,
//          http.Client client,
//          BuildContext context,
//          String serialNumber) async =>
//      apiClient.singleCompanyTenantAPI(context, serialNumber);
//
//  Future<Operation> visitorByEmail(SharedPreferences preferences,
//          http.Client client, BuildContext context, String email) async =>
//      apiClient.visitorByEmailAPI(preferences, client, context, email);
//
//  Future<Operation> visitorByPhone(SharedPreferences preferences,
//          http.Client client, BuildContext context, String phone) async =>
//      apiClient.visitorByPhoneAPI(preferences, client, context, phone);
//
//  Future<Operation> getEmployees(
//          SharedPreferences preferences,
//          http.Client client,
//          BuildContext context,
//          String serialNumber) async =>
//      apiClient.getEmployeesAPI(preferences, client, context, serialNumber);
//
//  Future<Operation> checkInVisitor(
//    SharedPreferences preferences,
//    http.Client client,
//    BuildContext context,
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
//  ) async =>
//      apiClient.checkInVisitorAPI(
//        preferences, client, context, checkInRequest,
//        serialNumber,
////        companyID,
////        email,
////        first_name,
////        last_name,
////        phone_number,
////        employee,
////        purpose_of_visit,
////        picture,
////        company,
////        comment,
//      );
//
//  Future<Operation> checkDelivery(
//    SharedPreferences preferences,
//    http.Client client,
//    BuildContext context,
//    PackageDeliveryRequest packageDeliveryRequest,
//    String serialNumber,
//  ) async =>
//      apiClient.checkDeliveryAPI(
//        preferences,
//        client,
//        context,
//        packageDeliveryRequest,
//        serialNumber,
//      );
//
//  Future<Operation> checkVisitorOut(
//    SharedPreferences preferences,
//    http.Client client,
//    BuildContext context,
//    CheckOutRequest checkOutRequest,
//    String serialNumber,
//  ) async =>
//      apiClient.checkVisitorOutAPI(
//        preferences,
//        client,
//        context,
//        checkOutRequest,
//        serialNumber,
//      );
//
//  Future<Operation> appointment(
//    SharedPreferences preferences,
//    http.Client client,
//    BuildContext context,
//    String serialNumber,
//  ) async =>
//      apiClient.appointmentAPI(
//        preferences,
//        client,
//        context,
//        serialNumber,
//      );
//
//  Future<Operation> visitLogFeedback(
//          SharedPreferences preferences,
//          http.Client client,
//          BuildContext context,
//          String serialNumber,
//          String visitLogID,
//          String feedback) async =>
//      apiClient.setVisitLogFeedbackAPI(
//          preferences, client, context, serialNumber, visitLogID, feedback);
//  Future<Operation> getReturningVisitor(
//    SharedPreferences preferences,
//    http.Client client,
//    context,
//    String serialNumber,
//    String email,
//    String employeeID,
//  ) async =>
//      apiClient.returningVisitorAPI(
//          preferences, client, context, serialNumber, email, employeeID);
//}
//
//final apiClientRepo = ApiClientRepo();
