import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:starterproject/model/picture.dart';
import 'package:http/http.dart' as http;
import 'package:starterproject/ui/shared/constants.dart';

class WebServices{
  Future<List<Picture>> weatherCheck() async {
    http.Response response = await http.get('http://ws1.metcheck.com/ENGINE/v9_0/json.asp?lat=28&lon=-15.6&lid=62228&Fc=No');
    var responseJson = json.decode(response.body);
    print((responseJson['metcheckData']['forecastLocation']['forecast']as List)
        .map((p) => Picture.fromJson(p).id)
        .toList());
    return (responseJson['metcheckData']['forecastLocation']['forecast']as List)
        .map((p) => Picture.fromJson(p))
        .toList();
  }
}