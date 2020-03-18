import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jesors/details_personels.dart';
import 'package:jesors/justifications.dart';
import 'package:jesors/mes_declarations.dart';

import 'new_declaration.dart';

void main() {
  runApp(JeSors());
}

class JeSors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JeSors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),

      //For App Localization
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //Supported Languages
      supportedLocales: [
        const Locale('fr', 'FR'),
      ],
      home: MyHomePage(title: 'JeSors'),
      routes: {
        NewDeclaration.routeName: (ctx) => NewDeclaration(),
        MesDeclaration.routeName: (ctx) => MesDeclaration(),
        Justifications.routeName: (ctx) => Justifications(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TapGestureRecognizer _tapGestureRecognizer;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _launchURL;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,30, 0, 12.0),
                  child: Text(
                    "ATTESTATION DE DÉPLACEMENT DÉROGATOIRE",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                  "Remplissez votre attestation directement sur votre mobile, en moins d'une minute et sans imprimante !",
                  textAlign: TextAlign.center,
                ),
                DetailsPersonels(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText2,
                      children: [
                        // Not required for english but may be required for other local where the Sign Up/In action is in the middle or end of the sentence and requires leading text.
                        TextSpan(
                          text:
                              "Aucune donnée n'est collectée par cette application purement gratuite et au code source libre et consultable directement ",
                        ),
                        TextSpan(
                          text: "ici",
                          recognizer: _tapGestureRecognizer,
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(
                          text: ".",
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Important: Cette application n'a pas été validée ou approuvée par le gouvernement Français. Aucune affiliation existe entre cette application et le gouvernment Français. L'utilisation de cette application est purement à la discretion de l'utilisateur. Les auteurs de l'application ne pourront en aucun cas être tenu(e)s responsable en cas de mauvaise utilisation.",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _launchURL() async {
  const url = 'https://github.com/ol88/JeSors';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
