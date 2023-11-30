import 'service_model.dart';

class ServicesResponse {
  final List<ServiceModel> results;

  ServicesResponse({
    required this.results,
  });

  factory ServicesResponse.fromJson(Map<String, dynamic> json) {
    return ServicesResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => ServiceModel.fromJson(e))
          .toList(),
    );
  }
}
