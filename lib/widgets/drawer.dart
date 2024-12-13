import 'package:flutter/material.dart';
import 'package:portefolio/common/objects.dart';
import 'package:portefolio/common/style.dart';

class MyDrawer extends StatefulWidget {
  final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final VoidCallback callback;
  const MyDrawer(
      {required this.backgroundColor,
      required this.onDestinationSelected,
      required this.selectedIndex,
      required this.callback,
      super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool _isReorder = false;
  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 550
        ? MediaQuery.of(context).size.width / 70
        : MediaQuery.of(context).size.width / 20;

    return Drawer(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReorderableListView.builder(
            shrinkWrap: true,
            itemCount: pages.value.length,
            itemBuilder: (context, index) {
              return TextButton(
                key: pages.value[index].key,
                onPressed: () => widget.onDestinationSelected(index),
                child: Text(
                  pages.value[index].label,
                  style: textStyle(
                      fontSize,
                      index == widget.selectedIndex
                          ? Theme.of(context).primaryColor
                          : Colors.black),
                ),
              );
            },
            header: const Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/photo.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
            footer: _isReorder
                ? TextButton(
                    onPressed: widget.callback,
                    child: const Text("Valider la réorganisation"),
                  )
                : null,
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final MyPages item = pages.value.removeAt(oldIndex);
                pages.value.insert(newIndex, item);
                _isReorder = true;
              });
            }),
      ),
    ));
  }
}
