part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState {
  final HomeStatus status;
  final List<Service>? services;

  final List<Barber> barbers;
  final int totalBarbers;

  final int page;
  final List<String>? selectedServices;
  final bool hasMoreItems;
  final bool isLoadingMore;

  HomeState({
    required this.status,
    required this.barbers,
    required this.page,
    this.services,
    this.selectedServices,
    this.totalBarbers = 0,
    this.hasMoreItems = true,
    this.isLoadingMore = false,
  });

  factory HomeState.initial() {
    return HomeState(
      status: HomeStatus.initial,
      barbers: [],
      page: 1,
    );
  }

  HomeState copyWith({
    HomeStatus? status,
    List<Service>? services,
    List<Barber>? barbers,
    int? page,
    int? totalBarbers,
    List<String>? selectedServices,
    bool? hasMoreItems,
    bool? isLoadingMore,
  }) {
    return HomeState(
      status: status ?? this.status,
      services: services ?? this.services,
      barbers: barbers ?? this.barbers,
      page: page ?? this.page,
      totalBarbers: totalBarbers ?? this.totalBarbers,
      selectedServices: selectedServices ?? this.selectedServices,
      hasMoreItems: hasMoreItems ?? this.hasMoreItems,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
