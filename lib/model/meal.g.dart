// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  return Meal(
    id: json['id'] as int,
    restaurant: json['restaurant'] as int,
    name: json['name'] as String,
    short_description: json['short_description'] as String,
    image: json['image'] as String,
    price: (json['price'] as num)?.toDouble(),
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'restaurant': instance.restaurant,
      'name': instance.name,
      'short_description': instance.short_description,
      'image': instance.image,
      'price': instance.price,
      'quantity': instance.quantity,
    };
