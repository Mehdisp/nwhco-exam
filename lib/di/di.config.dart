// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nwhco_exam/di/di.dart' as _i10;
import 'package:nwhco_exam/features/home/data/datasources/barber_remote_data_source.dart'
    as _i4;
import 'package:nwhco_exam/features/home/data/repositories/barber_repository_impl.dart'
    as _i6;
import 'package:nwhco_exam/features/home/domain/repositories/barber_repository.dart'
    as _i5;
import 'package:nwhco_exam/features/home/domain/usecases/get_barbers_usecase.dart'
    as _i7;
import 'package:nwhco_exam/features/home/domain/usecases/get_services_usecase.dart'
    as _i8;
import 'package:nwhco_exam/features/home/presentation/cubit/home_cubit.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final diModule = _$DiModule();
    gh.singleton<_i3.Dio>(diModule.dio);
    gh.factory<_i4.BarberRemoteDataSource>(
        () => _i4.BarberRemoteDataSourceImpl(gh<_i3.Dio>()));
    gh.factory<_i5.BarberRepository>(
        () => _i6.BarberRepositoryImpl(gh<_i4.BarberRemoteDataSource>()));
    gh.factory<_i7.GetBarbersUseCase>(
        () => _i7.GetBarbersUseCase(gh<_i5.BarberRepository>()));
    gh.factory<_i8.GetServicesUseCase>(
        () => _i8.GetServicesUseCase(gh<_i5.BarberRepository>()));
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(
          gh<_i8.GetServicesUseCase>(),
          gh<_i7.GetBarbersUseCase>(),
        ));
    return this;
  }
}

class _$DiModule extends _i10.DiModule {}
