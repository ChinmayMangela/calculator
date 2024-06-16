import 'package:flutter/material.dart';
import 'package:calculator_app/widgets/text.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.btnText,
    required this.onButtonTap,
  });

  final String btnText;
  final void Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    final btnColor = getButtonTextColor(btnText, context);
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        onButtonTap();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: btnColor,
          shape: BoxShape.circle,
        ),
        child: BuildText(
          text: btnText,
          isBoldFont: true,
          textSize: 25,
        ),
      ),
    );
  }

  Color getButtonTextColor(String text, BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    final operatorSymbols = ['( )', '%', '/', '×', '-', '+', '='];
    if (operatorSymbols.contains(text)) {
      return isDarkMode
          ? const Color(0xFF4a148c)
          : Theme.of(context).colorScheme.errorContainer;
    } else if (text == 'AC') {
      return isDarkMode
          ? const Color(0xFF1b5e20)
          : const Color.fromARGB(255, 253, 226, 186);
    } else {
      return isDarkMode
          ? Colors.grey.shade900
          : const Color.fromARGB(255, 253, 236, 236);
    }
  }
}
