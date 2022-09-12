import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sorveteria/Item.dart';
import 'package:sorveteria/Sorvete.dart';
import 'package:sorveteria/Sorveteria.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String saborSelecionado = 'Chocolate';
  var sabores = [
    Item('Chocolate', 2.5), 
    Item('Morango', 2.3),
    Item('Maracujá', 3.5),
    Item('Uva', 2.2),
    Item('Flocos', 3.0),
    Item('Ferrero Rocher', 4.25)
  ];

  String coberturaSelecionada = 'Kiwi';
  var coberturas = [
    Item('Kiwi', 2.0), 
    Item('Calda Quente', 3.0),
    Item('Groselha', 2.0),
    Item('Limão', 2.0),
    Item('Caramelo', 2.0),
  ];

  String toppingSelecionado = 'Castanha';
  var toppings = [
    Item('Castanha', 1.75), 
    Item('Nozes', 2.7),
    Item('Amendoim', 1.5),
    Item('Cereja', 3.2),
  ];

  Sorveteria sorveteria = new Sorveteria();
  double precoTotal = 0;

  montarSorvete(){
    setState(() {
      precoTotal = 0;
      precoTotal += sorveteria.calcularPrecoTotal(
        new Sorvete(
          sabores.firstWhere((sabor) => sabor.nome == saborSelecionado),
          coberturas.firstWhere((cobertura) => cobertura.nome == coberturaSelecionada),
          toppings.firstWhere((topping) => topping.nome == toppingSelecionado)
        )
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sorveteria"),
        ),
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Text('Escolha um sabor: '),
              DropdownButton(
                value: saborSelecionado,
                items: sabores.map((Item item) {
                  return DropdownMenuItem(
                    value: item.nome,
                    child: Text(item.nome),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    saborSelecionado = newValue!;
                  });
                }
              ),

              Text('Escolha uma cobertura'),
              DropdownButton(
                value: coberturaSelecionada,
                items: coberturas.map((Item item) {
                  return DropdownMenuItem(
                    value: item.nome,
                    child: Text(item.nome),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    coberturaSelecionada = newValue!;
                  });
                }
              ),

              Text('Escolha um topping'),
              DropdownButton(
                value: toppingSelecionado,
                items: toppings.map((Item item) {
                  return DropdownMenuItem(
                    value: item.nome,
                    child: Text(item.nome),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    toppingSelecionado = newValue!;
                  });
                },
              ),

              Spacer(),
              Text('Preço total: '),
              Text(precoTotal.toString()),

              Spacer(),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  montarSorvete();
                },
                child: const Text('Calcular'),
              ),
              Spacer()
            ],
          ),
        ),
      )
    );
  }
}