

class RestaurantModel{
  String name;
  String french_name;
  String pickup;
  String french_address;
  String image;
  String address;
  int id;
  int preparing_time;

  int average_rating;
  int total_rating;
  String  table_booking;
  bool busy_status;
  var no_of_seats;


  RestaurantModel({this.id, this.address, this.name, this.french_name, this.image, this.french_address, this.average_rating, this.pickup, this.busy_status, this.no_of_seats, this.preparing_time, this.table_booking, this.total_rating});
  factory RestaurantModel.fromJson(Map<String, dynamic> json)=> RestaurantModel(
      name: json["name"],
      french_name: json["french_name"],
      pickup: json['pickup'],
      french_address: json["french_address"],
      address: json["address"],
      image: json["image"],
      preparing_time: json["preparing_time"],
      no_of_seats: json["no_of_seats"],
      id: json["id"],
      busy_status: json["busy_status"],
  table_booking: json["table_booking"],
    total_rating: json["total_rating"],
    average_rating: json["average_rating"]
  );
}










