import 'package:flutter/material.dart';
import 'package:portefolio/common/objects.dart';
import 'package:portefolio/common/widgets/big_card.dart';
import 'package:portefolio/common/widgets/card.dart';

class MyGridView extends StatelessWidget {
  final ValueChanged<String?> onItemSelected;
  final String? selectedItem;
  final List<MyFramework> list;
  const MyGridView(
      {required this.list,
      required this.onItemSelected,
      required this.selectedItem,
      super.key});

  @override
  Widget build(BuildContext context) {
    list.map((e) => e.star).toList().sort();
    return Row(
      children: list.map((framework) {
        ValueNotifier<bool> isHov = ValueNotifier(false);

        return ValueListenableBuilder<bool>(
            valueListenable: isHov,
            builder: (context, isHover, child) {
              return Expanded(
                flex: isHover || selectedItem == framework.label ? 3 : 1,
                child: InkWell(
                  onTap: () {
                    if (selectedItem != framework.label) {
                      return onItemSelected(framework.label);
                    } else {
                      return onItemSelected(null);
                    }
                  },
                  onHover: (value) {
                    isHov.value = value;
                  },
                  child: isHover || selectedItem == framework.label
                      ? MyBigCard2(
                          star: framework.star,
                          description: framework.description,
                          label: framework.label)
                      : MyCard(
                          label: framework.label
                              .replaceAll("_", " ")
                              .toUpperCase(),
                          child: Image.asset("assets/${framework.label}.png"),
                        ),
                ),
              );
            });
      }).toList(),
    );
    // GridView.builder(
    //   itemCount: list.length,
    //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
    //       maxCrossAxisExtent:
    //           MediaQuery.of(context).size.width < 900 ? 50 : 80),
    //   itemBuilder: (BuildContext context, int index) {
    //     ValueNotifier<bool> _isHover = ValueNotifier(false);
    //     return InkWell(
    //       onTap: () {},
    //       onHover: (value) {
    //         _isHover.value = value;
    //       },
    //       child: ValueListenableBuilder<bool>(
    //           valueListenable: _isHover,
    //           builder: (context, isHover, child) {
    //             return isHover
    //                 ? Container(
    //                     height: 100,
    //                     width: 50,
    //                     color: Colors.amber,
    //                   )
    //                 : MyCard(
    //                     label: list[index]
    //                         .label!
    //                         .replaceAll("_", " ")
    //                         .toUpperCase(),
    //                     child: Image.asset("assets/${list[index].label}.png"),
    //                   );
    //           }),
    //     );
    //   },
    // );
  }
}
