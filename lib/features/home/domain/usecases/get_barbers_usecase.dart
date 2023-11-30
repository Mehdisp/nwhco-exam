import 'package:injectable/injectable.dart';

import '../entities/barber.dart';
import '../repositories/barber_repository.dart';
import '/core/util/result.dart';

@injectable
class GetBarbersUseCase {
  final BarberRepository repository;

  GetBarbersUseCase(this.repository);

  Future<Result<List<Barber>>> call() {
    return repository.barbers();
  }
}
