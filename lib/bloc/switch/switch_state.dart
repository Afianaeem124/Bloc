import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final bool isSwitch;
  final double sliderr;
  const SwitchState({this.isSwitch = false, this.sliderr = 1.0});

  SwitchState copyWith({bool? iswitch, double? slide}) {
    return SwitchState(isSwitch: iswitch ?? isSwitch, sliderr: slide ?? sliderr);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch, sliderr];
}
