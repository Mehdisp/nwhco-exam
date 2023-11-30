import 'package:injectable/injectable.dart';

import '/core/util/result.dart';
import '../datasources/barber_remote_data_source.dart';
import '../../domain/entities/service.dart';
import '../../domain/entities/barber.dart';
import '../../domain/repositories/barber_repository.dart';

@Injectable(as: BarberRepository)
class BarberRepositoryImpl extends BarberRepository {
  final BarberRemoteDataSource dataSource;

  BarberRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Barber>>> barbers({bool? isShop, List<String>? ids}) {
    return performRemoteRequest(() async {
      final response = await dataSource.barbers(isShop: isShop, ids: ids);
      return response.results;
    });
  }

  @override
  Future<Result<List<Service>>> services() {
    return performRemoteRequest(() async {
      final response = await dataSource.services();
      return response.results;
    });
  }
}
