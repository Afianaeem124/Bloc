part of 'imagepicker_bloc.dart';

abstract class ImagepickerEvent extends Equatable {
  const ImagepickerEvent();

  @override
  List<Object> get props => [];
}

class CameraImagePicker extends ImagepickerEvent {}

class GalleryImagePicker extends ImagepickerEvent {}
