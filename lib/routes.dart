import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/di.dart';
import 'features/home/presentation/cubit/home_cubit.dart';
import 'features/home/presentation/pages/home_page.dart';

final routes = <String, Widget Function(BuildContext)>{
  'home': (_) => BlocProvider.value(
        value: getIt<HomeCubit>(),
        child: HomePage(),
      ),
};
