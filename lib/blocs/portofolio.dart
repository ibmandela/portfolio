import 'package:flutter/material.dart';
import 'package:portefolio/common/objects.dart';
import 'package:portefolio/common/widgets/big_card.dart';
import 'package:portefolio/widgets/navigation_rail.dart';

class Portefolio extends StatefulWidget {
  // final Color backgroundColor;
  const Portefolio(
      {
      // required this.backgroundColor,
      super.key});

  @override
  State<Portefolio> createState() => _PortefolioState();
}

class _PortefolioState extends State<Portefolio> {
  final ValueNotifier<String?> _compatibility = ValueNotifier(null);
  late final _backgroundColor = Color.alphaBlend(
      Theme.of(context).colorScheme.primary.withOpacity(0.14),
      Theme.of(context).colorScheme.surface);
  @override
  Widget build(BuildContext context) {
    List<MyBuildedApps> list = _compatibility.value != null
        ? myAppList
            .where((e) => e.compatibility!.contains(_compatibility.value))
            .toList()
        : myAppList;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyNavigationRailBar(
          selectedItem: _compatibility,
          selectedIndex: 0,
          onDestinationSelected: (value) => {
            setState(() {
              _compatibility.value = value;
            }),
          },
          backgroundColor: _backgroundColor,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width > 550
                    ? MediaQuery.of(context).size.width / 10
                    : 8),
            child: GridView.builder(
              // shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.height / 2,
                crossAxisSpacing: 1,
                // childAspectRatio: 1,
                // crossAxisCount:
                //     MediaQuery.of(context).size.width > 550 ? 3 : 1
              ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return MyBigCard(
                  codeLink: list[index].githubLink,
                  appLink: list[index].appLink,
                  backgroundColor: _backgroundColor,
                  comment: list[index].comment,
                  isPhoneImage: list[index].isPhoneImage,
                  child: list[index].image,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
