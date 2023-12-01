import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_barbers_usecase.dart';
import '../../domain/usecases/get_services_usecase.dart';
import '../../domain/entities/barber.dart';
import '../../domain/entities/service.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetServicesUseCase getServicesUseCase;
  final GetBarbersUseCase getBarbersUseCase;

  HomeCubit(
    this.getServicesUseCase,
    this.getBarbersUseCase,
  ) : super(HomeState.initial()) {
    getServices();
    getBarbers();
  }

  /// call [GetServicesUseCase] and checks its result
  void getServices() async {
    final result = await getServicesUseCase();

    if (result.isSuccess) {
      emit(state.copyWith(services: result.data));
    } else {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  /// call [GetBarbersUseCase] and add result list data to current
  /// barbers list in state
  void getBarbers() async {
    emit(state.copyWith(
      status: HomeStatus.loading,
      isLoadingMore: true,
    ));

    final result = await getBarbersUseCase(
      page: state.page,
      ids: state.selectedServices,
    );

    if (result.isSuccess) {
      final response = result.data!;
      final list = state.barbers..addAll(response.barbers);

      emit(state.copyWith(
        status: HomeStatus.loaded,
        barbers: list,
        totalBarbers: response.count,
        isLoadingMore: false,
        hasMoreItems: response.next != null,
      ));
    } else {
      emit(state.copyWith(
        status: HomeStatus.error,
        isLoadingMore: false,
      ));
    }
  }

  /// first checks if not any ongoing request in process
  /// and then increase page counter and call [getBarbers]
  void loadMoreBarbers() async {
    if (state.isLoadingMore ||
        !state.hasMoreItems ||
        state.status == HomeStatus.error) {
      return;
    }

    emit(state.copyWith(page: state.page + 1));

    getBarbers();
  }

  /// adds/removes service id from filtering list
  /// resets pagination info and [state.barbers] list
  /// call [getBarbers] to retrieve data based on new filtering list
  void toggleFilter(String serviceId) {
    final selectedServices = state.selectedServices ?? [];

    if (selectedServices.contains(serviceId)) {
      selectedServices.remove(serviceId);
    } else {
      selectedServices.add(serviceId);
    }

    emit(state.copyWith(
      selectedServices: selectedServices,
      hasMoreItems: true,
      page: 1,
      barbers: [],
    ));

    getBarbers();
  }
}
