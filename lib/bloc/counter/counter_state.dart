import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  final int count;
  CounterState({this.count = 0});

  CounterState copywith({int? count}) {
    return CounterState(count: count ?? this.count);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [count];
}
