import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/car_controller.dart';


class CarView extends GetView<CarController> {
  const CarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(255, 153, 204, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 51, 153, 1),
        title: Text("${controller.car.brand}"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text( 
          "price: ${controller.car.price.toString()}",
          
          style: const TextStyle(fontSize: 40),
          
          ),
          Text("model: ${controller.car.model}",
          style: const TextStyle(fontSize: 30),
          
          ),
          Text("color: ${controller.car.color}",
           style: const TextStyle(fontSize: 30),
          ),
        ],
        ),
      ),
    );
  }
}