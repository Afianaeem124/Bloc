import 'package:blflutter/bloc/counter/counter_bloc.dart';
import 'package:blflutter/bloc/counter/counter_events.dart';
import 'package:blflutter/bloc/counter/counter_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('buildstart');
    }
    return Scaffold(
        appBar: AppBar(),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            if (kDebugMode) {
              print('build');
            }
            return Text(
              state.count.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            );
          }),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: const Text('Increment')),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: const Text('Decrement')),
            ],
          )
        ]));
  }
}
