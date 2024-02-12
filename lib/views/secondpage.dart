import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arg = Get.arguments;
    final File? image = arg['image'];
    final Position? location = arg['location'];
    final String? imagepath = arg['imagepath'];

    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton.icon(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded),
          label: const Text(""),
        ),
        centerTitle: true,
        title: const Text("Welcome to the Second Page"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Column(children: [
          const Text(
            "Welcome to Second Page",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            "The image path is $imagepath",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          CircleAvatar(
            radius: 100,
            backgroundColor: Colors.amber,
            backgroundImage: FileImage(image!),
          ),
          const SizedBox(height: 8),
          Text(
            "The Entered location is: $location",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 4,
          ),
          ElevatedButton.icon(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.back_hand),
              label: const Text("Go Back")),
        ]),
      ),
    );
  }
}
