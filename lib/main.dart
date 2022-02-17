import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      Column(
        children: <Widget>[ //<Widget> -> Array de Widgets
          const Text(
            'Deliver features faster',
            textDirection: TextDirection.ltr,
          ),
          const Text('Craft beautiful UIs', textDirection: TextDirection.ltr),
          Column(
            children: const <Widget>[
              Text('Árvore de widget', textDirection: TextDirection.ltr,),
            ],
          )
        ],
      ),
    );
