// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return Driver(
    id: json['id'] as int,
    user: json['user'] as int,
    avatar: json['avatar'] as String,
    phone: json['phone'] as String,
    address: json['address'] as String,
    location: json['location'] as String,
  );
}

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'address': instance.address,
      'location': instance.location,
    };
