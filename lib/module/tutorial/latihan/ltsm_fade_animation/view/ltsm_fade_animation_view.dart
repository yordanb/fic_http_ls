import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/ltsm_fade_animation_controller.dart';

class LtsmFadeAnimationView extends StatefulWidget {
  const LtsmFadeAnimationView({Key? key}) : super(key: key);

  Widget build(context, LtsmFadeAnimationController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtsmFadeAnimation"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                height: 100.0,
                width: 100.0,
                margin: const EdgeInsets.only(),
                decoration: BoxDecoration(
                  color: controller.animate
                      ? Colors.red.withOpacity(0.5)
                      : Colors.red.withOpacity(1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      !controller.animate ? 16.0 : 50.0,
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
  State<LtsmFadeAnimationView> createState() => LtsmFadeAnimationController();
}
