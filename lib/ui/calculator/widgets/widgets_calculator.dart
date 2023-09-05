
// ignore_for_file: use_key_in_widget_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  const MyTextInput({super.key, required this.inputController, required this.label});

final TextEditingController inputController;
final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.only(left:70,right:70),
        child: TextFormField(
          controller: inputController,
          keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                prefixIcon: const Icon(Icons.person),
                labelStyle: const TextStyle(color: Colors.black38),
                labelText: label,
              ),
      ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyText extends StatelessWidget {
   MyText({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style:const TextStyle(
        color: Colors.black87,
        fontSize: 17,
        fontWeight: FontWeight.bold),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.lblText, required this.press});

final Text lblText;
final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        textStyle: const TextStyle(
          color: Colors.white,fontSize: 14, fontWeight: FontWeight.w500
        )
      ),
      child: const Text("Calcular"));
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 900,
      child: child,
      margin: const EdgeInsets.only(top:20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(31, 204, 202, 202).withOpacity(0.5),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ), 
      ),
    );
  }
}

class MyBarContainer extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(top:20),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70)
        ), 
      ),
    );
  }
}

// class MyTable extends StatelessWidget {
 
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width*0.7,
//       child: Table(border: TableBorder.all(),
//       children: const [
//         TableRow(children: [
//           Text('Menor a 18.5'),
//           Text('Peso Bajo')
//         ]),
//         TableRow(children: [
//           Text('18.6 a 24.9'),
//           Text('Peso Normal')
//         ]),
//         TableRow(children: [
//           Text('25 a 29.9'),
//           Text('Sobrepeso')
//         ]),
//         TableRow(children: [
//           Text('30 a 34.9'),
//           Text('Obsesidad leve')
//         ]),
//         TableRow(children: [
//           Text('35 a 39.9'),
//           Text('Obesidad media')
//         ]),
//         TableRow(children: [
//           Text('Mayor a 40'),
//           Text('Obesidad morbida')
//         ]),
//       ],
//       ),
//     );
//   }
// }