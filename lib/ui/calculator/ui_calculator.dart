import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text('Conversor de Divisas'),
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
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 231, 150, 255),
                ),
                onPressed: () => _calcular(),
                child: const Text("Calcular"),
              ),
            ),
            const SizedBox(height: 220.0),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(16.0),
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

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const MyText({
    required this.text,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Text lblText;
  final Function() press;

  const MyButton({
    required this.lblText,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: lblText,
    );
  }
}

class MyTextInput extends StatelessWidget {
  final TextEditingController inputController;
  final String label;

  const MyTextInput({
    required this.inputController,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: inputController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(
              Icons.attach_money,
              color: Color.fromARGB(255, 9, 194, 15),
            )));
  }
}
