import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/ltsm_rotate_animation_controller.dart';

class LtsmRotateAnimationView extends StatefulWidget {
  const LtsmRotateAnimationView({Key? key}) : super(key: key);

  Widget build(context, LtsmRotateAnimationController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtsmRotateAnimation"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AnimatedRotation(
                turns: controller.animate ? 15 / 360 : 90 / 360,
                duration: const Duration(milliseconds: 2000),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  margin: const EdgeInsets.only(),
                  decoration: BoxDecoration(
                    color:
                        Colors.red.withOpacity(!controller.animate ? 1.0 : 0.0),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.animation),
                label: const Text("Animate"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  controller.animate = !controller.animate;
                  controller.setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LtsmRotateAnimationView> createState() =>
      LtsmRotateAnimationController();
}
