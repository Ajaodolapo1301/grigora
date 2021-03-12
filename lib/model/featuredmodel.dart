

import 'dart:convert';

class FeaturedModel{
  int id;
  int restaurant_id;
  int parent_cuisine_id;
  int cuisine_id;



  String name;
  String french_name;
  String description;
  String french_description;

  String image;
  String price;
  int offer_price;
  String approx_prep_time;
  String in_offer;


  String pure_veg;
  String approved;
  String featured;
  String status;


  FeaturedModel({this.image, this.name, this.approved, this.approx_prep_time, this.cuisine_id, this.description, this.featured, this.french_description, this.french_name, this.id, this.in_offer, this.offer_price, this.parent_cuisine_id, this.price, this.pure_veg, this.restaurant_id, this.status});

  factory FeaturedModel.fromJson(Map<String, dynamic>json) => FeaturedModel(
      image: json["image"],
      cuisine_id: json["cuisine_id"],
    parent_cuisine_id: json["parent_cuisine_id"],
    description: json["description"],
    featured: json["featured"],
    french_description: json["french_description"],
    id: json["id"],
    price: json["price"],
    name: json["name"],
      );

}










 class DetailsModel {
   int delivery_fee;
   int restaurant_id;
    String opening_time;
   String restaurant_name;
   String restaurant_profile_image;
   String restaurant_image;
   String cuisines;
   String closing_time;
   int total_rating;
   String address;
   List<FeaturedModel> featureModel;

   DetailsModel(
       {this.restaurant_id, this.cuisines, this.delivery_fee, this.restaurant_image, this.restaurant_name, this.restaurant_profile_image, this.featureModel, this.opening_time, this.closing_time, this.total_rating, this.address});


   DetailsModel.fromJson(Map<String, dynamic> json) {
     if (json['featured_items'] != null) {
       featureModel = new List<FeaturedModel>();
       json['featured_items'].forEach((v) {
         featureModel.add(new FeaturedModel.fromJson(v));
       });
     }
     delivery_fee = json["delivery_fee"];
     restaurant_name = json["restaurant_name"];
     restaurant_profile_image = json["restaurant_profile_image"];
     restaurant_id = json["restaurant_id"];
     cuisines = json["cuisines"];
     restaurant_image = json["restaurant_image"];
     closing_time = json["closing_time"];
    address = json["address"];
     opening_time = json['opening_time'];
     total_rating = json["total_rating"];

   }

 }

//delivery_fee: 250,
//restaurant_id: 3,
//restaurant_name: "Demo Restaurant",
//restaurant_profile_image: "https://grigora.net/images/profile_image/1603881081.jpg",
//restaurant_image: "https://grigora.net/images/profile/1603881081.jpg",
//cuisines: "Bakery & Cakes,Fries & Grills,Fast Foods,Alcohol",
//total_rating: 5,
//total_review: 6,
//veg: "0",
//pickup: "1",
//table_booking: "1",
//no_of_seats: 10,
//full_time: "0",
//opening_time: "06:30:00",
//latitude: "9.0814698",
//longitude: "7.484611399999999",
//address: "167 Adetokunbo Ademola Cres, Wuse, Abuja, Nigeria",
//french_address: "167 Adetokunbo Ademola Cres, Wuse, Abuja, Nigéria",
//closing_time: "21:00:00",
//estimated_preparing_time: "12",