import 'package:alcool_ou_gasolina/widgets/input.widget.dart';
import 'package:alcool_ou_gasolina/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class SubmitForm extends StatelessWidget {
  var gasCtrl = new MoneyMaskedTextController();
  var alcoolCtrl = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunction;

  SubmitForm({
    @required this.gasCtrl,
    @required this.alcoolCtrl,
    @required this.busy,
    @required this.submitFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Input(
          label: 'Gasolina',
          controller: gasCtrl,
        ),
        Input(
          label: 'Alcool',
          controller: alcoolCtrl,
        ),
        LoadingButton(
          text: 'CALCULAR',
          invert: false,
          busy: busy,
          func: submitFunction,
        ),
      ],
    );
  }
}
