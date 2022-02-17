import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: Column(
            children: const [
              Card(
                  child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('100,00'),
                subtitle: Text('1000,00'),
              )),
              Card(
                  child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('100,00'),
                subtitle: Text('1000,00'),
              )),
            ],
          ), //Adiciona ao corpo do Scaffold
          appBar: AppBar(
            title: const Text('Transferências'),
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {}, child: const Icon(Icons.add)),
        ),
      ),
    );
