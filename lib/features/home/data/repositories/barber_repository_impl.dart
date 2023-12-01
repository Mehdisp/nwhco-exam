import 'package:injectable/injectable.dart';

import '../models/service_model.dart';
import '/core/util/result.dart';
import '../datasources/barber_remote_data_source.dart';
import '../../domain/entities/service.dart';
import '../../domain/entities/barber.dart';
import '../../domain/repositories/barber_repository.dart';

@Injectable(as: BarberRepository)
class BarberRepositoryImpl extends BarberRepository {
  final BarberRemoteDataSource dataSource;

  BarberRepositoryImpl(this.dataSource);

  /// define a [ServiceModel] with 'is_shop' slug to put in services list
  final _shopFilter = ServiceModel(slug: 'is_shop', title: 'Shops', icon: '');

  /// get services from data source and put 'is_shop' in top of
  /// the list for future usages
  @override
  Future<Result<List<Service>>> services() {
    return performRemoteRequest(() async {
      final response = await dataSource.services();

      final services = [
        _shopFilter,
        ...response.results,
      ];

      return services;
    });
  }

  /// fetch barber/shops from data source
  /// if 'is_shop' slug exists in ids list the [isShop] parameter
  /// of datasource will be true and exclude 'is_shop' from ids to filter
  @override
  Future<Result<BarbersList>> barbers({int page = 1, List<String>? ids}) {
    return performRemoteRequest(() async {
      final isShop = ids?.contains(_shopFilter.slug);

      final response = await dataSource.barbers(
        page: page,
        isShop: isShop,
        ids: ids?.where((e) => e != _shopFilter.slug).toList(),
      );

      return response;
    });
  }
}
