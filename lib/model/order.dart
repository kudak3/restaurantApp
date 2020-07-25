import 'package:json_annotation/json_annotation.dart';
import 'package:restaurantapp/model/customer.dart';
import 'package:restaurantapp/utils/custom_date_convertor.dart';
part 'order.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class Order {
  int id;
  Customer customer;
  int restaurant;
  int driver;
  String address;
  int total;
  int status;
  DateTime created_at;
  DateTime picked_at;

  Order.basic();
  Order(
      {this.id,
      this.customer,
      this.restaurant,
      this.driver,
      this.address,
      this.total,
      this.status,
      this.created_at,
      this.picked_at});

  @override
  String toString() {
    return 'Order{customer:$customer,restaurant:$restaurant,driver:$driver,address:$address,total:$total,status:$status,created_at:$created_at,picked_at:$picked_at}';
  }

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  static List<Order> fromJsonDecodedMap(List dynamicList) {
    List<Order> orderList = [];

    if (dynamicList != null) {
      dynamicList.forEach((e) {
        Order order = Order.fromJson(e);
        orderList.add(order);
      });
    }

    return orderList;
  }
}
