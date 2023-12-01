import '../../domain/entities/barber.dart';
import 'barber_model.dart';

class BarbersResponse extends BarbersList {
  BarbersResponse({
    required super.count,
    required super.next,
    required super.previous,
    required super.barbers,
  });

  factory BarbersResponse.fromJson(Map<String, dynamic> json) {
    return BarbersResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      barbers: (json['results'] as List<dynamic>)
          .map((e) => BarberModel.fromJson(e))
          .toList(),
    );
  }
}
