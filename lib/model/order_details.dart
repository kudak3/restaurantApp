import 'package:json_annotation/json_annotation.dart';
import 'package:restaurantapp/utils/custom_date_convertor.dart';
part 'order_details.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class OrderDetails{
  int id;
  int order;
    int meal;
    int quantity;
    double sub_total;

    OrderDetails.basic();
  OrderDetails(
      {this.id,
      this.order,
      this.meal,
      this.quantity,
      this.sub_total,
     });


     @override
  String toString() {
    return 'OrderDetails{order:$order,meal:$meal,quantity:$quantity,sub_total:$sub_total}';
  }

  factory OrderDetails.fromJson(Map<String, dynamic> json) => _$OrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);

  static List<OrderDetails> fromJsonDecodedMap(List dynamicList) {
    List<OrderDetails> orderList = [];

    if (dynamicList != null) {
      dynamicList.forEach((e) {
        OrderDetails order = OrderDetails.fromJson(e);
        orderList.add(order);
      });
    }

    return orderList;
  }

}