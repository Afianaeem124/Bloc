part of 'imagepicker_bloc.dart';

class ImagepickerState extends Equatable {
  final XFile? file;
  const ImagepickerState({this.file});

  ImagepickerState copyWith(XFile? xFile, {XFile? file}) {
    return ImagepickerState(file: file ?? this.file);
  }

  @override
  List<Object> get props => [file!];
}
