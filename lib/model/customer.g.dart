// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    id: json['id'] as int,
    user: json['user'] as int,
    avatar: json['avatar'] as String,
    phone: json['phone'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'address': instance.address,
    };
