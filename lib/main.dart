import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Aplicación 3',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// ─── SCAFFOLD ───────────────────────────────────────────────────────────────
// Scaffold es la estructura base de una pantalla en Flutter.
// Provee AppBar, body, floatingActionButton, etc.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicación 3'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: const SingleChildScrollView(
        // ─── SINGLE CHILD SCROLL VIEW ──────────────────────────────────────
        // Hace que su hijo sea desplazable cuando el contenido
        // es más grande que la pantalla.
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ─── TEXT ────────────────────────────────────────────────────
              // Muestra una cadena de texto en pantalla.
              Text(
                'L Vega',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color :Color.fromARGB(255, 55, 255, 0),
                  fontStyle: FontStyle.italic, 
                  decoration: TextDecoration.none,
                ),
              ),
              Text('Texto simple.'),

              SizedBox(height: 15),

              // ─── IMAGE ───────────────────────────────────────────────────
              // Muestra una imagen. Se puede cargar desde la red,
              // desde los assets o desde el dispositivo.
              Text(
                'Buho wiwiwiwi',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Image(
                image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                ),
              ),

              SizedBox(height: 20),

              // ─── ICON ────────────────────────────────────────────────────
              // Muestra un icono de Material Design.
              Text(
                'Icons:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 40),
                  Icon(Icons.favorite, color: Colors.red, size: 40),
                  Icon(Icons.home, color: Colors.blue, size: 40),
                  Icon(Icons.settings, color: Colors.grey, size: 40),
                ],
              ),

              SizedBox(height: 20),

              // ─── FORM ────────────────────────────────────────────────────
              // Form agrupa TextFormField y permite validarlos juntos.
              Text(
                'Form:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              _ContactForm(),

              SizedBox(height: 20),

              // ─── LIST (ListView) ─────────────────────────────────────────
              // ListView muestra una lista de widgets de forma desplazable.
              // shrinkWrap: true para usarlo dentro de una columna.
              Text(
                'List (ListView):',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8),
              Lista(),

            ],
          ),
        ),
      ),
    );
  }
}

// ─── FORM ────────────────────────────────────────────────────────────────────
// Ejemplo oficial de Flutter para el widget Form.
// FormState.validate() llama al validator de cada TextFormField.
class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter your email'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

// ----- LIST -----
// Útil cuando se conoce la cantidad de elementos de antemano.
class Lista extends StatelessWidget {
  const Lista();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: const Color.fromARGB(255, 94, 41, 6),
          child: const Center(
          child: Text(
            'Sin derechos',
              style: TextStyle(
              color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          color: const Color.fromARGB(255, 197, 102, 39),
          child: const Center(
            child: Text(
              'Pocos derechos'
            ),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(
            child: Text(
              'Derechos pro max'
            ),
          ),
        ),
      ],
    );
  }
}
