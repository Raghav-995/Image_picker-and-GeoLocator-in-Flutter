import 'package:assignment2/controller/controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:core';

class GeoLocator extends StatelessWidget {
  const GeoLocator({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.find();
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Please provide the permissions to provide the accurate location",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ElevatedButton.icon(
              onPressed: () async {
                await controller.location();
              },
              icon: const Icon(Icons.location_on),
              label: const Text("Add Location")),
          const SizedBox(height: 4),
          GetBuilder<Controller>(
            builder: (controller) {
              if (!controller.loading) {
                return Text(
                  "\"ERROR\" : ${controller.alert}. Please disable the Location !!",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                );
              }
              if (controller.currentPosition == null) {
                return const Text("");
              } else {
                return Text("${controller.currentPosition}");
              }
            },
          ),
        ],
      ),
    );
  }
}
