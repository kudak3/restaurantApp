import 'package:json_annotation/json_annotation.dart';
import 'package:restaurantapp/utils/custom_date_convertor.dart';
part 'restaurant.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class Restaurant {
  int id;
  int user;
  String name;
  String phone;
  String address;
  String logo;

  Restaurant.basic();
  Restaurant({
    this.id,
    this.user,
    this.name,
    this.phone,
    this.address,
    this.logo,
  });

  @override
  String toString() {
    return 'Restaurant{user:$user,name:$name,phone:$phone,address:$address,logo:$logo}';
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

  static List<Restaurant> fromJsonDecodedMap(List dynamicList) {
    List<Restaurant> restaurantList = [];

    if (dynamicList != null) {
      dynamicList.forEach((e) {
        Restaurant restaurant = Restaurant.fromJson(e);
        restaurantList.add(restaurant);
      });
    }

    return restaurantList;
  }
}
