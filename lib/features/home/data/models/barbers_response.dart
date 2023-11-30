import 'barber_model.dart';

class BarbersResponse {
  int count;
  String? next;
  String? previous;
  List<BarberModel> results;

  BarbersResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory BarbersResponse.fromJson(Map<String, dynamic> json) {
    return BarbersResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>)
          .map((e) => BarberModel.fromJson(e))
          .toList(),
    );
  }
}
