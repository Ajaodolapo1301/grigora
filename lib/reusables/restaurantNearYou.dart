


import 'package:flutter/material.dart';
import 'package:grigora/model/restuarants.dart';

import 'aSingleRestaurant.dart';

class RestaurantNearYou extends StatefulWidget {

  List  <RestaurantModel> resturant;

  RestaurantNearYou({this.resturant});
  @override
  _RestaurantNearYouState createState() => _RestaurantNearYouState();
}

class _RestaurantNearYouState extends State<RestaurantNearYou> {

  @override
  Widget build(BuildContext context) {

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Restaurant(
//            id:widget.billModel[index].bid,
//            newsDate:widget.billModel[index].createdAt,
            name:  widget.resturant[index].name,
            image: widget.resturant [index].image,
//            billModel: widget.billModel[index],


          );
        },
        childCount: widget.resturant.length,
      ),
    );
  }
}