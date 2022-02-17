import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerNumeroConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0), //Você consegue deixar a seu gosto.
              child: TextField(
                controller: _controllerNumeroConta, //Funciona como um ID.
                style: TextStyle(fontSize: 24.0),
                decoration: const InputDecoration(
                    labelText: 'Número da conta', hintText: '0000-0'),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0), //Você consegue deixar a seu gosto.
              child: TextField(
                controller: _controllerCampoValor,
                style: TextStyle(fontSize: 24.0),
                decoration: const InputDecoration(
                    icon: Icon(Icons.monetization_on),
                    labelText: 'Valor',
                    hintText: '0,00'),
                keyboardType: TextInputType.number,
              ),
            ),
            RaisedButton(
              child: const Text('Confirmar'),
              onPressed: () {
                debugPrint('Clickou no confirmar');
                final double? valor =
                    double.tryParse(_controllerCampoValor.text);
                final int? conta = int.tryParse(_controllerNumeroConta.text);
                if (valor != null && conta != null) {
                  final transferenciaCriada = Transferencia(valor, conta);
                  debugPrint('$transferenciaCriada');
                }
              },
            )
          ],
        ));
  }
}

/*  Iremos criar um widget só nosso!
  * StatefulWidget = dynamic
  * StatelessWidget = static
 */
class ListaTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 2000)),
          ItemTransferencia(Transferencia(300.0, 3000)),
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
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

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
