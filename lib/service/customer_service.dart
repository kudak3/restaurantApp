import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurantapp/model/api_response.dart';
import 'package:restaurantapp/model/meal.dart';

class CustomerService {
  static const API = 'http://192.168.100.6:8000/api';
  static const headers = {'Content-Type': 'application/json'};
  Map<String, String> authHeaders;
  String token;

  Future<APIResponse<List<Meal>>> getMeals() {
    return http.get(API + '/customer/meals/').then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final meals = Meal.fromJsonDecodedMap(jsonData);

        return APIResponse<List<Meal>>(data: meals);
      }

      return APIResponse<List<Meal>>(
          error: true, errorMessage: 'An error has occured');
    }).catchError((_) => APIResponse<List<Meal>>(
        error: true, errorMessage: 'An error has occured'));
  }

  Future<APIResponse<bool>> addOrder() async {
    return http
        .post(
      API + '/customer/order/add/',
      headers: headers,
    )
        .then((data) {
      final jsonData = jsonDecode(data.body);
      print(data.body);
      if (data.statusCode == 201) {
        return APIResponse<bool>(error: false);
      }
      return APIResponse<bool>(
          error: true, errorMessage: jsonData['user']['username'][0]);
    }).catchError((error) =>
            APIResponse<bool>(error: true, errorMessage: error.toString()));
  }
}
