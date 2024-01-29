import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  ImagePicker picker = ImagePicker();
  XFile? file;

  Future<XFile?> cameraCapture() async {
    final XFile? file = await picker.pickImage(source: ImageSource.camera);
    return file;
  }

  Future<XFile?> picturePicker() async {
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}
