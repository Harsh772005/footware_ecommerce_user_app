import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/product/product.dart';

class HomeController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference ProductsCollection;

  List<Product> products = [];

  @override
  Future<void> onInit() async{

    ProductsCollection=firestore.collection('products');
    await fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await ProductsCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs.map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      // final List<Product> retrievedProducts = productSnapshot.docs.map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      // products.clear();
      products.assignAll(retrievedProducts);
      print(retrievedProducts);
      Get.snackbar('Success', 'Product Fetch Suceesfully',colorText: Colors.green);
      update();
      // QuerySnapshot productSnapshot = await ProductsCollection.get();
      // products.value = productSnapshot.docs.map((doc) => Product.fromDocument(doc)).toList();
      // update(); // Update the UI
    } on Exception catch (e) {
      Get.snackbar('Error', e.toString(),colorText: Colors.red);
    }finally{
      update();
    }

  }
}





