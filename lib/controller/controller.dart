import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Controller extends GetxController {
  var count = 0;

  void increment() {
    count++;
    update();
  }

  File? pickedimagefile;
  String? imagePath;
  Position? currentPosition;
  String alert = '';

  var loading = true;
  void _pickimage() async {
    final picker = ImagePicker();
    final pickedimage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      pickedimagefile = File(pickedimage.path);
      imagePath = pickedimage.path;
      update();
    }
  }

  void _pickimageCamera() async {
    final picker = ImagePicker();
    final pickedimage = await picker.pickImage(source: ImageSource.camera);
    if (pickedimage != null) {
      pickedimagefile = File(pickedimage.path);
      imagePath = pickedimage.path;
      update();
    }
  }

  Future<Object> location() async {
    bool serviceEnabled;
    LocationPermission permission;
    try {
      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Alert to enable the location services.
        loading = false;
        update();
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          loading = false;
          update();
        }
      }
      if (permission == LocationPermission.deniedForever) {
        loading = false;
      }
      return {
        currentPosition = await Geolocator.getCurrentPosition(),
        loading = true,
        update(),
      };
    } catch (e) {
      return {
        update(),
        alert = '$e',
      };
    }
  }

  void Function() get pickimage => _pickimage;
  void Function() get pickimageCamera => _pickimageCamera;
}
