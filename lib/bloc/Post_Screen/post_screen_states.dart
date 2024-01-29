import 'package:blflutter/Model/post_model.dart';
import 'package:blflutter/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostScreenState extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> tempostList;
  final List<PostModel> postList;
  final String message;
  final String searchmessage;

  const PostScreenState({this.postStatus = PostStatus.loading, this.postList = const <PostModel>[], this.message = '', this.searchmessage = '', this.tempostList = const <PostModel>[]});

  PostScreenState copyWith({PostStatus? postStatus, List<PostModel>? postList, String? message, String? searchmessage, List<PostModel>? tempostList}) {
    return PostScreenState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      tempostList: tempostList ?? this.tempostList,
      message: message ?? this.message,
      searchmessage: searchmessage ?? this.searchmessage,
    );
  }

  @override
  List<Object> get props => [postStatus, postList, message, tempostList, searchmessage];
}
