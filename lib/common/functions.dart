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
