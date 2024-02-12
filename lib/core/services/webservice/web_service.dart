// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';


class WebServiceResponse<T> {
  final T? data;
  final int? statusCode;
  final String? statusMessage;

  WebServiceResponse({
    this.data,
    required this.statusCode,
    this.statusMessage,
  });

  @override
  String toString() {
    if (data is Map) {
      // Log encoded maps for better readability.
      return json.encode(data);
    }
    return data.toString();
  } 
}

abstract class WebService{
  Future<WebServiceResponse<T>> getUri<T>({required Uri uri,Map<String,dynamic>? headers,Object? data});
}


class DioWebService implements WebService {
  DioWebService({
    required this.dio,
  });
  final Dio dio;
  
  @override
  Future<WebServiceResponse<T>> getUri<T>({required Uri uri, Map<String, dynamic>? headers, Object? data}) async {
    try {
      final dioResponse = await dio.getUri<T>(uri,options: headers != null ? Options(headers: headers,) : null ,data: data);
      final webServiceResponse = WebServiceResponse(data: dioResponse.data, statusCode: dioResponse.statusCode,statusMessage: dioResponse.statusMessage);
      return webServiceResponse;
    } catch (e) {
      rethrow;
    }
  }
  
  
  
  
  
  
}
