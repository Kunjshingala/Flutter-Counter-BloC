import 'package:counter/presentation/screen/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundIconButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    // OR
                    // context.bloc<CounterCubit>().increment();
                  },
                  icon: Icons.add,
                  color: widget.color,
                ),
                RoundIconButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).reset();
                    // OR
                    // context.bloc<CounterCubit>().increment();
                  },
                  icon: Icons.refresh_sharp,
                  color: widget.color,
                ),
                RoundIconButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // OR
                    // context.bloc<CounterCubit>().increment();
                  },
                  color: widget.color,
                  icon: Icons.remove,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
