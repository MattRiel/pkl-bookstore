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
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        // color: isDark ? Colors.grey : Colors.white,
      ),
      height: 44,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.bodyLarge),
          IconButton(onPressed: onPressed, icon: Icon(icon)),
        ],
      ),
    );
  }
}
