// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../../../core/constants/size.dart';
import '../app_colors.dart';

class SearchInputField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const SearchInputField({super.key, required this.onChanged});

  @override
  State<SearchInputField> createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ConstantsSize.normalPadding),
      child: TextField(
        controller: controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: 'Search by name',
          hintStyle: const TextStyle(
            color: kcMediumGreyColor,
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.all(ConstantsSize.normalPadding),
          suffix: InkWell(
            child: const Icon(
              Icons.clear,
              color: kcMediumGreyColor,
            ),
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              controller.clear();
              widget.onChanged('');
            },
          ),
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(ConstantsSize.smallcornerRadius),
            borderSide: const BorderSide(color: kcLargeGreyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(ConstantsSize.smallcornerRadius),
            borderSide: const BorderSide(color: kcLargeGreyColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(ConstantsSize.smallcornerRadius),
            borderSide: const BorderSide(color: kcLargeGreyColor),
          ),
        ),
      ),
    );
  }
}
