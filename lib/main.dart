import 'package:flutter/material.dart';
// Importamos la librería 'math' para poder usar la clase 'Random()'.
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roll',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

// Un StatefulWidget nos permite manejar su estado. Esto es importante en el caso querramos actualizar el componente dinámicamente, en el caso que un usuario interactue con él, o cualquier otro estímulo externo.
// Por el momento no debemos preocuparnos por el primero de los dos bloques que se crean al utilizar el shortcut 'stf', solo asegurarnos que las referencias a si mismo y a su estado sean las correctas.
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// Esta es la parte que editaremos. Lo único que cambia en comparación a un StatelessWidget es el tipo de widget, pero la función 'build()' es la misma.
class _HomeState extends State<Home> {
  // Definimos e inicializamos variables que guardarán el valor de cada uno de nuestros dados.
  var dice1 = 1;
  var dice2 = 1;
  // Creamos una instancia de la clase 'Random()' y la guardamos en una variable llamada 'random'.
  var random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Agregamos un AppBar a nuestro scaffold para proveerle un encabezado con el título de nuestro app.
      appBar: AppBar(
        // Le proporcionamos un color específico (en vez del color primario establecido en nuestro 'ThemeData').
        backgroundColor: Colors.amberAccent,
        // Le quitamos la elevación (sombra).
        elevation: 0,
        // Le agregamos el título.
        title: Text(
          'Dice Roll',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w600, letterSpacing: 2),
        ),
      ),
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // Encubrimos la imagen del dado con un 'GestureDetector'. Este nos da acceso a una gran variedad de gestos que puede realizar el usuario con la pantalla de su dispositivo.
                  child: GestureDetector(
                    // En este caso nos interesa el gesto 'onTap()' que se disparará cada vez que el usuario presione la imagen. Toma como valor una función anónima (Anonymous Callback) sin parámetros.
                    onTap: () {
                      // Dentro de la función de nuestro anónymous callback invocamos la función 'setState()', encargada de recorrer el Widget Tree y re renderizar aquellos que data que fue modificada desde la última vez que se renderizó el componente.
                      setState(() {
                        // Usando la función random 'tiramos' el dado y asignamos el resultado a la variable que guarda el valor del dado.
                        dice1 = random.nextInt(6) + 1;
                      });
                    },

                    child: Image(
                      // La imágen la extraemos de una carpeta local llamada images, y usando 'string interpolation' injectamos el valor del dado al string con la ruta y nombre de la imagen para cargarla dinámicamente. Como este widget depende de la variable 'dice1', este será re renderizado al llamar 'setState()' si es que el valor de 'dice1' ha cambiado.
                      image: AssetImage('images/dice$dice1.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          dice2 = random.nextInt(6) + 1;
                        });
                      },
                      child: Image(image: AssetImage('images/dice$dice2.png'))),
                ),
              ),
            ],
          ),
        ),
      ),
      // Agregamos un 'FLoatingActionButton' para mostrar el valor total de los dadtos.
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black87,
        // El parámetro 'onPressed' es requerido (@required), por o tanto le debemos pasar una función anónima. Sin embargo podemos pasarle una función vacía que no hace nada al ejecutarse.
        onPressed: () {},
        label: Row(
          children: <Widget>[
            Icon(Icons.whatshot),
            SizedBox(
              width: 10.0,
            ),
            // Usando 'string interpolation' injectamos el valor del dado al string con el total de los dados y de esa manera mostrarlo dinámicamente. Como este widget depende de la variable 'dice1' y 'dice2', este será re renderizado al llamar 'setState()' si es que el valor de 'dice1' o 'dice2' ha cambiado.
            Text('Total is ${dice1 + dice2}')
          ],
        ),
      ),
    );
  }
}
