import 'package:json_annotation/json_annotation.dart';
import 'package:restaurantapp/utils/custom_date_convertor.dart';
part 'meal.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class Meal{
  int id;
   int restaurant;
    String name;
    String short_description;
    String image;
    double price;
    int quantity;

    Meal.basic();
  Meal({
    this.id,
    this.restaurant,
    this.name,
    this.short_description,
    this.image,
    this.price,
    this.quantity,
  });

  @override
  String toString() {
    return 'Meal{id:$id,restaurant:$restaurant,name:$name,short_description:$short_description,image:$image,price:$price}';
  }

  factory Meal.fromJson(Map<String, dynamic> json) =>
      _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);

  static List<Meal> fromJsonDecodedMap(List dynamicList) {
    List<Meal> mealList = [];

    if (dynamicList != null) {
      dynamicList.forEach((e) {
        Meal meal = Meal.fromJson(e);
        mealList.add(meal);
      });
    }

    return mealList;
  }

}