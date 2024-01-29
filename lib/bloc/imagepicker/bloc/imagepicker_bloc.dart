import 'package:blflutter/utils/image_picker_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'imagepicker_event.dart';
part 'imagepicker_state.dart';

class ImagepickerBloc extends Bloc<ImagepickerEvent, ImagepickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagepickerBloc(this.imagePickerUtils) : super(const ImagepickerState()) {
    on<CameraImagePicker>(_cameracapture);
    on<GalleryImagePicker>(_galleryPicker);
  }

  void _cameracapture(CameraImagePicker event, Emitter<ImagepickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file = file));
  }

  void _galleryPicker(GalleryImagePicker event, Emitter<ImagepickerState> emit) async {
    XFile? file = await imagePickerUtils.picturePicker();
    emit(state.copyWith(file = file));
  }
}
