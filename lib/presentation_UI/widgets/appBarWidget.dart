import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;
  const AppBarWidget({
    super.key,
    required this.title,
    required this.backButton,
  });

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backButton
          ? const BackButton(
              color: Colors.black87,
            )
          : null,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }
}
