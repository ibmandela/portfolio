import 'package:flutter/material.dart';
import 'package:portefolio/common/functions.dart';
import 'package:portefolio/common/style.dart';
import 'package:portefolio/common/widgets/card.dart';
import 'package:portefolio/common/widgets/clickable_card.dart';

class MyBottomBar extends StatefulWidget {
  final Color backgroundColor;

  const MyBottomBar({required this.backgroundColor, super.key});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  String _contact = "";
  bool _showContact = false;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 10,
      // color: backgroundColor,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _showContact
              ? Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          _contact == "06 98 55 75 67"
                              ? sendSms("")
                              : sendMail("");
                        },
                        child: Text(_contact, style: standard)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _showContact = false;
                          });
                        },
                        icon: const Icon(Icons.cancel_outlined))
                  ],
                )
              : Row(
                  children: [
                    Text(
                      "CONTACT :",
                      style: caracteristique.copyWith(
                          fontSize: MediaQuery.of(context).size.width / 60),
                    ),
                    InkWell(
                      child: MyClickableCard(
                        child: const Icon(Icons.phone_android_rounded),
                        callBack: () => setState(() {
                          _contact = "06 98 55 75 67";
                          _showContact = true;
                        }),
                      ),
                    ),
                    InkWell(
                      child: MyClickableCard(
                        child: const Icon(Icons.email_rounded),
                        callBack: () => setState(() {
                          _contact =
                              "ibrahimacicamara@gmail.com\nibdeveloppe@gmail.com";
                          _showContact = true;
                        }),
                      ),
                    ),
                    InkWell(
                      child: MyClickableCard(
                          child: Image.asset("assets/linkedin.png"),
                          callBack: () => launchUPageWeb(
                              "linkedin.com/in/ibrahima-camara-11b369172")),
                    ),
                    InkWell(
                      child: MyClickableCard(
                          child: Image.asset("assets/github.png"),
                          callBack: () =>
                              launchUPageWeb("github.com/ibmandela")),
                    ),
                  ],
                ),
          Row(
            children: [
              Text(
                "Meilleurs langages:",
                style: caracteristique.copyWith(
                    fontSize: MediaQuery.of(context).size.width / 60),
              ),
              MyCard(
                label: "DART",
                child: Image.asset("assets/dart.png"),
              ),
              MyCard(
                label: "JAVASCRIPT",
                child: Image.asset("assets/javascript.png"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
