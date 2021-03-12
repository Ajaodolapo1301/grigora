


class Cuisine {
  String name;
  String french_name;
  String description;
  String french_description;
  String image;
  String icon;
  String background_icon;
  String status;
  String created_at;
  bool selected;
  int id;

  Cuisine({this.name, this.created_at, this.image, this.background_icon, this.description, this.french_description, this.french_name, this.icon, this.id, this.selected, this.status});


 factory Cuisine.fromJson(Map<String, dynamic> json)=> Cuisine(
   name: json["name"],
   french_name: json["french_name"],
   description: json['description'],
   french_description: json["french_description"],
   icon: json["icon"],
   image: json["image"],
   background_icon: json["background_icon"],
   selected: json["selected"],
   id: json["id"],
   status: json["status"],
   created_at: json["created_at"]
 );


}

