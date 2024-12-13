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
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 550
        ? MediaQuery.of(context).size.width / 60
        : MediaQuery.of(context).size.width / 30;

    return Padding(
      padding:
          EdgeInsets.all(MediaQuery.of(context).size.width > 550 ? 40 : 12),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  "Programmation :",
                  style: titleStyle(fontSize, null),
                ),
                MediaQuery.of(context).size.width > 550
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [_buildFront(fontSize), _buildBack(fontSize)],
                      )
                    : Column(
                        children: [_buildFront(fontSize), _buildBack(fontSize)],
                      ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.8,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Economie :",
                          style: titleStyle(fontSize, null),
                        ),
                        Text(
                          "Finance, analyse financière, finance d’entreprise, finance de marché, comptabilité …",
                          style: textStyle(fontSize, null),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Maintenance :",
                          style: titleStyle(fontSize, null),
                        ),
                        Text(
                          "Maintenance informatique, maintenance d’appareils téléphoniques ...",
                          style: textStyle(fontSize, null),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Vente :",
                          style: titleStyle(fontSize, null),
                        ),
                        Text(
                          "Vente, gestion de projets, gestion, gestion client …",
                          style: textStyle(fontSize, null),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildFront(fontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Front-end",
          style: titleStyle(fontSize, Theme.of(context).primaryColor),
        ),
        MediaQuery.of(context).size.width > 550
            ? SizedBox(
                width: MediaQuery.of(context).size.width / 2.5,
                child: MyGridView(
                  selectedItem: selectedItem,
                  onItemSelected: (label) {
                    setState(() {});
                    selectedItem = label;
                  },
                  list: front,
                ))
            : Column(
                children: [
                  MyGridView(
                    selectedItem: selectedItem,
                    onItemSelected: (label) {
                      setState(() {});
                      selectedItem = label;
                    },
                    list: front.sublist(0, 4),
                  ),
                  MyGridView(
                    selectedItem: selectedItem,
                    onItemSelected: (label) {
                      setState(() {});
                      selectedItem = label;
                    },
                    list: front.sublist(4),
                  )
                ],
              )
      ],
    );
  }

  _buildBack(fontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Back-end",
          style: titleStyle(fontSize, Theme.of(context).primaryColor),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width > 550
                ? MediaQuery.of(context).size.width / 3
                : null,
            child: MyGridView(
              selectedItem: selectedItem,
              onItemSelected: (label) {
                setState(() {});
                selectedItem = label;
              },
              list: back,
            ))
      ],
    );
  }
}
