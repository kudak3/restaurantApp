import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurantapp/model/api_response.dart';
import 'package:restaurantapp/model/meal.dart';
import 'package:restaurantapp/model/order.dart';

class DriverService{
static const API = 'http://192.168.100.6:8000/api';
  static const headers = {'Content-Type': 'application/json'};
  Map<String, String> authHeaders;
  String token;


Future<APIResponse<List<Order>>> getOrders(){

  return http.get(API + '/driver/orders/ready/').then((data){
   

    if(data.statusCode == 200){
  
      final jsonData = jsonDecode(data.body);
      final orders = Order.fromJsonDecodedMap(jsonData);

      return APIResponse<List<Order>>(data: orders);
    }

      return APIResponse<List<Order>>(error: true,errorMessage: 'An error has occured');
  }).catchError((_) => APIResponse<List<Order>>(error: true,errorMessage: 'An error has occured'));
}


Future<APIResponse<bool>> pickOrder(Order order) async {
 
    return http
        .post(API + 'driver/order/pick/',
            headers: headers, body: jsonEncode(Order))
        .then((data) {
      final jsonData = jsonDecode(data.body);
      print(data.body);
      if (data.statusCode == 201) {
       
        return APIResponse<bool>(error:false);
      }
      return APIResponse<bool>(
          error: true, errorMessage: jsonData['user']['username'][0]);
    }).catchError((error) =>
            APIResponse<bool>(error: true, errorMessage: error.toString()));
  }


}