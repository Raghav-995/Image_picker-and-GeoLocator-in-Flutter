import 'package:assignment2/controller/controller.dart';
import 'package:assignment2/views/camera.dart';
import 'package:assignment2/views/location.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    //final Controller controller = Get.put(Controller());
    final controller = Get.put<Controller>(Controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('GetX Image_Viewer'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                GetBuilder<Controller>(
                  builder: (val) => Column(
                    children: [
                      Text(
                        '${val.count}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                      const ImageCamera(),
                      const SizedBox(height: 8),
                      const GeoLocator(),
                      ElevatedButton(
                          onPressed: () {
                            if (controller.currentPosition != null) {
                              Get.toNamed('/secondpage', arguments: {
                                'image': controller.pickedimagefile,
                                'location': controller.currentPosition,
                                'imagepath': controller.imagePath,
                              });
                            } else {
                              Get.snackbar(
                                // title
                                "Warning!",
                                "Please try to add image and location", // message
                                icon: const Icon(Icons.alarm),
                                shouldIconPulse: true,
                                barBlur: 20,
                                isDismissible: true,
                                duration: const Duration(seconds: 3),
                              );
                            }
                          },
                          child: const Text("Go to Second Page")),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
