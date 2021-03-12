import 'dart:convert';
import 'dart:io';

import 'package:grigora/model/featuredmodel.dart';
import 'package:http/http.dart' as http;
import 'package:grigora/model/restuarants.dart';

const baseUrl = "https://us-central1-grigora-alt.cloudfunctions.net/";

abstract class AbstractRestaurants {
  Future<Map<String, dynamic>> getRestaurants();

  Future<Map<String, dynamic>> getDetails();

}



class RestaurantsImpl implements AbstractRestaurants{
  @override
  Future<Map<String, dynamic >> getRestaurants() async{
    Map<String, dynamic> result = {};
    final String url = "$baseUrl/home";
    try {
      var response = await http.get(url).timeout(Duration(seconds: 30));
      int statusCode = response.statusCode;

      print(statusCode);
      print(response.body);

      if (statusCode != 200) {
        result["message"] = "An error occurred";
        result['error'] = true;
      } else {
        result["error"] = false;
        List<RestaurantModel> restaurantList = [];
        (jsonDecode(response.body)["restaurants"] as List).forEach((dat){
          restaurantList.add(RestaurantModel.fromJson(dat));
        });
        result['restaurantList'] = restaurantList;

      }
    }  on SocketException catch(error){


    }



    catch (error) {

      result["message"] = error.toString();
    }
    print("papapapa $result");

    return result;
  }

  @override
  Future<Map<String, dynamic >> getDetails()async {
    Map<String, dynamic> result = {};
    final String url = "$baseUrl/details";
    try {
      var response = await http.get(url).timeout(Duration(seconds: 30));
      int statusCode = response.statusCode;

      print(statusCode);
      print(response.body);

      if (statusCode != 200) {
        result["message"] = "An error occurred";
        result['error'] = true;
      } else {
        result["error"] = false;

     var details =    DetailsModel.fromJson(jsonDecode(response.body));

        result['details'] = details;

      }
    } catch (error) {

      result["message"] = error.toString();
    }
    print("papapapa $result");

    return result;
  }

}