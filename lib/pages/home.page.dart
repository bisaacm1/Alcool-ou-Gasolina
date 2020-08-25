import 'package:alcool_ou_gasolina/widgets/logo.wiget.dart';
import 'package:alcool_ou_gasolina/widgets/submit-form.widget.dart';
import 'package:alcool_ou_gasolina/widgets/success.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _busy = false;
  var _completed = false;
  var _resultText = '';
  var _gasCtrl = MoneyMaskedTextController();
  var _alcCtrl = MoneyMaskedTextController();

  Color _color = Colors.deepPurpleAccent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(seconds: 3),
          color: _color,
          child: ListView(
            children: <Widget>[
              Logo(),
              _completed
                  ? Success(
                      result: _resultText,
                      reset: reset,
                    )
                  : SubmitForm(
                      gasCtrl: _gasCtrl,
                      alcoolCtrl: _alcCtrl,
                      busy: _busy,
                      submitFunction: calculete,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future calculete() async {
    //new RegExp(r'[,.]'), '' = significa tudo que tem ",." ele troca por ''
    double alc =
        double.parse(_alcCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), '')) / 100;

    var res = alc / gas;

    setState(() {
      _completed = false;
      _busy = true;
      _color = Colors.purple;
    });

    return Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (_gasCtrl.numberValue.toDouble() == 0.00 &&
            _alcCtrl.numberValue.toDouble() == 0.00) {
          setState(() {
            _resultText = 'Preencha os campos';
          });
        } else {
          if (res > 0.7) {
            _resultText = 'Compensa Utilizar Gasolina';
          } else {
            _resultText = 'Compensa Utilizar Alcool';
          }
        }

        _completed = true;
        _busy = false;
      });
    });
  }

  void reset() {
    setState(() {
      _alcCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();

      _completed = false;
      _busy = false;

      _color = Colors.deepPurple;
    });
  }
}
