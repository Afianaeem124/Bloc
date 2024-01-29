import 'package:blflutter/Model/fav_list_model.dart';
import 'package:blflutter/Repositry/fav_list_repo.dart';
import 'package:blflutter/bloc/fav_list.dart/fav_list_events.dart';
import 'package:blflutter/bloc/fav_list.dart/fav_list_state.dart';
import 'package:bloc/bloc.dart';

class FavouriteListBloc extends Bloc<FavouriteListEvent, FavouriteListState> {
  List<FavouriteListModel> favlist = [];
  List<FavouriteListModel> temfavlist = [];
  FavouriteRepository favouriteRepository;
  FavouriteListBloc(this.favouriteRepository) : super(const FavouriteListState()) {
    on<FetchFavouritelistEvent>(fetchlist);
    on<AddFavouritelistEvent>(addFavouritelistItem);
    on<SelectFavouritelistEvent>(selectFavouritelistItem);
    on<UnSelectFavouritelistEvent>(unSelectFavouritelistItem);
    on<DeleteFavouritelistEvent>(deleteFavouritelistItem);
  }
//List.from nhi use karege tu loop chalana parega
  void fetchlist(FetchFavouritelistEvent event, Emitter<FavouriteListState> emit) async {
    favlist = await favouriteRepository.fetchList();
    emit(state.copyWith(favouriteList: List.from(favlist), staTus: status.succcess));
  }

  void addFavouritelistItem(AddFavouritelistEvent event, Emitter<FavouriteListState> emit) async {
    final index = favlist.indexWhere((element) => element.Id == event.item.Id);
    favlist[index] = event.item;
    emit(state.copyWith(favouriteList: List.from(favlist)));
  }

  void selectFavouritelistItem(SelectFavouritelistEvent event, Emitter<FavouriteListState> emit) async {
    temfavlist.add(event.item);
    emit(state.copyWith(temfavouriteList: List.from(temfavlist)));
  }

  void unSelectFavouritelistItem(UnSelectFavouritelistEvent event, Emitter<FavouriteListState> emit) async {
    temfavlist.remove(event.item);
    emit(state.copyWith(temfavouriteList: List.from(temfavlist)));
  }

  void deleteFavouritelistItem(DeleteFavouritelistEvent event, Emitter<FavouriteListState> emit) async {
    for (int i = 0; i < temfavlist.length; i++) {
      favlist.remove(temfavlist[i]);
    }
    temfavlist.clear();
    emit(state.copyWith(favouriteList: List.from(favlist), temfavouriteList: List.from(temfavlist)));
  }
}
