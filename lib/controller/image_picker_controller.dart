import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  final image = Rxn<File>();

  Future<File?> pickImage() async {
    XFile? imagePicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imagePicker == null) {
      return null;
    } else {
      return image(
        File(imagePicker.path),
      );
    }
  }
}
