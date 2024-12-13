import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portefolio/common/functions.dart';
import 'package:portefolio/common/objects.dart';
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
    double width = MediaQuery.of(context).size.width;
    double fontSize = width > 550 ? width / 60 : width / 30;
    double titleSize = width > 550 ? width / 50 : width / 25;
    return Padding(
        padding: EdgeInsets.all(width > 550 ? 50.0 : 12),
        child: buildLayout([
          MyRowBuilder(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bienvenue dans mon monde",
                  style: textStyle(fontSize, null),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Moi c'est ",
                      style: titleStyle(titleSize, null),
                    ),
                    Expanded(
                      child: Text(
                        "CAMARA IBRAHIMA",
                        style: titleStyle(
                            titleSize, Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Je suis ",
                      style: titleStyle(titleSize, Colors.black),
                    ),
                    Expanded(
                      child: Text(
                        "dévélopeur full stack",
                        style: titleStyle(
                            titleSize, Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
                Text(
                  style: textStyle(fontSize, null),
                  "Je suis un développeur passionné qui n’a de cesse de trouver des solutions pour qu’une application soit la plus attractive possible mais surtout qu’elle soit un outil permettant à l’utilisateur d’exécuter le plus rapidement possible et de façon simple ce qu’il veut faire.",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      style: titleStyle(fontSize, null),
                      "Ce qui me caracterise : ",
                    ),
                    Expanded(
                      child: ValueListenableBuilder(
                          valueListenable: _caracteristic,
                          builder: (context, value, child) {
                            return Text(
                              style: titleStyle(
                                  fontSize,
                                  index.value.isEven
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
          MyRowBuilder(
            flex: 1,
            // color: Colors.white,
            // height: MediaQuery.of(context).size.height / 1.5,
            // width: MediaQuery.of(context).size.width / 2.5,
            child: SizedBox(
                height:
                    width < 850 ? MediaQuery.of(context).size.height / 3 : null,
                child: Image.asset("assets/waving.png")),
          ),
        ], width));
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
