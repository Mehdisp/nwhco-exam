import '/core/domain/base_repository.dart';
import '/core/util/result.dart';
import '../entities/barber.dart';
import '../entities/service.dart';

abstract class BarberRepository extends BaseRepository {
  Future<Result<List<Service>>> services();

  Future<Result<BarbersList>> barbers({int page = 1, List<String>? ids});
}
