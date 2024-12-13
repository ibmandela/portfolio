import 'package:flutter/material.dart';
import 'package:portefolio/common/objects.dart';
import 'package:portefolio/common/style.dart';
import 'package:portefolio/common/widgets/clickable_card.dart';

class MyNavigationRailBar extends StatelessWidget {
  const MyNavigationRailBar(
      {required this.backgroundColor,
      required this.onDestinationSelected,
      required this.selectedIndex,
      required this.selectedItem,
      super.key});
  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<String?> onDestinationSelected;
  final ValueNotifier<String?> selectedItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MediaQuery.of(context).size.width > 550
            ? const Text(
                "Trier par plateforme",
                style: standard,
              )
            : const Text(
                "Trier\npar\nplateforme",
                style: standard,
              ),
        SizedBox(
            height: 350,
            width: MediaQuery.of(context).size.width > 550 ? 205 : 126,
            child: ListView.builder(
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  return MyClickableCard2(
                    extend: MediaQuery.of(context).size.width > 550,
                    callback: () {
                      onDestinationSelected(destinations[index].destination);
                    },
                    // (destinations[index].destination),
                    label: destinations[index].label,
                    isSelected:
                        selectedItem.value == destinations[index].destination,
                    child: destinations[index].image,
                  );
                })),
        if (selectedItem.value != null)
          TextButton(
              onPressed: () {
                onDestinationSelected(null);
              },
              child: const Text("Tout afficher"))
      ],
    );
  }
}
