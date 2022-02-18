import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/transferencia.dart';
import 'formulario_transferencia.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            final Future<Transferencia?> future =
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }));
            future.then((transferenciaRecebida) {
              Future.delayed(Duration(seconds: 1), () {
                debugPrint('Chegou no then');
                debugPrint('$transferenciaRecebida');
                if (transferenciaRecebida != null) {
                  setState(() {
                    widget._transferencias.add(transferenciaRecebida);
                  });
                }
              });
            });
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: const Icon(Icons.monetization_on),
          title: Text(_transferencia.valor.toString()),
          subtitle: Text(_transferencia.numeroConta.toString()),
        ));
  }
}