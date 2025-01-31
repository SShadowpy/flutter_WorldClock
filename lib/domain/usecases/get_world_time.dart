import '../entities/world_time.dart';
import '../repositories/world_time_repository.dart';

class GetWorldTime {
  final WorldTimeRepository repository;

  GetWorldTime(this.repository);

  Future<WorldTime> call(String city) async {
    return await repository.getWorldTime(city);
  }
}
