import 'package:flutter/material.dart';
import 'package:example/core.dart';
import '../controller/ltsm_visibility_controller.dart';

class LtsmVisibilityView extends StatefulWidget {
  const LtsmVisibilityView({Key? key}) : super(key: key);

  Widget build(context, LtsmVisibilityController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtsmVisibility"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "visible = ${controller.visible}",
                      style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.bold,
                        color: !controller.visible
                            ? Colors.red
                            : const Color.fromARGB(255, 0, 255, 0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.remove),
                    label: Text("Hit ${!controller.visible}"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 255),
                    ),
                    onPressed: () {
                      controller.visible = !controller.visible;
                      //controller.visible = false;
                      controller.setState(() {});
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: controller.visible ? 50.0 : 0.0,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LtsmVisibilityView> createState() => LtsmVisibilityController();
}
