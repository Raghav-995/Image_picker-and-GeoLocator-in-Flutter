import 'dart:io';

import 'package:assignment2/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageCamera extends StatefulWidget {
  const ImageCamera({super.key});
  @override
  State<ImageCamera> createState() => _ImageCameraState();
}

class _ImageCameraState extends State<ImageCamera> {
  final Controller controller = Get.find();
  @override
  Widget build(context) {
    return GetBuilder<Controller>(builder: (logic) {
      return Expanded(
        flex: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: logic.pickedimagefile != null
                  ? FileImage(logic.pickedimagefile as File)
                  : null,
            ),
            const SizedBox(height: 10),
            const Text("Pick or Click a Image"),
            const SizedBox(width: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 4),
                ElevatedButton.icon(
                  onPressed: logic.pickimage,
                  icon: const Icon(Icons.image),
                  label: const Text('Gallery'),
                ),
                const SizedBox(width: 4),
                const Text("OR"),
                const SizedBox(width: 4),
                ElevatedButton.icon(
                    onPressed: controller.pickimageCamera,
                    icon: const Icon(Icons.camera_alt_rounded),
                    label: const Text("Camera")),
              ],
            ),
          ],
        ),
      );
    });
  }
}
