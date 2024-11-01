import 'package:flutter/material.dart';
import 'package:tienda/models/product_model.dart';
import 'package:tienda/services/product_service.dart';
import 'product_details_view.dart';

class RopaHombresView extends StatefulWidget {
  @override
  _RopaHombresViewState createState() => _RopaHombresViewState();
}

class _RopaHombresViewState extends State<RopaHombresView> {
  List<Product> productos = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  // Método para obtener productos de la categoría "Ropa Hombre"
  Future<void> _fetchProducts() async {
    try {
      final productosHombre = await ProductService().getProductsByCategory(1); // id 1 es Ropa Hombre
      setState(() {
        productos = productosHombre;
      });
    } catch (e) {
      print('Error al cargar productos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ropa para Hombres'),
      ),
      body: productos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: productos.length,
          itemBuilder: (context, index) {
            final producto = productos[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsView(
                      nombre: producto.name,
                      precio: producto.price.toString(),
                      imagen: producto.imageUrl,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 3.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(producto.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        producto.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '\$${producto.price}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
