

class Promo {
  String name;
  String french_name;
  String description;
  String french_description;
  String image;
  String code;
  int id;

  Promo({this.name, this.image, this.description, this.french_description, this.french_name, this.code});


  factory Promo.fromJson(Map<String, dynamic> json)=>
      Promo(
        name: json["name"],
        french_name: json["french_name"],
        description: json['description'],
        french_description: json["french_description"],
        image: json["image"],
        code: json["code"],

      );
}