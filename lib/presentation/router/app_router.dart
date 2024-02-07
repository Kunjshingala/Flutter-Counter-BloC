import 'package:counter/logic/cubit/counter_cubit.dart';
import 'package:counter/presentation/screen/home_screen.dart';
import 'package:counter/presentation/screen/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screen/second_screen.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const HomeScreen(
                      title: 'Home Screen', color: Colors.deepOrange),
                ));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const SecondScreen(
                    title: 'Second Screen',
                    color: Colors.grey,
                  ),
                ));

      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const ThirdScreen(
                    title: 'Third Screen',
                    color: Colors.green,
                  ),
                ));

      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
