
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as  http;
class Product
{

   final String id;
   final String title;
   final String description;
   final double price;
   final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl
  });
}

class Products with ChangeNotifier{
  List<Product> productList=[];

  Future<void> fetchData()async{



  }


  Future<void> add({required String id,required String title,required String description,required double price,required String imageUrl })
  async {
     String url='https://productapp-3611c-default-rtdb.firebaseio.com/product.json';
  
      http.post(Uri.parse(url),body:json.encode({
        'id':id,
        'title':title,
        'descripion':description,
        'price':price,
        'imageUrl':imageUrl,
      })).then((response)  {
        Get.snackbar('it show you this', Text(json.decode(response.body)).toString());
        productList.add(
                  Product(
                      id: json.decode(response.body),
                      title: title,
                      description: description,
                      price: price,
                      imageUrl: imageUrl
             ),
            );
        }
      );
      
    
  }
  void delete(String id)
  {
    productList.removeWhere((element) => element.id==id);
    notifyListeners();
    Get.dialog(const Text('Deleted Successfully'));
  }


  }


