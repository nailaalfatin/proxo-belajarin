// file: quiz_option_list.dart
import 'package:flutter/material.dart';
import 'package:belajarin_app/consts.dart';

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
    // Label abjad untuk setiap opsi
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
              // Sedikit highlight kalau opsi ini terpilih
              color: isSelected
                  ? primaryColor.withOpacity(0.1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? primaryColor : Colors.grey.shade300,
              ),
            ),
            child: Row(
              children: [
                // Lingkaran dengan label A/B/C/D
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                    border: Border.all(
                      color: isSelected ? primaryColor : Colors.grey.shade300,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    alphaLabels[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Teks opsi
                Expanded(
                  child: Text(
                    options[index],
                    style: const TextStyle(fontSize: 16, color: Colors.black),
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
