import 'package:flutter/material.dart';
import 'package:calculator_app/widgets/theme_changer.dart';
import 'package:calculator_app/widgets/text.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class ResultContainer extends StatelessWidget {
  const ResultContainer({
    super.key, required this.expression, required this.answer,
  });

  final String expression;
  final String answer;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: _resultContainerStyling(context),
      width: double.infinity,
      // height: screenHeight * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: screenHeight * 0.05),
          const ThemeChangerButton(),
          SizedBox(
            height: screenHeight * 0.04,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BuildText(text: expression, isBoldFont: false, textSize: screenHeight * 0.03)),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: BuildText(text: answer, isBoldFont: false, textSize: screenHeight * 0.05)),
        ],
      ),
    );
  }

  BoxDecoration _resultContainerStyling(BuildContext context) {
    const radius = Radius.circular(40);
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    return BoxDecoration(
      borderRadius:
      const BorderRadius.only(bottomLeft: radius, bottomRight: radius),
      color: isDarkMode
          ? Colors.grey.shade900
          : Theme.of(context).colorScheme.errorContainer,
    );
  }


}
