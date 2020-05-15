import 'package:json_annotation/json_annotation.dart';
import 'package:restaurantapp/utils/custom_date_convertor.dart';
part 'customer.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
 class Customer{
   int id;
 int user;
   String  avatar;
   String phone;
    String address;

    Customer.basic();
Customer({
    this.id,
    this.user,
    this.avatar,
    this.phone,
    this.address,
   
  });

  @override
  String toString() {
    return 'Customer{user:$user,avatar:$avatar,phone:$phone,address:$address}';
  }

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  static List<Customer> fromJsonDecodedMap(List dynamicList) {
    List<Customer> customerList = [];

    if (dynamicList != null) {
      dynamicList.forEach((e) {
        Customer customer = Customer.fromJson(e);
        customerList.add(customer);
      });
    }

    return customerList;
  }

 }
 

