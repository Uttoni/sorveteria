import 'package:sorveteria/Sorvete.dart';

class Sorveteria {
  double calcularPrecoTotal(Sorvete sorvete){
    return sorvete.sabor.preco + sorvete.cobertura.preco + sorvete.topping.preco;
  }
}