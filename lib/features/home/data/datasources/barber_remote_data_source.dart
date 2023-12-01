import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:nwhco_exam/features/home/data/models/service_model.dart';

import '../models/barbers_response.dart';
import '../models/services_response.dart';

abstract class BarberRemoteDataSource {

  /// retrieve services from api
  Future<ServicesResponse> services();

  /// get barbers or barber shops list from api
  /// [page] for page number in pagination
  /// [isShop] pass true for retrieve barber shops or false for barbers list
  /// [ids] the ids of services to filter list
  Future<BarbersResponse> barbers({
    int page = 1,
    bool? isShop,
    List<String>? ids,
  });
}

@Injectable(as: BarberRemoteDataSource)
class BarberRemoteDataSourceImpl extends BarberRemoteDataSource {
  final Dio dio;

  BarberRemoteDataSourceImpl(this.dio);

  @override
  Future<BarbersResponse> barbers(
      {int page = 1, bool? isShop, List<String>? ids}) async {
    final response = await dio.get(
      '/barbers/home',
      queryParameters: {
        'page': page,
        'is_shop': isShop,
        'services': ids?.join(','),
      },
    );

    return BarbersResponse.fromJson(response.data);
  }

  @override
  Future<ServicesResponse> services() async {
    final response = await dio.get('/services');

    return ServicesResponse.fromJson(response.data);
  }
}
