import 'package:bookstore/src/features/profile/theme/profile_text_style.dart';
import 'package:flutter/material.dart';

class ProfileBtn extends StatelessWidget {
  const ProfileBtn({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: Colors.white,
      ),
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: ProfileTextStyle.profileText,
            ),
            IconButton(onPressed: onPressed, icon: Icon(icon)),
          ],
        ),
      ),
    );
  }
}
