import 'package:flutter/material.dart';
import 'package:portefolio/common/style.dart';

class MyClickableCard extends StatefulWidget {
  final Widget child;
  final VoidCallback callBack;
  const MyClickableCard(
      {required this.child, required this.callBack, super.key});

  @override
  State<MyClickableCard> createState() => _MyClickableCardState();
}

class _MyClickableCardState extends State<MyClickableCard> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // width: 40,
      // height: 50,
      duration: const Duration(milliseconds: 200),
      padding:
          EdgeInsets.only(top: (_isHover) ? 3 : 5, bottom: !(_isHover) ? 3 : 5),
      child: Card(
        color: _isHover ? Theme.of(context).primaryColor : null,
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(5))),
        // color: Theme.of(context).scaffoldBackgroundColor,
        // elevation: 5,
        child: SizedBox(
          height: 45,
          width: 45,
          child: InkWell(
            onHover: (val) {
              setState(() {
                _isHover = val;
              });
            },
            onTap: widget.callBack,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class MyClickableCard2 extends StatefulWidget {
  final Widget child;
  final VoidCallback callback;
  final String label;
  final bool isSelected;
  final bool extend;
  const MyClickableCard2(
      {required this.child,
      required this.callback,
      required this.label,
      required this.isSelected,
      required this.extend,
      super.key});

  @override
  State<MyClickableCard2> createState() => _MyClickableCard2State();
}

class _MyClickableCard2State extends State<MyClickableCard2> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // width: 40,
      // height: 50,
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(
          right: (_isHover || widget.isSelected) ? 3 : 12,
          top: !(_isHover || widget.isSelected) ? 3 : 5),
      child: Card(
        color: _isHover || widget.isSelected
            ? Theme.of(context).primaryColor
            : null,
        // shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(5))),
        // color: Theme.of(context).scaffoldBackgroundColor,
        // elevation: 5,
        child: InkWell(
          onHover: (val) {
            setState(() {
              _isHover = val;
            });
          },
          onTap: widget.callback,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 80, child: widget.child),
                  const SizedBox(
                    width: 10,
                  ),
                  if (widget.extend)
                    Text(
                      widget.label,
                      style: standard.copyWith(
                        color: _isHover || widget.isSelected
                            ? Colors.white
                            : Colors.black,
                      ),
                    )
                ],
              )),
        ),
      ),
    );
  }
}
