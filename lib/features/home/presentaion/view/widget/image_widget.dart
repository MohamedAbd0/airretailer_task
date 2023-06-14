import 'package:flutter/material.dart';

class ProfileImageWidget extends StatelessWidget {
  final double radius;
  final String imageUrl;
  final bool online;

  const ProfileImageWidget({
    super.key,
    required this.radius,
    required this.imageUrl,
    required this.online,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(imageUrl),
        ),
        if (online)
          SizedBox(
            width: radius * 2,
            height: radius * 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all((radius / 3) / 2),
                  child: Container(
                    width: radius / 3,
                    height: radius / 3,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
