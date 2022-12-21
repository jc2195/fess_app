import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fess/views/widgets/dropdown_input.dart';
import 'package:fess/models/institution_model.dart';
import 'welcome_button.dart';

class InstitutionForm extends StatelessWidget{

  final Function onSubmit;
  final List<String> options;

  InstitutionForm({this.onSubmit, this.options});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InstitutionModel(),
      child: Consumer<InstitutionModel>(
        builder: (context, inst, child) => Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 165),
                child: DropdownInput(
                  onChanged: (value){
                    inst.institution = value;
                  },
                  isError: !inst.validInstitution,
                  errorText: inst.institutionError,
                  labelText: 'University',
                  options: options,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                child: WelcomeButton(
                  'Next',
                      () {
                    if (inst.validateForm()) {
                      onSubmit(inst.institution);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}