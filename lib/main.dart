import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portefolio/common/objects.dart';
import 'package:portefolio/common/style.dart';
import 'package:portefolio/widgets/appar_bar.dart';
import 'package:portefolio/widgets/bottom_bar.dart';
import 'package:portefolio/widgets/drawer.dart';
import 'package:portefolio/widgets/floating_button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.radioCanadaTextTheme(),
          colorSchemeSeed: Colors.blue,
          useMaterial3: true),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final _colorScheme = Theme.of(context).colorScheme;
  final PageController _pageViewController = PageController();

  late final _backgroundColor = Color.alphaBlend(
      _colorScheme.primary.withOpacity(0.14), _colorScheme.surface);
  int selectedIndex = 0;
  bool controllerInitialized = false;
  late final _controler = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(milliseconds: 1250),
      value: 0);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final ValueNotifier<double> width = ValueNotifier<double>(0);
  @override
  void dispose() {
    _controler.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _showMyDialog());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width.value = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: _backgroundColor,
        appBar: PreferredSize(
          preferredSize: width.value > 550
              ? Size.fromHeight(MediaQuery.of(context).size.height / 15)
              : Size.fromHeight(MediaQuery.of(context).size.height / 10),
          child: MyAppBar(
            onDestinationSelected: (index) {
              _updateCurrentPageIndex(index);
            },
            selectedIndex: selectedIndex,
            width: width,
            backgroundColor: _backgroundColor,
          ),
        ),
        body: PageView(
            pageSnapping: width.value > 550 ? false : true,
            scrollDirection:
                width.value > 550 ? Axis.vertical : Axis.horizontal,
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            children: pages.value.map((page) => page.page).toList()),
        bottomNavigationBar: MyBottomBar(
          backgroundColor: _backgroundColor,
        ),
        floatingActionButton: selectedIndex != 0
            ? MyFloatingActionButton(
                // animation: _barAnimation,
                key: const Key("FAB1"),
                onPressed: () {
                  setState(() {
                    selectedIndex = 0;
                    _updateCurrentPageIndex(0);
                  });
                },
                elevation: 10,
                child: width.value > 550
                    ? const Icon(Icons.arrow_upward)
                    : const Icon(Icons.arrow_back),
              )
            : null,
        drawer:
            // width.value > 600
            //     ? null
            //     :
            MyDrawer(
          callback: () => setState(() {}),
          backgroundColor: _backgroundColor,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            _updateCurrentPageIndex(index);
          },
        ),
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    // if (!_isOnDesktopAndWeb) {
    //   return;
    // }
    // _tabController.index = currentPageIndex;
    setState(() {
      selectedIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  _showMyDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                "Vous pouvez regarder ce site dans l'ordre que vous voulez.\nIl vous suffit d'appuyer sur l'icône Menu en haut à gauche.",
                style: standard,
              ),
              content: SizedBox(
                  width: MediaQuery.of(context).size.width > 800
                      ? MediaQuery.of(context).size.width / 4
                      : MediaQuery.of(context).size.width / 2,
                  child: Image.asset("assets/portfolio-flutter.gif")),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Compris"))
              ],
            ));
  }
}
