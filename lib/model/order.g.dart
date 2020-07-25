// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    id: json['id'] as int,
    customer: json['customer'] == null
        ? null
        : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    restaurant: json['restaurant'] as int,
    driver: json['driver'] as int,
    address: json['address'] as String,
    total: json['total'] as int,
    status: json['status'] as int,
    created_at:
        const CustomDateTimeConverter().fromJson(json['created_at'] as String),
    picked_at:
        const CustomDateTimeConverter().fromJson(json['picked_at'] as String),
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'customer': instance.customer,
      'restaurant': instance.restaurant,
      'driver': instance.driver,
      'address': instance.address,
      'total': instance.total,
      'status': instance.status,
      'created_at': const CustomDateTimeConverter().toJson(instance.created_at),
      'picked_at': const CustomDateTimeConverter().toJson(instance.picked_at),
    };
