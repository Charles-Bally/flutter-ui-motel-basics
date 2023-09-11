class Hotel {
  final int id;
  final String type;
  final String name;
  final String location;
  final String description;
  final String secondDescription;
  final int price;
  final double stars;
  final int reviews;
  final String img;
  final List<Amenity> amenities;

  Hotel({
    required this.id,
    required this.type,
    required this.name,
    required this.location,
    required this.description,
    required this.secondDescription,
    required this.price,
    required this.stars,
    required this.reviews,
    required this.img,
    required this.amenities,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    final List<Amenity> amenityList = (json['amenities'] as List)
        .map((amenityJson) => Amenity.fromJson(amenityJson))
        .toList();

    return Hotel(
      id: json['id'] as int,
      type: json['type'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      secondDescription: json['second-description'] as String,
      price: json['price'] as int,
      stars: json['stars'] as double,
      reviews: json['reviews'] as int,
      img: json['img'] as String,
      amenities: amenityList,
    );
  }
}

class Amenity {
  final int id;
  final String name;
  final String icon;

  Amenity({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Amenity.fromJson(Map<String, dynamic> json) {
    return Amenity(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
    );
  }
}
