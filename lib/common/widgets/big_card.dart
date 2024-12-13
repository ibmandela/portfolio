import 'package:flutter/material.dart';
import 'package:portefolio/common/functions.dart';
import 'package:portefolio/common/style.dart';
import 'package:portefolio/common/widgets/button.dart';

class MyBigCard extends StatefulWidget {
  final Color backgroundColor;
  final Widget child;
  final String comment;
  final String codeLink;
  final String appLink;
  final bool isPhoneImage;
  const MyBigCard(
      {required this.appLink,
      required this.codeLink,
      required this.child,
      required this.comment,
      required this.isPhoneImage,
      required this.backgroundColor,
      super.key});

  @override
  State<MyBigCard> createState() => _MyBigCardState();
}

class _MyBigCardState extends State<MyBigCard> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 550
        ? MediaQuery.of(context).size.width / 140
        : MediaQuery.of(context).size.width / 40;
    return AnimatedContainer(
      // width: 40,
      // height: 50,
      duration: const Duration(milliseconds: 200),
      padding:
          EdgeInsets.only(top: (_isHover) ? 3 : 5, bottom: !(_isHover) ? 3 : 5),
      child: Material(
        elevation: 10,
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(30))),
        color: !_isHover ? null : Theme.of(context).primaryColor,
        // elevation: 5,
        // child: SizedBox(
        //   height: 45,
        //   width: 45,
        child: InkWell(
            onHover: (val) {
              setState(() {
                _isHover = val;
              });
            },
            onTap: () {
              setState(() {
                _isHover = !_isHover;
              });
            },
            child: widget.isPhoneImage
                ? Stack(
                    children: [
                      Row(
                        children: [
                          Material(elevation: 10, child: widget.child),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              widget.comment,
                              style: standard.copyWith(fontSize: fontSize),
                            ),
                          ))
                        ],
                      ),
                      if (_isHover)
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: _buildColumn())
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(elevation: 20, child: widget.child),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Text(
                                widget.comment,
                                style: standard.copyWith(
                                    color:
                                        _isHover ? Colors.white : Colors.black,
                                    fontSize: fontSize),
                              ),
                              if (_isHover)
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: _buildColumn())
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
      ),
      // ),
    );
  }

  _buildColumn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
            child: MyButton(
          label: "Code source",
          callback: () => launchUPageWeb(widget.codeLink),
        )),
        Expanded(
            child: MyButton(
          label: "Voir l'appli",
          callback: () => launchUPageWeb(widget.appLink),
        ))
      ],
    );
  }
}

class MyBigCard2 extends StatelessWidget {
  final String label;
  final String description;
  final int star;
  const MyBigCard2(
      {required this.description,
      required this.label,
      required this.star,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 3.5,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Card(
              margin: const EdgeInsets.only(top: 12),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/$label.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      label.replaceAll("_", " ").toUpperCase(),
                      style: standard,
                    ),
                    const SizedBox(),
                    Expanded(
                      child: Text(
                        description,
                        style: small,
                      ),
                    )
                  ],
                ),
              ),
            ),
            FittedBox(child: _buildStars(star)),
          ],
        ));
  }

  _buildStars(star) {
    Color color = const Color.fromARGB(255, 162, 147, 10);
    if (star == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star_outline,
            color: color,
          ),
          Icon(
            Icons.star_outline,
            color: color,
          ),
          Icon(
            Icons.star_outline,
            color: color,
          ),
        ],
      );
    } else if (star == 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star_outline,
            color: color,
          ),
          Icon(
            Icons.star_outline,
            color: color,
          ),
        ],
      );
    } else if (star == 4) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star_outline,
            color: color,
          ),
        ],
      );
    } else if (star == 5) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star,
            color: color,
          ),
          Icon(
            Icons.star,
            color: color,
          ),
        ],
      );
    }
  }
}
