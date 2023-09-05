// ignore_for_file: use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, prefer_final_fields, avoid_print

import 'package:flutter/material.dart';
import 'widgets/widgets_calculator.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController _pesoController = TextEditingController();
  String respuesta = "RESPUESTA";
  double conv = 0.0;

  Map<String, double> valoresAsociados = {
    'Dólar': 17.39,
    'Euro': 18.64,
    'Yen': 0.12,
    'Libra Esterlina': 21.87,
    'Dólar canadiense': 12.76,
    'Rupia india': 0.20,
    'Sol Peruano': 4.70,
    'Peso Argentino':0.049,
  };

  String valorSeleccionado = 'Dólar';

void _calcular() {
  setState(() {
    String pesoText = _pesoController.text;
    // Verifica si el campo está vacío o no
    if (pesoText.isNotEmpty) {
      // Si no está vacío, realiza la conversión
      double peso = double.parse(pesoText);
      double divisa = 1.0;

      try {
        divisa = valoresAsociados[valorSeleccionado] ?? 1.0;
      } catch (e) {
        showDialog(
        context: context,
        builder: (BuildContext context) {
          return const ErrorAlertDialog(errorMessage: 'Valor no valido');
        },
      );
      }

      conv = peso / divisa;
      respuesta = conv.toStringAsFixed(1);
    } else {
      // Si el campo está vacío
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const ErrorAlertDialog(errorMessage: 'El campo de entrada está vacío');
        },
      );
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversor de Divisas'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MyText(text: "", fontSize: 24.0, fontWeight: FontWeight.bold),
            const SizedBox(height: 30),
            MyTextInput(
                inputController: _pesoController,
                label: "Valor en Pesos (MXN)"),
            const SizedBox(height: 50),
            DropdownButtonFormField<String>(
              value: valorSeleccionado,
              onChanged: (String? newValue) {
                setState(() {
                  valorSeleccionado = newValue!;
                  _calcular();
                });
              },
              items: valoresAsociados.keys.map((opcion) {
                return DropdownMenuItem<String>(
                  value: opcion,
                  child: Text(opcion),
                );
              }).toList(),
              decoration: const InputDecoration(
                labelText: 'Selecciona una divisa',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30.0),
            _sizeEspacio(),
            const MyText(
              text: "Resultado de la conversión", 
              fontWeight: FontWeight.bold,
              ),
            MyText(
              text: respuesta.toString() + " " + valorSeleccionado,
            ),
            const SizedBox(height: 80.0),
            Align(
              alignment: Alignment.center,
              child: MyContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                        text: "Valor de 1 $valorSeleccionado a Pesos Mexicanos",
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                    MyText(
                        text: '${valoresAsociados[valorSeleccionado]}',
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _sizeEspacio() {
    return const SizedBox(height: 30);
  }
