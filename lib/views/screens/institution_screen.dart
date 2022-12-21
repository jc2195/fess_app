import 'package:flutter/material.dart';
import 'package:fess/views/widgets/institution_form.dart';

class InstitutionScreen extends StatelessWidget {
  final List options;
  final Function onSubmit;
  final Function onBack;

  InstitutionScreen({this.options, this.onSubmit, this.onBack});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      movementDuration: Duration(milliseconds: 200),
      resizeDuration: Duration(milliseconds: 1),
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) => onBack(),
      child: Stack(
        children: [
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: IconButton(
                onPressed: onBack,
                iconSize: 30,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 97),
                child:
                    InstitutionForm(options: options, onSubmit: this.onSubmit),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
