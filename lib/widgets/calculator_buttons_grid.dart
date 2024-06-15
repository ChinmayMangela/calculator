import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:calculator_app/widgets/my_button.dart';

import '../providers/calculator_button_text_provider.dart';

class CalculatorButtonsGrid extends StatelessWidget {
  const CalculatorButtonsGrid({
    super.key,
    required this.onButtonTap,
  });

  final void Function(String buttonText) onButtonTap;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final buttonTextProvider =
    Provider.of<CalculatorButtonTextsProvider>(context);
    List<String> btnText =
        context.read<CalculatorButtonTextsProvider>().buttonTexts;
    return Expanded(
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.65,
        margin: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: btnText.length,
          itemBuilder: (context, index) {
            String currentButtonText = buttonTextProvider.buttonTexts[index];
            return MyButton(
              onButtonTap: () {
                onButtonTap(currentButtonText);
              },
              btnText: currentButtonText,
            );
          },
        ),
      ),
    );
  }


}
