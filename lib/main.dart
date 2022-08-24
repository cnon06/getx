import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home:Home()));

class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
  decrement() => count--;

}




class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
      appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Center(child: Column(
        children: [
          ElevatedButton(
                  child: const Text("Go to Other"), onPressed: () => Get.to(Other())),
          // ElevatedButton(
          //          onPressed:c.decrement(),child: const Text("Decrease")),
          ElevatedButton(
                   onPressed:()=>c.increment(),child: const Text("Increase")),

          ElevatedButton(
                   onPressed:()=>c.decrement(),child: const Text("Decrease")),
        ],
      )),
      
          );
          
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

   Other({Key? key}) : super(key: key);

  @override
  Widget build(context){
     // Access the updated count variable
     return Scaffold(body: Center(child: Text("${c.count}", style:  const TextStyle(fontSize: 50),)));
  }
}

