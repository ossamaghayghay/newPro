
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform_io.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({ Key? key }) : super(key: key);
  static const routeName='routeName';
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
   


   var titlecontroller= TextEditingController();
   var descriptioncontroller= TextEditingController();
   var pricecontroller= TextEditingController();
   var imagecontroller= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product'),centerTitle: true,backgroundColor: Colors.purple,elevation: 0),
      body:Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children:  [
            TextField(decoration: const InputDecoration(labelText:'Title',hintText: 'Add Title'),
            controller: titlecontroller,
            ),
            TextField(decoration: const InputDecoration(labelText:'Descreption',hintText: 'Add Description'),
            controller: descriptioncontroller,
            ),
            TextField(decoration: const InputDecoration(labelText:'Price',hintText: 'Add Price'),
            controller: pricecontroller,
            ),
            TextField(decoration: const InputDecoration(labelText:'Image',hintText: 'Url Image'),
            controller: imagecontroller,
            ),
            ElevatedButton(
              onPressed: (){
                if(titlecontroller.text.isEmpty || descriptioncontroller.text.isEmpty || pricecontroller.text.isEmpty || imagecontroller.text.isEmpty){
                  Get.snackbar('Warning','Please enter All Fields',duration: const Duration(seconds: 1));
                }
                else{
                  try{
                    
                  }catch(e){
                     Get.snackbar('error','Enter A Valid Price');
                  }
                }
              },
              child: const Text('Add Product',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
          ],
        ),
        
      ),
    );
  }
}