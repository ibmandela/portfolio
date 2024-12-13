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
    _tabController = TabController(length: pages.value.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_tabController.indexIsChanging) {
      _tabController.index = widget.selectedIndex;
    }
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
            ? MediaQuery.of(context).size.width > 550
                ? ""
                : "BIENVENUE CHEZ IB-DEVELOPPE"
            : pages.value[widget.selectedIndex].label.toUpperCase(),
        style: titleStyle(
            MediaQuery.of(context).size.width > 550
                ? MediaQuery.of(context).size.width / 110
                : MediaQuery.of(context).size.width / 25,
            null),
      ),
      actions: [
        if (MediaQuery.of(context).size.width > 550)
          SizedBox(
              width: MediaQuery.of(context).size.width > 700
                  ? 700
                  : MediaQuery.of(context).size.width,
              child: TabBar(
                  controller: _tabController,
                  tabs: pages.value.map((d) {
                    return Tab(text: d.label);
                  }).toList()))
      ],
      bottom: MediaQuery.of(context).size.width > 550
          ? null
          : TabBar(
              controller: _tabController,
              tabs: pages.value.map((d) {
                return Tab(
                  icon: d.icons,
                );
              }).toList()),
    );
  }
}
