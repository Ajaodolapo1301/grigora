


import 'package:flutter/cupertino.dart';
import 'package:grigora/api/api.dart';
import 'package:grigora/model/restuarants.dart';

abstract class AbstractRestaurantViewModel {
  Future<Map<String, dynamic>> getRestaurants();
  Future<Map<String, dynamic>> getDetails();

}



class RestaurantState with ChangeNotifier implements AbstractRestaurantViewModel{

  //  banksLists
  List<RestaurantModel> _restaurantModel= [];
  List<RestaurantModel> get restaurantModel => _restaurantModel;
  set restaurantModel(List<RestaurantModel> restaurantModel1) {
    _restaurantModel = restaurantModel1;
    notifyListeners();
  }

  @override
  Future<Map<String,dynamic >> getRestaurants() async{

    Map<String, dynamic> result = Map();

    try{
      result = await RestaurantsImpl().getRestaurants();
      if(result["error"] == null) {
        result['error'] = true;
        result['message'] = 'An Error occurred, Please  check your internet connection and try again';
      }else{
        if(result["error"] == false){
          restaurantModel = result["restaurantList"];
        }

      }
    }catch(e){
      print(e.toString());
    }
    return result;
  }

  @override
  Future<Map<String, dynamic >> getDetails() async{
    Map<String, dynamic> result = Map();

    try{
      result = await RestaurantsImpl().getDetails();
      if(result["error"] == null) {
        result['error'] = true;
        result['message'] = 'An Error occurred, Please  check your internet connection and try again';
      }else{
        if(result["error"] == false){

        }

      }
    }catch(e){
      print(e.toString());
    }
    return result;
  }

}