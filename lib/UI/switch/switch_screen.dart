import 'package:blflutter/bloc/switch/switch_bloc.dart';
import 'package:blflutter/bloc/switch/switch_events.dart';
import 'package:blflutter/bloc/switch/switch_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notification'),
                BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      if (kDebugMode) {
                        print('builrr');
                      }
                      return Switch(
                          value: state.isSwitch,
                          onChanged: (value) {
                            context.read<SwitchBloc>().add(EnableOrDisableNotification());
                          });
                    })
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
                buildWhen: (previous, current) => previous.sliderr != current.sliderr,
                builder: (context, state) {
                  if (kDebugMode) {
                    print('bui');
                  }
                  return Container(
                    height: 160,
                    color: Colors.red.withOpacity(state.sliderr),
                  );
                }),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              if (kDebugMode) {
                print('buil');
              }
              return Slider(
                  value: state.sliderr,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  });
            })
          ],
        ),
      ),
    );
  }
}
