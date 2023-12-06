import 'package:flutter/material.dart';

class ProfileTopbar extends StatelessWidget {
  const ProfileTopbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      width: MediaQuery.of(context).size.width,
      child: Text(
        "Profil",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
