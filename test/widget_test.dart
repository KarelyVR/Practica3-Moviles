import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DropdownButton items should have unique values', (WidgetTester tester) async {
    List<String> dropdownItems = [
      'Dólar',
      'Euro',
      'Yen',
      'Libra Esterlina',
      'Dólar', // Introduce un valor duplicado aquí para la prueba
    ];

    // Renderiza un DropdownButtonFormField con las opciones
    await tester.pumpWidget(
      MaterialApp(
        home: DropdownButtonFormField<String>(
          value: dropdownItems[0],
          onChanged: (String? newValue) {},
          items: dropdownItems.map((opcion) {
            return DropdownMenuItem<String>(
              value: opcion,
              child: Text(opcion),
            );
          }).toList(),
        ),
      ),
    );

    // Realiza la prueba para verificar que los valores sean únicos
    final errorFinder = find.byType(AssertionError);
    expect(errorFinder, findsOneWidget);
  });
}
