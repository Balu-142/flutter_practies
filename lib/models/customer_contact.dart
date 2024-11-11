import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// Service model
class Service {
  final int id;
  final String serviceName;
  final String customerName;
  final String customerMobile;
  final String customerEmail;
  final String customerNote;
  final DateTime customerLoginDate;

  Service({
    required this.id,
    required this.serviceName,
    required this.customerName,
    required this.customerMobile,
    required this.customerEmail,
    required this.customerNote,
    required this.customerLoginDate,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      serviceName: json['service_name'],
      customerName: json['customer_name'],
      customerMobile: json['customer_mobile'],
      customerEmail: json['customer_email'],
      customerNote: json['customer_note'],
      customerLoginDate: DateTime.parse(json['customer_login_date']),
    );
  }
}

