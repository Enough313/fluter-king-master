import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

class ProductModel {
  String description;
  String money;
  String gram;
  IconData image;

  ProductModel({
    this.description,
    this.money,
    this.gram,
    this.image,
  });
  CollectionReference db = FirebaseFirestore.instance.collection('screen');

  Future<void> addProduct(ProductModel productModel) async {
    Map<String, dynamic> data = {
      "category": productModel.description,
      "productName": productModel.money,
      "detail": productModel.gram,
     
      "imagesUrl": productModel.image,
     
    };
    await db.add(data);
  }

  Future<void> updateProduct(String id, ProductModel updateProduct) async {
    Map<String, dynamic> data = {
      "category": updateProduct.description,
      "productName": updateProduct.money,
      "serialCode": updateProduct.gram,
      "price": updateProduct.image,
    
    };
    await db.doc(id).update(data);
  }

  Future<void> delete(String id) async {
    await db.doc(id).delete();
  }
}
