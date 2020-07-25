import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurantapp/model/api_response.dart';
import 'package:restaurantapp/model/meal.dart';

import 'package:geolocator/geolocator.dart';
import 'package:restaurantapp/service/customer_service.dart';

import 'order_page.dart';

class CustomerHomePage extends StatefulWidget {
  @override
  _CustomerHomePage createState() => _CustomerHomePage();
}

class _CustomerHomePage extends State<CustomerHomePage> {
  var _isSelected = false;
  Position currentPosition;

  bool isLoading = false;
  bool _isLoading = false;

  CustomerService get customerService => GetIt.I<CustomerService>();

  List<Meal> meals = [
    Meal(
        id: 1,
        name: "rice and chicken",
        short_description:
            "A meal containing richly cooked rice and nicely cooked chicken",
        price: 200.0,
        quantity: 1),
    Meal(
        id: 2,
        name: "sadza and beef",
        short_description:
            "A traditionally cooked meal made from the staple food of the country and beef stew",
        price: 90.0,
        quantity: 1),
    Meal(
        id: 3,
        name: "chips and chicken",
        short_description:
            "A meal containing fried potatoes and a piece of roasted chicken",
        price: 50.0,
        quantity: 1),
    Meal(
        id: 4,
        name: "bread and coffee",
        short_description: "A cup of coffee and 4 slices of bread with butter",
        price: 80.0,
        quantity: 1),
    Meal(
        id: 5,
        name: "beef burger",
        short_description: "A burger with beef and custard creams and lettuce",
        price: 30.0,
        quantity: 1),
    Meal(
        id: 6,
        name: "pizzaroni",
        short_description:
            "A meal containing pizza and mixed with macaronni and salad cream",
        price: 130.0,
        quantity: 1),
  ];
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  bool selected5 = false;
  bool selected6 = false;

  double totalAmount = 0.0;

  List<Meal> _selectedMeals = [];
  APIResponse<List<Meal>> _apiResponse;

  getMeals() async {
    setState(() {
      isLoading = true;
    });
    _apiResponse = await customerService.getMeals();

    setState(() {
      isLoading = false;
    });
  }

  _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPosition = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Page'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              isLoading
                  ? (Center(
                      child: CircularProgressIndicator(),
                    ))
                  : Expanded(
                      child: ListView(
                          padding: EdgeInsets.all(10.0),
                          children: meals
                              .map((meal) => mealCard(meal, colorScheme))
                              .toList()),
                    ),
              SizedBox(
                height: 10.0,
              ),
              _buildTotals()
            ],
          ),
          _isLoading
              ? Container(
                  height: 50,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  height: 0,
                  width: 0,
                )
        ],
      ),
    );
  }

  Widget mealCard(Meal _meal, ColorScheme colorScheme) => Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onLongPress: () => setState(() {
            _isSelected = !_isSelected;
            _selectedMeals.add(_meal);
          }),
          splashColor: colorScheme.onSurface.withOpacity(0.12),
          child: Stack(
            children: <Widget>[
              Container(
                color: _isSelected
                    ? colorScheme.primary.withOpacity(0.08)
                    : Colors.transparent,
              ),
              Row(
                children: <Widget>[
                  const SizedBox(width: 10.0),
                  // Container(
                  //     height: 80.0,
                  //     child: PNetworkImage(
                  //       _meal.image,
                  //       height: 80.0,
                  //     )),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Container(
                      height: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _meal.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0),
                          ),
                          Text(
                            _meal.short_description,
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "\$" + " " + _meal.price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  _isSelected
                      ? Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.add_circle),
                              color: Colors.green,
                              onPressed: () {
                                setState(() {
                                  _meal.quantity++;
                                  totalAmount += _meal.price;
                                });
                              },
                            ),
                            Text(
                              _meal.quantity.toString(),
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.remove_circle,
                              ),
                              color: Colors.green,
                              onPressed: () {
                                setState(() {
                                  if (_meal.quantity > 1) {
                                    _meal.quantity--;
                                    totalAmount -= _meal.price;
                                  }
                                });
                              },
                            )
                          ],
                        )
                      : SizedBox(width: 10.0),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 8, right: 50, bottom: 8, top: 8),
                  child: Icon(
                    Icons.shopping_cart,
                    color:
                        _isSelected ? colorScheme.primary : Colors.transparent,
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget _buildTotals() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding:
          EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            color: Colors.purple,
            onPressed: () async {
              await _getCurrentLocation();
              // _selectionConfirmation();

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => OrderPage(
                          meals: _selectedMeals,
                          totalAmount: totalAmount,
                          currentPosition: currentPosition,
                        )),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("Continue to Checkout",
                    style: TextStyle(color: Colors.white)),
                Text("\$" + totalAmount.toString(),
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectionConfirmation() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your order has been submited.'),
                Text('It will be delivered soon'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
