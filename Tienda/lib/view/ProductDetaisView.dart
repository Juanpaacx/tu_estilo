import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  final String nombre;
  final String precio;
  final String imagen;
  final String? descripcion;

  ProductDetailsView({
    required this.nombre,
    required this.precio,
    required this.imagen,
    this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre), // Mostrar el nombre del producto en la barra superior
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Acción para navegar al carrito de compras
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Scroll si el contenido es largo
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del producto
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(imagen),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Nombre del producto
              Text(
                nombre,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Precio del producto
              Text(
                '\$${precio}',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              // Descripción del producto
              Text(
                descripcion ??
                    'Descripción del producto. Puedes detallar las características del producto, materiales, cuidados, etc.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              // Botón para comprar
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Acción para agregar al carrito o realizar la compra
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$nombre agregado al carrito!'),
                      ),
                    );
                  },
                  child: Text('Agregar al carrito'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    textStyle: TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
