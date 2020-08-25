import 'package:alcool_ou_gasolina/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  var result = '';
  Function reset;
  Success({
    @required this.result,
    @required this.reset,
  });

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> with SingleTickerProviderStateMixin {
  Tween<double> _scaleTween = Tween(begin: 0, end: 1);
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TweenAnimationBuilder(
        tween: _scaleTween,
        duration: Duration(milliseconds: 800),
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  child: widget.result == 'Preencha os campos'
                      ? SizedBox()
                      : widget.result == 'Compensa Utilizar Alcool'
                          ? RotationTransition(
                              turns: _animationController,
                              child: Image.asset(
                                'assets/images/etanol.png',
                                height: 70,
                                width: 70,
                              ),
                            )
                          : RotationTransition(
                              turns: _animationController,
                              child: Image.asset(
                                'assets/images/gasolina.png',
                                height: 70,
                                width: 70,
                              ),
                            ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8, left: 8),
                  child: Text(
                    widget.result,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 40,
                      fontFamily: 'Big Shoulders Display',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                LoadingButton(
                  text: 'CALCULAR NOVAMENTE',
                  invert: true,
                  busy: false,
                  func: widget.reset,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
