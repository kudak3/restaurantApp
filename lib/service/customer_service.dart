import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurantapp/model/api_response.dart';
import 'package:restaurantapp/model/meal.dart';

class SymptomsCategoryService{

static const API = '';

Future<APIResponse<List<Meal>>> getSymptomsCategories(){

  return http.get(API + '/meals/').then((data){
   

    if(data.statusCode == 200){
  
      final jsonData = jsonDecode(data.body);
      final meals = Meal.fromJsonDecodedMap(jsonData);

      return APIResponse<List<Meal>>(data: meals);
    }

      return APIResponse<List<Meal>>(error: true,errorMessage: 'An error has occured');
  }).catchError((_) => APIResponse<List<Meal>>(error: true,errorMessage: 'An error has occured'));
}
}