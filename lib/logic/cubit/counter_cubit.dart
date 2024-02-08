import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // Constructor
  CounterCubit() : super(CounterState(counterValue: 0));

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
}
