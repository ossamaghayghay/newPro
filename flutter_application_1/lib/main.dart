import 'package:flutter/material.dart';
// import 'package:flutter_application_1/module/product.dart';
import 'package:flutter_application_1/view/add_product.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
       home: const MyHomePage( ),
       routes: {
            
         AddProduct.routeName:(context) =>const AddProduct(), 
       },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),centerTitle: true,
      ),
      body: Center(
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>Get.to(const AddProduct()),
        tooltip: 'Add Product',
        child: const Icon(Icons.add,size:55),
      ),
    );
  }
}
