import 'package:equatable/equatable.dart';

abstract class PostScreenEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPostEvent extends PostScreenEvents {}

class FilterListEvent extends PostScreenEvents {
  final String filterString;
  FilterListEvent(this.filterString);
}
