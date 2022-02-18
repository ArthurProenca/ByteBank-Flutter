import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/editor.dart';
import '../models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerNumeroConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final double? valor = double.tryParse(_controllerCampoValor.text);
    final int? conta = int.tryParse(_controllerNumeroConta.text);
    if (valor != null && conta != null) {
      final transferenciaCriada = Transferencia(valor, conta);
      debugPrint('Criando transferência');
      Navigator.pop(context, transferenciaCriada);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controllerNumeroConta,
                rotulo: 'Número da conta',
                dica: 'xxxx-x',
              ),
              Editor(
                  controlador: _controllerCampoValor,
                  rotulo: 'Valor',
                  dica: '100,00',
                  icone: Icons.monetization_on),
              RaisedButton(
                child: const Text('Confirmar'),
                onPressed: () => _criaTransferencia(context),
              )
            ],
          ),
        ));
  }
}