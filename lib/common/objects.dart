import 'package:flutter/material.dart';
import 'package:portefolio/blocs/contact.dart';
import 'package:portefolio/blocs/gestion.dart';
import 'package:portefolio/blocs/portofolio.dart';
import 'package:portefolio/blocs/presentation.dart';
import 'package:portefolio/blocs/skills.dart';

class MyPages {
  String label;
  Widget page;
  Widget icons;
  Key key;
  MyPages(
      {required this.label,
      required this.page,
      required this.icons,
      required this.key});
}

ValueNotifier<List<MyPages>> pages = ValueNotifier([
  MyPages(
      key: const ValueKey("Acceuil"),
      label: "Acceuil",
      icons: const Icon(Icons.home),
      page: const Presentation()),
  MyPages(
      key: const ValueKey("Mes compétences"),
      label: "Mes compétences",
      icons: const Icon(Icons.terminal),
      page: const Skills()),
  MyPages(
    key: const ValueKey("Mon portfolio"),
    label: "Mon portfolio",
    icons: const Icon(Icons.home_repair_service),
    page: const Portefolio(),
  ),
  MyPages(
    key: const ValueKey("Me contacter"),
    label: "Me contacter",
    icons: const Icon(Icons.quick_contacts_dialer),
    page: const ContactMe(),
  ),
  MyPages(
    key: const ValueKey("Gestion"),
    label: "Gestion",
    icons: const Icon(Icons.app_settings_alt_sharp),
    page: const Gestion(),
  ),
]);

class MyFramework {
  String label;
  int star;
  String description;
  MyFramework(
      {required this.label, required this.description, required this.star});
}

class MyDestination {
  String label;
  String destination;
  Widget image;
  MyDestination(
      {required this.label, required this.destination, required this.image});
}

class MyBuildedApps {
  List<String>? compatibility;
  bool isPhoneImage;
  Widget image;
  String comment;
  String githubLink;
  String appLink;

  MyBuildedApps(
      {required this.compatibility,
      required this.isPhoneImage,
      required this.image,
      required this.comment,
      required this.appLink,
      required this.githubLink});
}

class MyRowBuilder {
  Widget child;
  int flex;
  MyRowBuilder({required this.child, required this.flex});
}

List<MyFramework> front = [
  MyFramework(
      label: "flutter",
      star: 5,
      description:
          "Flutter est un kit de développement logiciel (SDK) d'interface utilisateur open-source créé par Google, utilisé pour développer des applications pour Android, iOS, Linux, Mac, Windows, Google Fuchsia et le web à partir d'une seule base de code..."),
  MyFramework(
      label: "javascript",
      star: 5,
      description:
          'JavaScript est un langage de programmation de scripts principalement employé dans les pages web interactives et à ce titre est une partie essentielle des applications web...'),
  MyFramework(
      label: "typescript",
      star: 4,
      description:
          "TypeScript est un langage de programmation libre et open source développé par Microsoft qui a pour but d'améliorer et de sécuriser la production de code JavaScript..."),
  MyFramework(
      label: "angular",
      star: 4,
      description:
          "Angular est un framework pour clients, open source, basé sur TypeScript et codirigé par l'équipe du projet « Angular » chez Google ainsi que par une communauté de particuliers et de sociétés..."),
  MyFramework(
      label: "node_js",
      star: 3,
      description:
          "Node.js est une plateforme logicielle libre en JavaScript, orientée vers les applications réseau évènementielles hautement concurrentes qui doivent pouvoir monter en charge..."),
  MyFramework(
      label: "react_js",
      star: 3,
      description:
          "React est une bibliothèque JavaScript libre. Elle est maintenue par Meta (anciennement Facebook) ainsi que par une communauté de développeurs individuels et d'entreprises depuis 2013..."),
  MyFramework(
      label: "c_sharp",
      star: 3,
      description:
          "C# est un langage de programmation orientée objet, commercialisé par Microsoft depuis 20022 et destiné à développer sur la plateforme Microsoft .NET..."),
  MyFramework(
      label: "kotlin",
      star: 4,
      description:
          "Kotlin est un langage de programmation orienté objet et fonctionnel, avec un typage statique qui permet de compiler pour la machine virtuelle Java, JavaScript, et vers plusieurs plateformes en natif (grâce à LLVM)..."),
  MyFramework(
      label: "vba",
      star: 3,
      description:
          "Visual Basic for Applications (VBA) est une implémentation de Microsoft Visual Basic qui est intégrée dans toutes les applications de Microsoft Office..."),
];
List<MyFramework> back = [
  MyFramework(
      label: "noSql",
      star: 5,
      description:
          "En informatique et en bases de données, NoSQL désigne une famille de systèmes de gestion de base de données (SGBD) qui s'écarte du paradigme classique des bases relationnelles..."),
  MyFramework(
      label: "firebase",
      star: 5,
      description:
          "Firebase est un ensemble d'outils pour l'hébergement et le développement d'applications mobiles et web, qui permet l'envoi de notifications et de publicités, la remontée des erreurs et des clics effectués dans l'application..."),
  MyFramework(
      label: "aws",
      star: 4,
      description:
          "Amazon Web Services (AWS) est une division du groupe américain de commerce électronique Amazon, spécialisée dans les services de cloud computing à la demande pour les entreprises et particuliers3..."),
  MyFramework(
      label: "sql",
      star: 4,
      description:
          "SQL (sigle pour Structured Query Language, « langage de requêtes structurées ») est un langage informatique normalisé servant à exploiter des bases de données relationnelles..."),
  MyFramework(
      label: "sql_lite",
      star: 3,
      description:
          "SQLite est une bibliothèque écrite en langage C qui propose un moteur de base de données relationnelle accessible par le langage SQL..."),
  MyFramework(
      label: "sql_serveur",
      star: 4,
      description:
          "Microsoft SQL Server est un système de gestion de base de données (SGBD) en langage SQL incorporant entre autres un SGBDR (SGBD relationnel ») développé et commercialisé par la société Microsoft..."),
];
List<MyBuildedApps> myAppList = [
  MyBuildedApps(
      appLink: "portfolio-camara-ibrahima.web.app/",
      githubLink: "github.com/ibmandela/portfolio.git",
      image: Image.asset("assets/portfolio-flutter.gif"),
      compatibility: ["computer", "tablet", "phone"],
      isPhoneImage: false,
      comment:
          "Site web « Responsive Design » montrant mon portfolio. Développé avec le Material Design 3 de flutter."),
  MyBuildedApps(
      appLink: "ibrahimacicamara.github.io/portfolio/",
      githubLink: "github.com/ibrahimacicamara/portfolio.git",
      image: Image.asset("assets/portfolio-angular.gif"),
      compatibility: ["computer", "tablet", "phone"],
      isPhoneImage: false,
      comment:
          "Site web « Responsive Design » montrant mon portfolio. Développé avec Angular 17."),
  MyBuildedApps(
      appLink: "ibrahimacicamara.github.io/bnpcarrier/",
      githubLink: "github.com/ibrahimacicamara/bnpcarrier.git",
      image: Image.asset("assets/bnp.gif"),
      compatibility: ["computer", "tablet", "phone"],
      isPhoneImage: false,
      comment:
          "Site web « Responsive Design » clone du site web BNP Carrière dont le but est de mettre en évidence mes compétences dans angular."),
  MyBuildedApps(
      appLink: "ibrahimacicamara.github.io/bpce/",
      githubLink: "https://github.com/ibrahimacicamara/bpce.git",
      image: Image.asset("assets/bpce.gif"),
      compatibility: ["computer", "tablet", "phone"],
      isPhoneImage: false,
      comment:
          "Site web « Responsive Design » clone du site web BPCE Carrière dont le but est de mettre en évidence mes compétences dans angular."),
  MyBuildedApps(
      appLink: "demarches-3d827.firebaseapp.com/#/",
      githubLink: "github.com/ibmandela/administratif.git",
      image: Image.asset("assets/admin_app.gif"),
      compatibility: ["computer"],
      isPhoneImage: false,
      comment:
          "Site web « Responsive Design » pour une mairie permettant aux utilisateurs de réaliser en ligne leur démarches administrative et demande de document administratif..."),
  MyBuildedApps(
      appLink: "samy-67c13.firebaseapp.com/",
      githubLink: "github.com/ibmandela/samy.git",
      image: Image.asset("assets/samy.gif"),
      compatibility: ["computer"],
      isPhoneImage: false,
      comment:
          "Site web « Responsive Design » permettant à une entreprise de fournir un système de diagnostic en ligne et un devis pour la réparation de leurs appareils."),
  MyBuildedApps(
      appLink: "appli-de-gestion.web.app/#/",
      githubLink: "github.com/ibmandela/commerce.git",
      image: Image.asset("assets/commerce_app.gif"),
      compatibility: ["computer", "tablet", "phone"],
      isPhoneImage: false,
      comment:
          "Application « Responsive Design » compatible Android, IOS, WEB pour gérer  les activités de son commerce permet entre autre de : produire des justificatifs via imprimante papier et thermique, gérer ses client et leur envoyer des messages, produire des statistiques …"),
  MyBuildedApps(
      appLink: "",
      githubLink: "github.com/ibmandela/chat.git",
      image: Image.asset("assets/chat_app.gif"),
      compatibility: ["tablet", "phone"],
      isPhoneImage: true,
      comment:
          "Application « Responsive Design » de chat compatible Android et IOS permettant aux conducteurs de véhicule de pouvoir communiquer entre eux. Permet l’enregistrement de plusieurs véhicules et leur gestion."),
];
List<MyDestination> destinations = <MyDestination>[
  MyDestination(
      image: Image.asset("assets/android.png"),
      destination: "phone",
      label: "android"),
  MyDestination(
      image: Image.asset("assets/iphone.png"),
      destination: "phone",
      label: "iphone"),
  MyDestination(
      image: Image.asset("assets/tablet.png"),
      destination: "tablet",
      label: "tablette"),
  MyDestination(
      image: Image.asset("assets/computer.png"),
      destination: "computer",
      label: "ordinateur"),
];
