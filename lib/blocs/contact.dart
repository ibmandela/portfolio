import 'package:flutter/material.dart';
import 'package:portefolio/common/functions.dart';
import 'package:portefolio/common/style.dart';
import 'package:portefolio/common/widgets/card.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  bool _isSms = false;
  bool _isMail = false;
  final _messageControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 550
        ? MediaQuery.of(context).size.width / 60
        : MediaQuery.of(context).size.width / 30;
    return Row(
      children: [
        Expanded(
          // width: MediaQuery.of(context).size.width / 2,
          child: Image.asset("assets/contact.png"),
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Contactez moi",
              style: titleStyle(fontSize, null),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildRow(
                const Icon(Icons.phone_android),
                "+33 6 98 55 75 67",
                TextButton(
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  onPressed: () {
                    setState(() {
                      _isMail = false;
                      _isSms = !_isSms;
                    });
                  },
                  child: Text(
                    "+33 6 98 55 75 67",
                    style: titleStyle(fontSize, null),
                  ),
                )),
            if (_isSms) _buildTextField(),
            _buildRow(
                Image.asset("assets/whatsapp.png"),
                "+33 6 98 55 75 67",
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "+33 6 98 55 75 67",
                    style: titleStyle(fontSize, null),
                  ),
                )),
            _buildRow(
                const Icon(Icons.email),
                "ibrahimacicamara@gmail.com",
                TextButton(
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  onPressed: () {
                    setState(() {
                      _isSms = false;
                      _isMail = !_isMail;
                    });
                  },
                  child: Text(
                    "ibrahimacicamara@gmail.com\nibdeveloppe@gmail.com",
                    style: titleStyle(fontSize, null),
                  ),
                )),
            if (_isMail) _buildTextField(),
            _buildRow(
                Image.asset("assets/github.png"),
                "",
                TextButton(
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  onPressed: () {
                    launchUPageWeb("github.com/ibmandela");
                  },
                  child: Text(
                    "Ibrahima Camara",
                    style: titleStyle(fontSize, null),
                  ),
                )),
            _buildRow(
                Image.asset("assets/linkedin.png"),
                "",
                TextButton(
                  style: const ButtonStyle(alignment: Alignment.centerLeft),
                  onPressed: () {
                    launchUPageWeb("linkedin.com/in/ibrahima-camara-11b369172");
                  },
                  child: Text(
                    "Ibrahima Camara",
                    style: titleStyle(fontSize, null),
                  ),
                )),
          ],
        ))
      ],
    );
  }

  _buildRow(child, label, widget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyCard(child: child, label: label),
        const SizedBox(
          width: 10,
        ),
        Expanded(child: widget)
      ],
    );
  }

  _buildTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            elevation: 10,
            child: SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width > 550
                  ? MediaQuery.of(context).size.width / 5
                  : MediaQuery.of(context).size.width / 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _messageControler,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    alignLabelWithHint: false,
                    border: InputBorder.none,
                    hintText: "Tapez votre message",
                    // label: Text("Message")
                  ),
                ),
              ),
            )),
        const SizedBox(
          width: 10,
        ),
        IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              setState(() {
                _isSms
                    ? Theme.of(context).platform == TargetPlatform.iOS ||
                            Theme.of(context).platform == TargetPlatform.android
                        ? sendSms(_messageControler.value.text)
                        : _showErrorDialog()
                    : sendMail(_messageControler.value.text);
              });
            })
      ],
    );
  }

  _showErrorDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Attention !!!"),
              content: const Text(
                  "La fonctionnalité d'envoi de SMS n'est disponible que sur un téléphone portable.\nVeuillez utiliser un téléphone portable ou envoyez moi un mail."),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            ));
  }
}
