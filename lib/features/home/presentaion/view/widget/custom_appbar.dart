import 'package:airretailer_task/core/constants/size.dart';
import 'package:flutter/material.dart';

import '../../../../../src/shard/app_colors.dart';
import '../../../../../src/shard/widget/box_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    return PreferredSize(
      preferredSize: appBar.preferredSize,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: ConstantsSize.largePadding,
          vertical: ConstantsSize.normalPadding,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: ConstantsSize.largePadding,
          vertical: ConstantsSize.smallPadding,
        ),
        decoration: BoxDecoration(
          color: kcLightGreyColor,
          border: Border.all(
            color: kcLightGreyColor,
          ),
          borderRadius: BorderRadius.circular(
            ConstantsSize.xxlargecornerRadius,
          ),
        ),
        child: const BoxText.subheading('Users'),
      ),
    );
  }
}
