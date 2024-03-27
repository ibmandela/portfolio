import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portefolio/common/style.dart';

class Presentation extends StatefulWidget {
  // final ValueNotifier<double> width;
  const Presentation(
      {
      // required this.width,
      super.key});

  @override
  State<Presentation> createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  ValueNotifier<int> index = ValueNotifier(0);
  final ValueNotifier<String> _caracteristic = ValueNotifier("");
  List<String> caracteristic = [
    "esprit d’équipe",
    "esprit d’équipe",
    "ingéniosité",
    "facilité d’assimilation",
    "d’adaptation",
    "et d’intégration…"
  ];
  @override
  void initState() {
    _showWord();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Bienvenue dans mon monde",
                    style: subtitle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Moi c'est ",
                        style: title,
                      ),
                      Expanded(
                        child: Text(
                          "CAMARA IBRAHIMA",
                          style: title.copyWith(
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Je suis ",
                        style: title,
                      ),
                      Expanded(
                        child: Text(
                          "dévélopeur full stack",
                          style: title.copyWith(
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    style: subtitle,
                    "Je suis un développeur passionné qui n’a de cesse de trouver des solutions pour qu’une application soit la plus attractive possible mais surtout qu’elle soit un outil permettant à l’utilisateur d’exécuter le plus rapidement possible et de façon simple ce qu’il veut faire.",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        style: subtitle,
                        "Ce qui me caracterise : ",
                      ),
                      Expanded(
                        child: ValueListenableBuilder(
                            valueListenable: _caracteristic,
                            builder: (context, value, child) {
                              return Text(
                                style: subtitle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: index.value.isEven
                                        ? Colors.black
                                        : Theme.of(context).primaryColor),
                                value,
                              );
                            }),
                      )
                    ],
                  ),
                ],
              ),
            ),
            if (MediaQuery.of(context).size.width > 930)
              Expanded(
                // color: Colors.white,
                // height: MediaQuery.of(context).size.height / 1.5,
                // width: MediaQuery.of(context).size.width / 2.5,
                child: Image.asset("assets/waving.png"),
              ),
          ],
        ),
      ),
    );
  }

  _showWord() {
    Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (index.value == 5) {
        index.value = 0;
      }
      index.value++;
      _caracteristic.value = caracteristic[index.value];
    });
  }
}
