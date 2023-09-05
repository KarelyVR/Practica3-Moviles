// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:imc/ui/calculator/widgets/widgets_calculator.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController _pesoController = TextEditingController();
  // TextEditingController _alturaController = TextEditingController();
  String respuesta = "RESPUESTA";
  double conv = 0.0;

  // Define las opciones y los valores asociados
  Map<String, double> valoresAsociados = {
    'Dólar': 17.21,
    'Euro': 18.58,
    'Sol Peruano': 4.65,
    'Yen': 0.12,
  };

  String valorSeleccionado = 'Dólar';

  void _calcular() {
    setState(() {
      double peso = double.parse(_pesoController.text);
      double divisa = valoresAsociados[valorSeleccionado] ?? 1.0;
      conv = peso / divisa;
      respuesta = conv.toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyContainer(
          child: Form(
            child: Column(
              children: [
                Stack(
                  children: [MyBarContainer()],
                ),
                MyText(text: "Conversor de divisas"),
                _sizeEspacio(),
                MyTextInput(
                    inputController: _pesoController, label: "Valor en Pesos (MXN)"),
                _sizeEspacio(),
                DropdownButtonFormField<String>(
                  value: valorSeleccionado,
                  onChanged: (String? newValue) {
                    setState(() {
                      valorSeleccionado = newValue!;
                      _calcular(); // Llama a _calcular cuando cambia la opción
                    });
                  },
                  items: valoresAsociados.keys.map((opcion) {
                    return DropdownMenuItem<String>(
                      value: opcion,
                      child: Text(opcion),
                    );
                  }).toList(),
                  isDense: true,
                  iconSize: 24,
                  icon: const Icon(Icons.arrow_downward),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    border: OutlineInputBorder(),
                  ),
                ),
                _sizeEspacio(),
                MyText(text: "Resultado de la conversión"),
                MyText(text: respuesta.toString()),
                _sizeEspacio(),
                MyText(text: "Valor de 1 $valorSeleccionado a Pesos Mexicanos"),
                Text('${valoresAsociados[valorSeleccionado]}'),
                _sizeEspacio(),
                MyButton(lblText: const Text("Calcular"), press: () => _calcular()),
                _sizeEspacio(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sizeEspacio() {
    return const SizedBox(height: 30);
  }
}