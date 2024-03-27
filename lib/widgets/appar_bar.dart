import 'package:flutter/material.dart';
import 'package:portefolio/common/objects.dart';
import 'package:portefolio/common/style.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar(
      {required this.onDestinationSelected,
      required this.selectedIndex,
      required this.backgroundColor,
      required this.width,
      super.key});
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final ValueNotifier<double> width;
  final Color backgroundColor;

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}

class _MyAppBarState extends State<MyAppBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController.index = widget.selectedIndex;
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        widget.onDestinationSelected(_tabController.index);
      }
    });
    return AppBar(
        // elevation: 10,
        backgroundColor: widget.backgroundColor,
        title: Text(
          pages.value[widget.selectedIndex].label == "Acceuil"
              ? "BIENVENUE CHEZ IB-DEVELOPPE"
              : pages.value[widget.selectedIndex].label.toUpperCase(),
          style: caracteristique,
        ),
        actions: [
          if (MediaQuery.of(context).size.width > 700)
            SizedBox(
                width: 700,
                child: TabBar(
                    controller: _tabController,
                    tabs: pages.value.map((d) {
                      return Tab(text: d.label);
                      // icon: Icon(d.icon),
                      // label: d.label,
                    }).toList()))
        ]);
  }
}
