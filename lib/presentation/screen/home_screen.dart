import 'package:counter/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/enum.dart';
import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          context.read<CounterCubit>().increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          context.read<CounterCubit>().decrement();
        } else if (state is InternetDisconnected) {
          context.read<CounterCubit>().reset();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.color,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.wifi) {
                    return const Text('WI-FI',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35));
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.mobile) {
                    return const Text('MOBILE DATA',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35));
                  } else if (state is InternetDisconnected) {
                    return const Text('DISCONNECTED',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35));
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.incremented == 1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color(0xff007e33),
                        duration: Duration(milliseconds: 200),
                        content: Center(child: Text('Incremented')),
                      ),
                    );
                  } else if (state.incremented == -1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color(0xffcc0000),
                        duration: Duration(milliseconds: 200),
                        content: Center(child: Text('Decremented')),
                      ),
                    );
                  } else if (state.incremented == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Color(0xffFFA500),
                        duration: Duration(milliseconds: 200),
                        content: Center(child: Text('Reset')),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              const SizedBox(
                height: 32,
                width: double.infinity,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // RoundIconButton(
                  //   onPressed: () {
                  //     BlocProvider.of<CounterCubit>(context).increment();
                  //     // OR
                  //     // context.bloc<CounterCubit>().increment();
                  //   },
                  //   icon: Icons.add,
                  //   color: widget.color,
                  // ),
                  // RoundIconButton(
                  //   onPressed: () {
                  //     BlocProvider.of<CounterCubit>(context).reset();
                  //     // OR
                  //     // context.bloc<CounterCubit>().reset();
                  //   },
                  //   icon: Icons.refresh_sharp,
                  //   color: widget.color,
                  // ),
                  // RoundIconButton(
                  //   onPressed: () {
                  //     BlocProvider.of<CounterCubit>(context).decrement();
                  //     // OR
                  //     // context.bloc<CounterCubit>().decrement();
                  //   },
                  //   icon: Icons.remove,
                  //   color: widget.color,
                  // ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    elevation: 8,
                    color: widget.color,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/second');
                    },
                    child: const Text("Go To Second Screen"),
                  ),
                  MaterialButton(
                    elevation: 8,
                    color: widget.color,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/third');
                    },
                    child: const Text("Go To Third Screen"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
