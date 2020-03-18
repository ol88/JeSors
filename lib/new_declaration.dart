import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'raisons.dart';

class NewDeclaration extends StatelessWidget {
  static const routeName = '/newDeclaration';
  final _dateFormat = DateFormat("d/MM/yyyy");
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> _userInputs =
        ModalRoute.of(context).settings.arguments;
    final List<String> _personalDetails = _userInputs["details"];
    final _reason = _userInputs["reason"];
    final _fullName = _personalDetails[0] + " " + _personalDetails[1];
    final _dateOfBirth = _personalDetails[2];
    final _address = _personalDetails[3];
    final bodyTextStyle =
        TextStyle(color: Theme.of(context).textTheme.bodyText2.color);

    return Scaffold(
      appBar: AppBar(title: Text("Nouvelle Déclaration")),
      body: SizedBox.expand(
          child: SingleChildScrollView(
            controller: _scrollController,
                      child: Column(
              children: <Widget>[
      //Centered
      Align(
        alignment: Alignment.topCenter,
        child: Column(
            children: <Widget>[
              Text(
                "\nATTESTATION DE DÉPLACEMENT DÉROGATOIRE",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      "\nEn application de l’article 1er du décret du 16 mars 2020 portant réglementation des déplacements dans le cadre de la lutte contre la propagation du virus Covid-19 :",
                  style: bodyTextStyle,
                ),
              ),
            ],
        ),
      ),
      // Right aligned.
      Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 00),
        child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailTextBlock("Je soussigné(e)"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            DetailTextBlock("Mme / M."),
                            DetailTextBlock("Né(e) le :"),
                            DetailTextBlock("Demeurant :")
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          DetailTextBlock(_fullName),
                          DetailTextBlock(_dateOfBirth),
                          DetailTextBlock(_address),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "certifie que mon déplacement est lié au motif suivant (cocher la case) autorisé par l’article 1er du décret du 16 mars 2020 portant réglementation des déplacements dans le cadre de la lutte contre la propagation du virus Covid-19 :",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText2.color),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 8.0),
                  child: _reasonCheckBoxes(context, _reason),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Fait à " +
                            "_city" +
                            ", le " +
                            _dateFormat.format(DateTime.now()),
                      ),
                    ),
                  ],
                )
              ],
            ),
        ),
      ),
              ],
            ),
          ),
        ),
    );
  }

  Widget _reasonCheckBoxes(BuildContext context, int reason) {
    List<Widget> _iconColumn = [];
    IconData _icon;
    for (var i = 0; i <= 4; i++) {
      if (i == reason) {
        _icon = Icons.check_box;
      } else {
        _icon = Icons.check_box_outline_blank;
      }

      _iconColumn.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Icon(
                  _icon,
                ),
              ),
              Flexible(
                child: Container(
                  child: Text(
                    Raisons.raisons[i],
                    softWrap: true,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _iconColumn,
      ),
    );
  }
}

class DetailTextBlock extends StatelessWidget {
  final String text;

  DetailTextBlock(this.text);

  @override
  Widget build(BuildContext context) {
    final bodyTextStyle =
        TextStyle(color: Theme.of(context).textTheme.bodyText2.color);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        style: bodyTextStyle,
        softWrap: true,
      ),
    );
  }
}
