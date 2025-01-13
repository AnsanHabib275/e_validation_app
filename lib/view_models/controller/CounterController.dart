import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
// import 'package:image_picker/image_picker.dart';

class CounterController extends GetxController {
  RxInt counter = 1.obs;
  RxDouble opacity = .4.obs;
  RxBool notification = false.obs;

  RxList<String> fruits = ['Orange', 'Apple', 'Mangoes', 'Banana'].obs;
  RxList tempFruitsList = [].obs;

  RxString imagePath = ''.obs;

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  RxBool loading = false.obs;

  incrementCounter() {
    counter.value++;
    // print(counter.value);
  }

  setOpacity(double value) {
    opacity.value = value;
    // print(opacity.value);
  }

  setNotification(bool value) {
    notification.value = value;
    // print(notification.value);
  }

  addFruits(int index) {
    tempFruitsList.add(fruits[index].toString());
    // print(index);
    // print('add');
  }

  removeFruits(int index) {
    tempFruitsList.remove(fruits[index].toString());
    // print(index);
    // print('remove');
  }

  addToFavourite(String value) {
    tempFruitsList.add(value);
  }

  removeFromFavourite(String value) {
    tempFruitsList.remove(value);
  }

  // Future getImageFromGallery() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final image = await _picker.pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     imagePath.value = image.path.toString();
  //   }
  // }
  //
  // Future takeImageFromCamera() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final image = await _picker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     imagePath.value = image.path.toString();
  //   }
  // }

  void loginApi() async {
    loading.value = true;
    try {
      final response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {
            'email': emailController.value.text,
            'password': passwordController.value.text
          });
      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);
      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar('Login Successful', 'Congratulation');
      } else {
        loading.value = false;
        Get.snackbar('Login Failed', data['error']);
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar('Exception', e.toString());
    }
  }
}
