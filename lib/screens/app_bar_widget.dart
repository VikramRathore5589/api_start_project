
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.0,
      backgroundColor: Colors.blue,
      title: const Text(
        'Crypto News',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        TextButton(
            onPressed: () {},
            child: const Text(
              'i',
              style: TextStyle(color: Colors.white),
            )),
        const Icon(
          Icons.search,
          color: Colors.white,
        ),
        const SizedBox(
          width: 16,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
