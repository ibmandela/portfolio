import 'package:flutter/material.dart';
import 'package:portefolio/common/objects.dart';
import 'package:portefolio/common/style.dart';
import 'package:portefolio/common/widgets/grid_view.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Programmation :",
            style: caracteristique,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Front-end",
                    style: caracteristique.copyWith(
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: MyGridView(
                        list: front,
                      ))
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Back-end",
                    style: caracteristique.copyWith(
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: MyGridView(list: back))
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Economie :",
                        style: caracteristique,
                      ),
                      Text(
                        "Finance, analyse financière, finance d’entreprise, finance de marché, comptabilité …",
                        style: subtitle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Maintenance :",
                        style: caracteristique,
                      ),
                      Text(
                        "Maintenance informatique, maintenance d’appareils téléphoniques ...",
                        style: subtitle,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Vente :",
                        style: caracteristique,
                      ),
                      Text(
                        "Vente, gestion de projets, gestion, gestion client …",
                        style: subtitle,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
