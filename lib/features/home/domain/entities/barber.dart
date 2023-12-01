import 'package:equatable/equatable.dart';

class BarbersList extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<Barber> barbers;

  BarbersList({
    required this.count,
    required this.barbers,
    required this.next,
    required this.previous,
  });

  @override
  List<Object?> get props => [count, next, barbers];
}

class Barber extends Equatable {
  final String slug;
  final String fullName;
  final bool isShop;
  final String avatar;
  final String address;
  final double lat;
  final double lon;
  final double rate;
  final double distance;
  final bool isBookmarked;

  Barber({
    required this.slug,
    required this.fullName,
    required this.isShop,
    required this.avatar,
    required this.address,
    required this.lat,
    required this.lon,
    required this.rate,
    required this.distance,
    required this.isBookmarked,
  });

  @override
  List<Object?> get props => [
        slug,
        fullName,
        isShop,
        avatar,
        address,
        lat,
        lon,
        rate,
        distance,
        isBookmarked,
      ];
}
