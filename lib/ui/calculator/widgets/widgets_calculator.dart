// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

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

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(12.0),
      child: child,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 185, 186, 255).withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(0),
        ),
      ),
    );
  }
}

class ErrorAlertDialog extends StatelessWidget {
  final String errorMessage;

  const ErrorAlertDialog({required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(errorMessage),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Aceptar'),
          onPressed: () {
            Navigator.of(context).pop(); // Cierra la alerta
          },
        ),
      ],
    );
  }
}