import '../../domain/entities/barber.dart';

class BarberModel extends Barber {
  BarberModel({
    required super.slug,
    required super.fullName,
    required super.isShop,
    required super.avatar,
    required super.address,
    required super.lat,
    required super.lon,
    required super.rate,
    required super.distance,
    required super.isBookmarked,
  });

  factory BarberModel.fromJson(Map<String, dynamic> json) {
    return BarberModel(
      slug: json['slug'],
      fullName: json['fullname'],
      isShop: json['is_shop'],
      avatar: json['avatar'],
      address: json['address'],
      lat: json['lat'],
      lon: json['lon'],
      rate: json['rate'],
      distance: json['distance'],
      isBookmarked: json['is_bookmarked'],
    );
  }
}
