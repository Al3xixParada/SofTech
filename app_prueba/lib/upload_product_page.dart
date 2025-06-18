import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import '../supabase_client.dart';

class UploadProductPage extends StatefulWidget {
  @override
  _UploadProductPageState createState() => _UploadProductPageState();
}

class _UploadProductPageState extends State<UploadProductPage> {
  Future<void> pickAndUploadImage() async {
    final input = html.FileUploadInputElement()..accept = 'image/*';
    input.click();

    input.onChange.listen((e) async {
      final file = input.files?.first;
      if (file == null) return;

      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);

      await reader.onLoad.first;
      final bytes = reader.result as Uint8List;

      final fileName =
          'products/${DateTime.now().millisecondsSinceEpoch}_${file.name}';

      // Subir la imagen al bucket
      await supabase.storage.from('productos').uploadBinary(fileName, bytes);

      // Obtener URL pública
      final publicUrl =
          supabase.storage.from('productos').getPublicUrl(fileName);

      // Guardar en tabla "productos"
      final response = await supabase.from('productos').insert({
        'nombre': 'Ejemplo', // Aquí puedes usar un TextField si quieres nombre dinámico
        'foto_url': publicUrl,
      });

      if (response.error != null) {
        print('Error al guardar en DB: ${response.error!.message}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error al guardar el producto")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Producto guardado")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: pickAndUploadImage,
          child: Text("Subir producto"),
        ),
      ),
    );
  }
}
