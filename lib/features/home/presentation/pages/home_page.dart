import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/error_view.dart';
import '../cubit/home_cubit.dart';
import '../widgets/filters_list_view.dart';
import '../widgets/home_banner.dart';
import '../widgets/home_service_button.dart';
import '../widgets/search_field.dart';
import '../widgets/barbers_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    /// to know when the ScrollView reaches the end, add a listener
    /// to its controller and compare the current position and the [maxScrollExtent]
    /// if current position is gt (max - 100), then call cubit to retrieve
    /// more items from server if exists
    _scrollController.addListener(() {
      final position = _scrollController.position.pixels;
      final max = _scrollController.position.maxScrollExtent - 100;
      if (position >= max) {
        context.read<HomeCubit>().loadMoreBarbers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<HomeCubit>();

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    width: 193,
                    height: 93,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FilledButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.location_on_rounded, size: 22),
                    label: Text(
                      'Ranchview',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFC7CDD9),
                      ),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white10,
                      minimumSize: Size(100, 35),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'LOOKY',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w700,
              letterSpacing: 6,
              height: 1,
            ),
          ),
          Text(
            'Fastest Way to Find Barbers',
            style: TextStyle(
              color: Color(0x8A95ABCC),
              fontSize: 14,
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
            child: SearchField(),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeServiceButton(
                iconPath: 'assets/svg/cutter.svg',
                label: 'HAIRCUT',
              ),
              HomeServiceButton(
                iconPath: 'assets/svg/gilette.svg',
                label: 'FACE SHAVE',
              ),
              HomeServiceButton(
                iconPath: 'assets/svg/cream.svg',
                label: 'SKIN FADES',
              ),
              HomeServiceButton(
                iconPath: 'assets/svg/cream_brush.svg',
                label: 'COLORING',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
            child: HomeBanner(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (_, state) {
                final count = state.selectedServices?.length ?? 0;
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${state.totalBarbers} Barber Shop/barbers',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      icon: Icon(Icons.sort),
                      label: Text('Filters' + (count > 0 ? ' $count' : '')),
                      onPressed: () => setState(() {
                        _showFilters = !_showFilters;
                      }),
                      style: OutlinedButton.styleFrom(
                        backgroundColor:
                            _showFilters ? Colors.white : Colors.transparent,
                        foregroundColor:
                            _showFilters ? theme.primaryColor : Colors.white,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          AnimatedContainer(
            height: _showFilters ? 32 : 0,
            duration: Duration(milliseconds: 200),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (_, state) => FiltersListView(
                services: state.services,
                selectedItems: state.selectedServices,
                onItemClick: cubit.toggleFilter,
              ),
            ),
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (_, state) {
              if (state.status == HomeStatus.error) {
                return ErrorView(onTryAgainPressed: () {
                  cubit.getServices();
                  cubit.getBarbers();
                });
              } else {
                return BarbersListView(
                  barbers: state.barbers,
                  hasMoreItems: state.hasMoreItems,
                  isLoadingMore: state.isLoadingMore,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
