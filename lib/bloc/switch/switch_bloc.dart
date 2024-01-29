import 'package:blflutter/bloc/switch/switch_events.dart';
import 'package:blflutter/bloc/switch/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchState> {
  SwitchBloc() : super(SwitchState(sliderr: 1)) {
    on<EnableOrDisableNotification>(_enableDisableSwitch);
    on<SliderEvent>(_slider);
  }

  void _enableDisableSwitch(EnableOrDisableNotification events, Emitter<SwitchState> emit) {
    emit(state.copyWith(iswitch: !state.isSwitch));
  }

  void _slider(SliderEvent events, Emitter<SwitchState> emit) {
    emit(state.copyWith(slide: events.slider.toDouble()));
  }
}
