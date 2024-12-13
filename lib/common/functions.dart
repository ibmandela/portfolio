import 'package:flutter/material.dart';
import 'package:portefolio/common/objects.dart';
import 'package:url_launcher/url_launcher.dart';

sendSms(body) {
  final smsLauchUri = Uri(
      scheme: "sms",
      path: "+33698557567",
      queryParameters: <String, String>{"body": body});
  launchUrl(smsLauchUri);
}

sendMail(String body) {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'ibrahimacicamara@gmail.com',
    query: encodeQueryParameters(<String, String>{
      'subject': body,
    }),
  );

  launchUrl(emailLaunchUri);
}

launchUPageWeb(adress) {
  // String? encodeQueryParameters(Map<String, String> params) {
  //   return params.entries
  //       .map((MapEntry<String, String> e) =>
  //           '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
  //       .join('&');
  // }

  final Uri emailLaunchUri = Uri(
    scheme: 'https',
    path: adress,
  );

  launchUrl(emailLaunchUri);
}

buildLayout(List<MyRowBuilder> children, width) {
  return width > 850
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children
              .map((widget) => Expanded(
                    flex: widget.flex,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: widget.child,
                    ),
                  ))
              .toList(),
        )
      : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: children
                .map((widget) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: widget.child,
                    ))
                .toList(),
          ),
        );
}
