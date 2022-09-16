import 'package:flutter_test/flutter_test.dart';
import 'package:sorveteria/Item.dart';
import 'package:sorveteria/Sorvete.dart';
import 'package:sorveteria/Sorveteria.dart';

void main(){
  test('Deve calcular o preço total do sorete', (){
    final sorvete = Sorvete(Item('chocolate', 2.5), Item('Calda Quente', 3.0), Item('Cereja', 3.2));
    final sorveteria = Sorveteria();

    final precoSorvete = sorveteria.calcularPrecoTotal(sorvete);

    expect(8.7, precoSorvete);
  });
}