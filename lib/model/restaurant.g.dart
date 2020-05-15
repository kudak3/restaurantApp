// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    id: json['id'] as int,
    user: json['user'] as int,
    name: json['name'] as String,
    phone: json['phone'] as String,
    address: json['address'] as String,
    logo: json['logo'] as String,
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
      'logo': instance.logo,
    };
