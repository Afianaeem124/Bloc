import 'package:equatable/equatable.dart';

class FavouriteListModel extends Equatable {
  final String Id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;

  const FavouriteListModel({required this.Id, required this.value, this.isDeleting = false, this.isFavourite = false});
  FavouriteListModel copyWith({String? Id, String? value, bool? isDeleting, bool? isfav}) {
    return FavouriteListModel(Id: Id ?? this.Id, value: value ?? this.value, isDeleting: isDeleting ?? this.isDeleting, isFavourite: isfav ?? isFavourite);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [Id, value, isDeleting, isFavourite];
}
