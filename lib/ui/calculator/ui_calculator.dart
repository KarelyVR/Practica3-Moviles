import 'package:flutter/material.dart';
import 'package:imc/ui/calculator/widgets/widgets_calculator.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
TextEditingController _pesoController = TextEditingController();
TextEditingController _alturaController = TextEditingController();
String respuesta = "RESPUESTA";
double imc = 0.0;

void _calcular(){
  setState(() {
    double peso = double.parse(_pesoController.text);
    double altura = double.parse(_alturaController.text)/100;
    imc=peso/(altura*altura);
    respuesta=imc.toStringAsFixed(1); 
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Center(
          child: Text('Calculadora IMC')),
      ),*/
      body: SingleChildScrollView(
        child: MyContainer(
          child: Column(
            children: [
              Stack(
                children: [MyBarContainer()],                  
              ),
              MyText(text: "Calculadora IMC"),
              _sizeEspacio(),
              MyTextInput(
                inputController: _pesoController, 
                label: "Peso en kg"),
              MyTextInput(
                inputController: _alturaController, 
                label: "Altura en cm"),
              _sizeEspacio(),
              MyText(text: respuesta.toString()),
              _sizeEspacio(),
              MyButton(lblText: Text("Calcular"), 
              press: (()=>_calcular())),
              _sizeEspacio(),
              MyTable(),
            ],
          ),
        )
      ),
    );
  }
}

Widget _sizeEspacio(){
  return SizedBox(
    height: 30
    );
}