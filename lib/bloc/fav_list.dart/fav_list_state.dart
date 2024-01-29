import 'package:blflutter/Model/fav_list_model.dart';
import 'package:equatable/equatable.dart';

enum status { laoding, succcess, failure }

class FavouriteListState extends Equatable {
  final status staTus;
  final List favouriteList;
  final List temfavouriteList;
  const FavouriteListState({
    this.favouriteList = const [],
    this.staTus = status.laoding,
    this.temfavouriteList = const [],
  });

  FavouriteListState copyWith({
    List<FavouriteListModel>? favouriteList,
    status? staTus,
    List<FavouriteListModel>? temfavouriteList,
  }) {
    return FavouriteListState(
      favouriteList: favouriteList ?? this.favouriteList,
      staTus: staTus ?? this.staTus,
      temfavouriteList: temfavouriteList ?? this.temfavouriteList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [favouriteList, staTus, temfavouriteList];
}
