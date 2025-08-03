import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImageHandler {
  static final ImagePicker _picker = ImagePicker();

  /// Takes a photo using the camera
  static Future<File?> takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return await saveImagePermanently(File(pickedFile.path));
    }
    return null;
  }

  /// Picks an image from the gallery
  static Future<File?> pickFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  /// Saves image to app's document directory
  static Future<File> saveImagePermanently(File image) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final savedImage = await image.copy('${appDir.path}/$fileName');
    return savedImage;
  }

  /// Deletes an image file
  static Future<void> deleteImage(File image) async {
    if (await image.exists()) {
      await image.delete();
    }
  }
}
