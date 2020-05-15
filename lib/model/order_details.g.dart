// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) {
  return OrderDetails(
    id: json['id'] as int,
    order: json['order'] as int,
    meal: json['meal'] as int,
    quantity: json['quantity'] as int,
    sub_total: (json['sub_total'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order': instance.order,
      'meal': instance.meal,
      'quantity': instance.quantity,
      'sub_total': instance.sub_total,
    };
