import 'package:equatable/equatable.dart';
import 'package:blflutter/Model/fav_list_model.dart';

abstract class FavouriteListEvent extends Equatable {
  const FavouriteListEvent();
  @override
  List<Object?> get props => [];
}

class AddFavouritelistEvent extends FavouriteListEvent {
  final FavouriteListModel item;
  const AddFavouritelistEvent({required this.item});
}

class SelectFavouritelistEvent extends FavouriteListEvent {
  final FavouriteListModel item;
  const SelectFavouritelistEvent({required this.item});
}

class UnSelectFavouritelistEvent extends FavouriteListEvent {
  final FavouriteListModel item;
  const UnSelectFavouritelistEvent({required this.item});
}

class FetchFavouritelistEvent extends FavouriteListEvent {}

class DeleteFavouritelistEvent extends FavouriteListEvent {}
