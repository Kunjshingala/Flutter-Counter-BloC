import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../constants/enum.dart';
import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  // Constructor
  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0)) {
    monitorInternetCubit();
  }

  StreamSubscription<InternetState> monitorInternetCubit() {
    return internetStreamSubscription = internetCubit.stream.listen(
      (internetState) {
        if (internetState is InternetConnected &&
            internetState.connectionType == ConnectionType.wifi) {
          increment();
        } else if (internetState is InternetConnected &&
            internetState.connectionType == ConnectionType.mobile) {
          decrement();
        } else if (internetState is InternetDisconnected) {
          reset();
        }
      },
    );
  }

  void increment() {
    emit(CounterState(counterValue: state.counterValue + 1, incremented: 1));
  }

  void reset() {
    int newValue = state.counterValue = 0;
    emit(CounterState(counterValue: newValue, incremented: 0));
  }

  void decrement() {
    emit(CounterState(counterValue: state.counterValue - 1, incremented: -1));
  }

  @override
  Future<void> close() {
// TODO: implement close
    internetStreamSubscription.cancel();
    return super.close();
  }
}
