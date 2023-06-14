import 'package:airretailer_task/core/constants/extensions/context.dart';
import 'package:airretailer_task/features/home/domain/entities/user_profile.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/size.dart';
import '../../../../../src/shard/app_colors.dart';
import '../../../../../src/shard/widget/box_text.dart';
import 'image_widget.dart';

class PersonalCard extends StatelessWidget {
  final UserProfile user;
  const PersonalCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final radius = context.width * 0.15;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kcMediumGreyColor,
        ),
        borderRadius: BorderRadius.circular(
          ConstantsSize.largecornerRadius,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileImageWidget(
                  radius: radius,
                  imageUrl: user.photoUrl,
                  online: user.online,
                ),
                Container(
                  padding: const EdgeInsets.all(ConstantsSize.normalPadding),
                  margin: const EdgeInsets.symmetric(
                    vertical: ConstantsSize.smallPadding,
                  ),
                  decoration: BoxDecoration(
                    color: kcLightGreyColor,
                    border: Border.all(
                      color: kcLightGreyColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      ConstantsSize.normalcornerRadius,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BoxText.title(user.name),
                        BoxText.normal(user.email),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BoxText.normal(user.phoneNumber),
                    BoxText.normal(user.address),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: context.width,
            height: context.height * 0.025,
            decoration: BoxDecoration(
              color: kcLightRedColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                  ConstantsSize.largecornerRadius,
                ),
                bottomRight: Radius.circular(
                  ConstantsSize.largecornerRadius,
                ),
              ),
              border: Border.all(
                color: kcLightRedColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
