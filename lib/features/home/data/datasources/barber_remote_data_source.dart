import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/barbers_response.dart';
import '../models/services_response.dart';

abstract class BarberRemoteDataSource {
  Future<ServicesResponse> services();

  Future<BarbersResponse> barbers({
    bool? isShop,
    List<String>? ids,
  });
}

@Injectable(as: BarberRemoteDataSource)
class BarberRemoteDataSourceImpl extends BarberRemoteDataSource {
  final Dio dio;

  BarberRemoteDataSourceImpl(this.dio);

  @override
  Future<BarbersResponse> barbers({bool? isShop, List<String>? ids}) async {
    final response = await dio.get('/barbers/home', queryParameters: {
      'is_shop': isShop,
      'services': ids?.join(','),
    });

    return BarbersResponse.fromJson(response.data);
  }

  @override
  Future<ServicesResponse> services() async {
    final response = await dio.get('/services');

    return ServicesResponse.fromJson(response.data);
  }
}
