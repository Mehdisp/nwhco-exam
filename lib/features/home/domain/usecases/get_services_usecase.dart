import 'package:injectable/injectable.dart';

import '../entities/service.dart';
import '../repositories/barber_repository.dart';
import '/core/util/result.dart';

@injectable
class GetServicesUseCase {
  final BarberRepository repository;

  GetServicesUseCase(this.repository);

  /// get and return services from repository
  Future<Result<List<Service>>> call() {
    return repository.services();
  }
}
