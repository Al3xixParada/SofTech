import 'package:flutter/material.dart';
import 'upload_product_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Productos")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => UploadProductPage()));
          },
          child: Text("Subir Producto"),
        ),
      ),
    );
  }
}
