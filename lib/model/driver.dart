import 'package:json_annotation/json_annotation.dart';
import 'package:restaurantapp/utils/custom_date_convertor.dart';
part 'driver.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class Driver {
  int id;
   int user;
    String avatar;
    String phone;
    String address;
    String location;

Driver.basic();
  Driver({
    this.id,
    this.user,
    this.avatar,
    this.phone,
    this.address,
    this.location,
  });

  @override
  String toString() {
    return 'Driver{user:$user,avatar:$avatar,phone:$phone,address:$address,location:$location}';
  }

  factory Driver.fromJson(Map<String, dynamic> json) =>
      _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);

  static List<Driver> fromJsonDecodedMap(List dynamicList) {
    List<Driver> driverList = [];

    if (dynamicList != null) {
      dynamicList.forEach((e) {
        Driver driver = Driver.fromJson(e);
        driverList.add(driver);
      });
    }

    return driverList;
  }
}