import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import 'package:ktt7/app/data/models/car/car.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text("Status: ${controller.status.value.name}")),
              TextButton(
                  onPressed: () => controller.getData(),
                  child: const Text("get data")),
              Obx(() => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.cars.length,
                    itemBuilder: (context, index) {
                      var curCar = controller.cars[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed('car', arguments: curCar),
                        child: CarWidget(curCar: curCar),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CarWidget extends StatelessWidget {
  const CarWidget({
    super.key,
    required this.curCar,
  });

  final Car curCar;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Text(curCar.id.toString()),
        title: Text("${curCar.brand} ${curCar.model}"),
        subtitle: Text(curCar.price.toString()),
      ),
    );
  }
}