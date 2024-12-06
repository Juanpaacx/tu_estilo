/*import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ModelSelectionScreen(),
    );
  }
}

class ModelSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecciona un Modelo 3D"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Botón para el primer modelo (Tacones) con imagen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Modelo3DViewer(
                      modelPath:
                          'assets/tacones/uploads_files_4146580_SlingbackHeel.obj',
                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/high-heel-shoes-3d-model-max-obj-fbx-stl.jpg', // Ruta de la imagen de vista previa
                width: 100, // Ajusta el tamaño según sea necesario
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            // Botón para el segundo modelo (Tacones 2) con imagen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Modelo3DViewer(
                      modelPath:
                          'assets/tacones2/uploads_files_4066941_AnkleStrapHeels.obj',
                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/3d-high-heels-slingback-heels-3d-model-5bb890b52d.jpg', // Ruta de la imagen de vista previa
                width: 100, // Ajusta el tamaño según sea necesario
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            // Botón para el tercer modelo (Lentes) con imagen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Modelo3DViewer(
                      modelPath: 'assets/lentes/MOSCOT_ZEV_TT_SE.obj',
                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/glasses-moscot-zev-tt-se-3d-model-obj-fbx-ztl-spp.jpg', // Ruta de la imagen de vista previa
                width: 100, // Ajusta el tamaño según sea necesario
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            // Botón para el cuarto modelo (Lentes con archivo MTL) con imagen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Modelo3DViewer(
                      modelPath: 'assets/lentes/MOSCOT_ZEV_TT_SE.obj',
                      mtlPath: 'assets/lentes/MOSCOT_ZEV_TT_SE.mtl',
                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/glasses-moscot-zev-tt-se-3d-model-obj-fbx-ztl-spp.jpg', // Ruta de la imagen de vista previa
                width: 100, // Ajusta el tamaño según sea necesario
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            // Botón para el modelo (Chamarra) con imagen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Modelo3DViewer(
                      modelPath: 'assets/chamarra/DG100074.obj',
                      mtlPath: 'assets/chamarra/DG100074.mtl',
                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/chamarra/chamarra.jpg', // Ruta de la imagen de vista previa
                width: 100, // Ajusta el tamaño según sea necesario
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            // Botón para el modelo (Saco) con imagen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Modelo3DViewer(
                      modelPath: 'assets/saco/obj_0.obj',
                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/saco/saco.jpg', // Ruta de la imagen de vista previa
                width: 100, // Ajusta el tamaño según sea necesario
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            // Botón para el modelo (Tenis) con imagen
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Modelo3DViewer(
                      modelPath: 'assets/Alexander McQueen.obj',
                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/tenis.jpeg', // Ruta de la imagen de vista previa
                width: 100, // Ajusta el tamaño según sea necesario
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Modelo3DViewer extends StatelessWidget {
  final String modelPath;
  final String? mtlPath;

  const Modelo3DViewer({Key? key, required this.modelPath, this.mtlPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modelo 3D"),
      ),
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            final object = Object(fileName: modelPath);
            scene.world.add(object);

            // Si existe archivo MTL, cargarlo
            if (mtlPath != null) {
              object.mtl = mtlPath; // Asociar el MTL al objeto
            }

            scene.camera.zoom = 5; // Ajustar zoom según sea necesario
          },
        ),
      ),
    );
  }
}

extension on Object {
  set mtl(String? mtl) {}
}
*/
/*
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple, // Color secundario
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
      ),
      home: ModelSelectionScreen(),
    );
  }
}

class ModelSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selecciona un Modelo 3D"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Dos columnas para los botones
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: <Widget>[
            // Botón para el primer modelo (Tacones) con imagen
            _buildModelButton(
              context,
              'assets/tacones/uploads_files_4146580_SlingbackHeel.obj',
              'assets/images/high-heel-shoes-3d-model-max-obj-fbx-stl.jpg',
            ),
            // Botón para el segundo modelo (Tacones 2) con imagen
            _buildModelButton(
              context,
              'assets/tacones2/uploads_files_4066941_AnkleStrapHeels.obj',
              'assets/images/3d-high-heels-slingback-heels-3d-model-5bb890b52d.jpg',
            ),
            // Botón para el tercer modelo (Lentes) con imagen
            _buildModelButton(
              context,
              'assets/lentes/MOSCOT_ZEV_TT_SE.obj',
              'assets/images/glasses-moscot-zev-tt-se-3d-model-obj-fbx-ztl-spp.jpg',
            ),
            // Botón para el cuarto modelo (Lentes con archivo MTL) con imagen
            _buildModelButtonWithMtl(
              context,
              'assets/lentes/MOSCOT_ZEV_TT_SE.obj',
              'assets/lentes/MOSCOT_ZEV_TT_SE.mtl',
              'assets/images/glasses-moscot-zev-tt-se-3d-model-obj-fbx-ztl-spp.jpg',
            ),
            // Botón para el modelo (Chamarra) con imagen
            _buildModelButtonWithMtl(
              context,
              'assets/chamarra/DG100074.obj',
              'assets/chamarra/DG100074.mtl',
              'assets/chamarra/chamarra.jpg',
            ),
            // Botón para el modelo (Saco) con imagen
            _buildModelButton(
              context,
              'assets/saco/obj_0.obj',
              'assets/saco/saco.jpg',
            ),
            // Botón para el modelo (Tenis) con imagen
            _buildModelButton(
              context,
              'assets/Alexander McQueen.obj',
              'assets/images/tenis.jpeg',
            ),
          ],
        ),
      ),
    );
  }

  // Método para crear los botones sin MTL
  Widget _buildModelButton(
      BuildContext context, String modelPath, String imagePath) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.white, // Color del texto y borde
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
        ),
        elevation: 5, // Sombra para el botón
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Modelo3DViewer(
              modelPath: modelPath,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath, // Ruta de la imagen de vista previa
            width: 100, // Ajusta el tamaño según sea necesario
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text("Ver Modelo 3D", style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }

  // Método para crear los botones con archivo MTL
  Widget _buildModelButtonWithMtl(BuildContext context, String modelPath,
      String mtlPath, String imagePath) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.white, // Color del texto y borde
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
        ),
        elevation: 5, // Sombra para el botón
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Modelo3DViewer(
              modelPath: modelPath,
              mtlPath: mtlPath,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath, // Ruta de la imagen de vista previa
            width: 100, // Ajusta el tamaño según sea necesario
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text("Ver Modelo 3D", style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}

class Modelo3DViewer extends StatelessWidget {
  final String modelPath;
  final String? mtlPath;

  const Modelo3DViewer({Key? key, required this.modelPath, this.mtlPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modelo 3D"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            final object = Object(fileName: modelPath);
            scene.world.add(object);

            // Si existe archivo MTL, cargarlo
            if (mtlPath != null) {
              object.mtl = mtlPath; // Asociar el MTL al objeto
            }

            scene.camera.zoom = 5; // Ajustar zoom según sea necesario
          },
        ),
      ),
    );
  }
}

extension on Object {
  set mtl(String? mtl) {}
}
*/

// este codigo ya sirve pero no con texturas
/*
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple, // Color secundario
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
      ),
      home: ModelSelectionScreen(),
    );
  }
}

class ModelSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ediccion de productos"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Dos columnas para los botones
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: <Widget>[
            // Botón para el primer modelo (Tacones) con imagen
            _buildModelButton(
              context,
              'assets/tacones/uploads_files_4146580_SlingbackHeel.obj',
              'assets/images/high-heel-shoes-3d-model-max-obj-fbx-stl.jpg',
            ),
            // Botón para el segundo modelo (Tacones 2) con imagen
            _buildModelButton(
              context,
              'assets/tacones2/uploads_files_4066941_AnkleStrapHeels.obj',
              'assets/images/3d-high-heels-slingback-heels-3d-model-5bb890b52d.jpg',
            ),
            // Botón para el tercer modelo (Lentes) con imagen
            _buildModelButton(
              context,
              'assets/lentes/MOSCOT_ZEV_TT_SE.obj',
              'assets/images/glasses-moscot-zev-tt-se-3d-model-obj-fbx-ztl-spp.jpg',
            ),
            // Botón para el cuarto modelo (Lentes con archivo MTL) con imagen
            _buildModelButtonWithMtl(
              context,
              'assets/lentes/MOSCOT_ZEV_TT_SE.obj',
              'assets/lentes/MOSCOT_ZEV_TT_SE.mtl',
              'assets/images/glasses-moscot-zev-tt-se-3d-model-obj-fbx-ztl-spp.jpg',
            ),
            _buildModelButtonWithMtl(
              context,
              'assets/Alexander McQueen.obj',
              'assets/Alexander McQueen.mtl',
              'assets/Alexander McQueen.png',
            ),
            _buildModelButtonWithMtl(
              context,
              'assets/shark/shark.obj',
              'assets/shark/shark.mtl',
              'assets/shark/sharkTxt.png',
            ),
            // Botón para el modelo (Chamarra) con imagen
            _buildModelButtonWithMtl(
              context,
              'assets/chamarra/DG100074.obj',
              'assets/chamarra/DG100074.mtl',
              'assets/chamarra/chamarra.jpg',
            ),
            // Botón para el modelo (Saco) con imagen
            _buildModelButton(
              context,
              'assets/saco/obj_0.obj',
              'assets/saco/saco.jpg',
            ),
            // Botón para el modelo (Tenis) con imagen
            /* _buildModelButton(
              context,
              'assets/Alexander McQueen.fbx',
              'assets/Alexander McQueen.png',
            ),*/
          ],
        ),
      ),
    );
  }

  // Método para crear los botones sin MTL
  Widget _buildModelButton(
      BuildContext context, String modelPath, String imagePath) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.white, // Color del texto y borde
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
        ),
        elevation: 5, // Sombra para el botón
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Modelo3DViewer(
              modelPath: modelPath,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath, // Ruta de la imagen de vista previa
            width: 100, // Ajusta el tamaño según sea necesario
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text("Ver Modelo 3D", style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }

  // Método para crear los botones con archivo MTL
  Widget _buildModelButtonWithMtl(BuildContext context, String modelPath,
      String mtlPath, String imagePath) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.white, // Color del texto y borde
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
        ),
        elevation: 5, // Sombra para el botón
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Modelo3DViewer(
              modelPath: modelPath,
              mtlPath: mtlPath,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath, // Ruta de la imagen de vista previa
            width: 100, // Ajusta el tamaño según sea necesario
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text("Ver Modelo 3D", style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}

class Modelo3DViewer extends StatelessWidget {
  final String modelPath;
  final String? mtlPath;

  const Modelo3DViewer({Key? key, required this.modelPath, this.mtlPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modelo 3D"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          Center(
            child: Cube(
              onSceneCreated: (Scene scene) {
                final object = Object(fileName: modelPath);
                scene.world.add(object);

                // Si existe archivo MTL, cargarlo
                if (mtlPath != null) {
                  object.mtl = mtlPath; // Asociar el MTL al objeto
                }

                scene.camera.zoom = 5; // Ajustar zoom según sea necesario
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 254, 253, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  _showColorPalette(context);
                },
                child: Text("Seleccionar Color"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showColorPalette(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Selecciona un Color",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: List.generate(12, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // Aquí puedes aplicar el color seleccionado al objeto 3D
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getColor(index),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getColor(int index) {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.cyan,
      Colors.amber,
      Colors.teal,
      Colors.indigo,
      Colors.yellow,
      Colors.brown,
      Colors.pink
    ];
    return colors[index];
  }
}

extension on Object {
  set mtl(String? mtl) {}
}
*/

/*
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
      ),
      home: ModelViewerScreen(),
    );
  }
}

class ModelViewerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visualizador de Modelo 3D"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            final object = Object(fileName: 'assets/Alexander McQueen.fbx');
            
            // Asignar textura manualmente
            object.mesh.textures = [
              Texture(fileName: 'assets/Alexander McQueen.jpg'),
            ];

            scene.world.add(object);
            scene.camera.zoom = 5;
          },
        ),
      ),
    );
  }
}
*/

/*

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
      ),
      home: ModelSelectionScreen(),
    );
  }
}

class ModelSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edición de Productos"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: <Widget>[
            // Botones para cargar diferentes modelos 3D
            _buildModelButtonWithMtl(
              context,
              'assets/Alexander McQueen.obj',
              'assets/Alexander McQueen.mtl',
              'assets/Alexander McQueen.png',
            ), /*
            _buildModelButtonWithMtl(
              context,
              'assets/lentes/MOSCOT_ZEV_TT_SE.obj',
              'assets/lentes/MOSCOT_ZEV_TT_SE.mtl',
              'assets/images/glasses-moscot-zev.jpg',
            ),
            _buildModelButtonWithMtl(
              context,
              'assets/chamarra/DG100074.obj',
              'assets/chamarra/DG100074.mtl',
              'assets/chamarra/chamarra.jpg',
            ),
            _buildModelButton(
              context,
              'assets/saco/obj_0.obj',
              'assets/saco/saco.jpg',
            ),*/
          ],
        ),
      ),
    );
  }

  // Método para botones sin archivo MTL
  Widget _buildModelButton(
      BuildContext context, String modelPath, String imagePath) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Modelo3DViewer(
              modelPath: modelPath,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text("Ver Modelo 3D", style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }

  // Método para botones con archivo MTL
  Widget _buildModelButtonWithMtl(BuildContext context, String modelPath,
      String mtlPath, String imagePath) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Modelo3DViewer(
              modelPath: modelPath,
              mtlPath: mtlPath,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text("Ver Modelo 3D", style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}

class Modelo3DViewer extends StatelessWidget {
  final String modelPath;
  final String? mtlPath;

  const Modelo3DViewer({Key? key, required this.modelPath, this.mtlPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modelo 3D"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          Center(
            child: Cube(
              onSceneCreated: (Scene scene) {
                final object = Object(fileName: modelPath);

                if (mtlPath != null) {
                  object.mtl = mtlPath;
                }

                scene.world.add(object);
                scene.camera.zoom = 5;
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension on Object {
  set mtl(String? mtl) {}
}





*/

/*
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple, // Color secundario
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
      ),
      home: ModelSelectionScreen(),
    );
  }
}

class ModelSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edición de productos"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Dos columnas para los botones
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: <Widget>[
            // Botón para modelo con archivo MTL (Ejemplo Alexander McQueen)
            _buildModelButtonWithMtl(
              context,
              'assets/Alexander McQueen.obj',
              'assets/Alexander McQueen.mtl',
              'assets/Alexander McQueen.png',
            ),
          ],
        ),
      ),
    );
  }

  // Método para crear los botones con archivo MTL
  Widget _buildModelButtonWithMtl(BuildContext context, String modelPath,
      String mtlPath, String imagePath) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.white, // Color del texto y borde
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
        ),
        elevation: 5, // Sombra para el botón
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Modelo3DViewer(
              modelPath: modelPath,
              mtlPath: mtlPath,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath, // Ruta de la imagen de vista previa
            width: 100, // Ajusta el tamaño según sea necesario
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text("Ver Modelo 3D", style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}

class Modelo3DViewer extends StatelessWidget {
  final String modelPath;
  final String? mtlPath;

  const Modelo3DViewer({Key? key, required this.modelPath, this.mtlPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modelo 3D"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          Center(
            child: Cube(
              onSceneCreated: (Scene scene) {
                // Cargar el modelo .obj
                final object = Object(fileName: modelPath);

                // Asociar el archivo .mtl si está disponible
                if (mtlPath != null) {
                  object.mtl =
                      mtlPath; // Flutter Cube permite cargar el material.
                }

                // Configuración adicional para mejorar la visualización
                object.backfaceCulling = false; // Ver modelo por ambos lados
                scene.world.add(object);
                scene.camera.zoom = 5; // Ajustar el zoom
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  _showColorPalette(context);
                },
                child: Text("Seleccionar Color"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showColorPalette(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Selecciona un Color",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: List.generate(12, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        // Aplica el color seleccionado al modelo
                        print("Color seleccionado: ${_getColor(index)}");
                        // Aquí puedes implementar la lógica para aplicar colores al modelo
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getColor(index),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getColor(int index) {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.cyan,
      Colors.amber,
      Colors.teal,
      Colors.indigo,
      Colors.yellow,
      Colors.brown,
      Colors.pink
    ];
    return colors[index];
  }
}

extension on Object {
  set mtl(String? mtl) {
    // Este método es un marcador de posición, puedes implementar lógicas avanzadas aquí.
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
      ),
      home: ModelSelectionScreen(),
    );
  }
}

class ModelSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edición de Productos"),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.style),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SavedStylesScreen()),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildModelButton(
              context,
              'assets/tacones/uploads_files_4146580_SlingbackHeel.obj',
              'assets/images/high-heel-shoes-3d-model-max-obj-fbx-stl.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModelButton(
      BuildContext context, String modelPath, String imagePath) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.deepPurple,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Modelo3DViewer(
              modelPath: modelPath,
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text("Ver Modelo 3D", style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }
}

class Modelo3DViewer extends StatelessWidget {
  final String modelPath;

  const Modelo3DViewer({Key? key, required this.modelPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modelo 3D"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          Center(
            child: Cube(
              onSceneCreated: (Scene scene) {
                final object = Object(fileName: modelPath);
                scene.world.add(object);
                scene.camera.zoom = 5;
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 254, 253, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  _showColorPalette(context);
                },
                child: Text("Seleccionar y Guardar Estilo"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showColorPalette(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Selecciona un Color",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  children: List.generate(12, (index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        StyleManager.saveSelectedStyle(_getColor(index));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _getColor(index),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getColor(int index) {
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.cyan,
      Colors.amber,
      Colors.teal,
      Colors.indigo,
      Colors.yellow,
      Colors.brown,
      Colors.pink
    ];
    return colors[index];
  }
}

class SavedStylesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estilos Guardados"),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<Color>(
        future: StyleManager.getSelectedStyle(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error al cargar estilos guardados"));
          } else {
            return Center(
              child: Container(
                height: 100,
                width: 100,
                color: snapshot.data,
                child: Center(
                  child: Text(
                    "Estilo Guardado",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class StyleManager {
  static Future<void> saveSelectedStyle(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('selectedStyle', color.value);
  }

  static Future<Color> getSelectedStyle() async {
    final prefs = await SharedPreferences.getInstance();
    final colorValue = prefs.getInt('selectedStyle') ?? Colors.white.value;
    return Color(colorValue);
  }
}
