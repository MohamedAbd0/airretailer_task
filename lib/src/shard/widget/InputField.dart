// ignore_for_file: file_names

import '../../../core/constants/size.dart';
import '../app_colors.dart';
import 'package:flutter/material.dart';

class BoxInputField extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final String? title;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final void Function()? trailingTapped;

  const BoxInputField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.title,
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,
  }) : super(key: key);

  @override
  State<BoxInputField> createState() => _BoxInputFieldState();
}

class _BoxInputFieldState extends State<BoxInputField> {
  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(ConstantsSize.smallcornerRadius),
  );

  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    if (widget.password) {
      obscureText = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ConstantsSize.normalPadding),
      child: Column(
        children: [
          if (widget.title != null)
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title!,
              ),
            ),
          const SizedBox(height: ConstantsSize.smallPadding),
          TextField(
            controller: widget.controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              hintStyle: const TextStyle(
                color: kcMediumGreyColor,
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.all(ConstantsSize.normalPadding),
              prefixIcon: widget.leading,
              suffixIcon: widget.password
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: kcMediumGreyColor,
                      ),
                    )
                  : widget.trailing != null
                      ? GestureDetector(
                          onTap: widget.trailingTapped,
                          child: widget.trailing,
                        )
                      : null,
              border: circularBorder.copyWith(
                borderSide: const BorderSide(color: kcLightGreyColor),
              ),
              errorBorder: circularBorder.copyWith(
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedBorder: circularBorder.copyWith(
                borderSide: const BorderSide(color: kcPrimaryColor),
              ),
              enabledBorder: circularBorder.copyWith(
                borderSide: const BorderSide(color: kcLightGreyColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
