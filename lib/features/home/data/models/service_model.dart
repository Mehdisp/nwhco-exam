import '../../domain/entities/service.dart';

class ServiceModel extends Service {
  ServiceModel({
    required super.slug,
    required super.title,
    required super.icon,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      title: json['title'],
      icon: json['icon'],
      slug: json['slug'],
    );
  }
}
