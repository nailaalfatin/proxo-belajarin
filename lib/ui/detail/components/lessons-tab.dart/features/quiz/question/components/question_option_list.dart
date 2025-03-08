import 'package:belajarin_app/consts.dart';
import 'package:flutter/material.dart';

class QuestionOptionList extends StatelessWidget {
  final List<String> options;
  final int? selectedOption;
  final Function(int) onOptionSelected;

  const QuestionOptionList({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Label abjad untuk tiap opsi
    final alphaLabels = ["A", "B", "C", "D"];
    return Column(
      children: List.generate(options.length, (index) {
        final isSelected = (selectedOption == index);
        return InkWell(
          onTap: () => onOptionSelected(index),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected
                  ? primaryColor.withOpacity(0.1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: isSelected
                      ? primaryColor
                      : Colors.grey.shade300),
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                    border: Border.all(
                        color: isSelected
                            ? primaryColor
                            : Colors.grey.shade300),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    alphaLabels[index],
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    options[index],
                    style: const TextStyle(
                        fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}