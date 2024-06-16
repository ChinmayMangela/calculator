import 'package:calculator_app/widgets/calculator_buttons_grid.dart';
import 'package:calculator_app/widgets/result_container.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _expression = '';
  String _result = '';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      body: _buildBody(context, screenHeight, brightness),
    );
  }

  Widget _buildBody(
      BuildContext context, double screenHeight, Brightness brightness) {
    return Column(
      children: [
        Expanded(
          child: ResultContainer(
            expression: _expression,
            answer: _result,
          ),
        ),
        Expanded(
          flex: 2,
          child: CalculatorButtonsGrid(onButtonTap: _handleButtonTap),),
      ],
    );
  }


  void _handleButtonTap(String buttonText) {
    switch(buttonText) {
      case 'AC':
        _clear();
        break;
      case 'DEL':
        _delete();
        break;
      case '=':
        _evaluate();
        break;
      default:
        _append(buttonText);
    }
  }

  void _clear() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  void _delete() {
    setState(() {
      if(_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    });
  }

  void _append(String text) {
    setState(() {
      _expression = _expression + text;
    });
  }

  void _evaluate() {
    try {
      String finalExpression = _expression;
      finalExpression = finalExpression.replaceAll('×', '*');
      if(finalExpression.contains('/0')) {
        setState(() {
          _result = 'Can\'t divide by 0';
        });
        return;
      }
      if(finalExpression.contains('%0')) {
        setState(() {
          _result = '0';
        });
        return;
      }
      Parser p = Parser();
      Expression exp = p.parse(finalExpression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        _result = eval.toString();
      });
    } catch(e) {
      setState(() {
        _result = 'Error';
      });
    }
  }

}
