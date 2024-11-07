import 'package:flutter/material.dart';
import 'package:tienda/models/product_model.dart';
import 'package:tienda/services/product_service.dart';
import 'product_details_view.dart';

class RopaMujeresView extends StatefulWidget {
  @override
  _RopaMujeresViewState createState() => _RopaMujeresViewState();
}

class _RopaMujeresViewState extends State<RopaMujeresView> {
  List<Product> productos = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  // Método para obtener productos de la categoría "Ropa Mujer"
  Future<void> _fetchProducts() async {
    try {
      final productosMujer = await ProductService().getProductsByCategory(2);
      setState(() {
        productos = productosMujer;
      });
    } catch (e) {
      print('Error al cargar productos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ropa para Mujeres'),
      ),
      body: productos.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Mostrar 2 productos por fila para mejor visibilidad
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
                      descripcion: producto.description, // Pasar descripción del producto
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(producto.imageUrl),
                              fit: BoxFit.cover,
                            ),
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
                          fontSize: 16,
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
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
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
