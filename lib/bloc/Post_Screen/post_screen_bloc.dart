import 'package:blflutter/Model/post_model.dart';
import 'package:blflutter/Repositry/post_repo.dart';
import 'package:blflutter/bloc/Post_Screen/Post_screen_events.dart';
import 'package:blflutter/bloc/Post_Screen/post_screen_states.dart';
import 'package:blflutter/utils/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

class PostScreenBloc extends Bloc<PostScreenEvents, PostScreenState> {
  List<PostModel> templist = [];
  PostRepo postRepo = PostRepo();
  PostScreenBloc() : super(const PostScreenState()) {
    on<FetchPostEvent>(fetchPost);
    on<FilterListEvent>(_filterlist);
  }

  void fetchPost(FetchPostEvent event, Emitter<PostScreenState> emit) async {
    await postRepo.fetchAPI().then((value) {
      emit(
        state.copyWith(postStatus: PostStatus.success, message: 'Success', postList: value),
      );
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(postStatus: PostStatus.failuer, message: error.toString()));
    });
  }

  void _filterlist(FilterListEvent event, Emitter<PostScreenState> emit) async {
    if (event.filterString.isEmpty) {
      emit(state.copyWith(tempostList: [], searchmessage: ''));
    } else {
      templist = state.postList.where((element) => element.email.toString().toLowerCase().contains(event.filterString.toString().toLowerCase())).toList();
      if (templist.isEmpty) {
        emit(state.copyWith(tempostList: templist, searchmessage: 'No Data Found'));
      } else {
        emit(state.copyWith(tempostList: templist, searchmessage: ''));
      }
    }
  }
}
