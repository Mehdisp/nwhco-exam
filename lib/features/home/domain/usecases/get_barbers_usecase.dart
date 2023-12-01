import 'package:injectable/injectable.dart';

import '../entities/barber.dart';
import '../repositories/barber_repository.dart';
import '/core/util/result.dart';

@injectable
class GetBarbersUseCase {
  final BarberRepository repository;

  GetBarbersUseCase(this.repository);

  /// get and return barbers/shops from repository
  Future<Result<BarbersList>> call({int page = 1, List<String>? ids}) {
    return repository.barbers(page: page, ids: ids);
  }
}
