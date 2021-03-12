import 'package:flutter/material.dart';
import 'package:grigora/constants/colorConstants.dart';
import 'package:grigora/model/restuarants.dart';

class CategoriesEvents extends StatelessWidget {
  List  restaurant = [];
  CategoriesEvents({this.restaurant});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 140,
      width: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: restaurant.map((e){
          return Events(
            image: e.image,
          );

  }).toList(),


      ),
    );
  }
}



class Events extends StatelessWidget {

  final image;
  Events({this.image});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.only(right: 0 , left: 20.0),
        child: Container(

          decoration: BoxDecoration(
            color: kPrimaryColor,
//            border: Border.all(color: Colors.white.withOpacity(0.1)),
              borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          width: 200,
          child: Image.network(image , fit:BoxFit.cover),
        ),
      ),
    );
  }
}