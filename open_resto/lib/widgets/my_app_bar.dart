import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:open_resto/globals/styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? option;
  final String? title;
  const MyAppBar({super.key, this.option, this.title});

  @override
  Size get preferredSize => const Size.fromHeight(spacing * 8);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: spacing * 2),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Iconify(Uil.angle_left_b,
                    color: orange400, size: spacing * 4),
              ),
              Text(
                title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    ?.copyWith(color: orange400, fontWeight: FontWeight.w500),
              ),
              option ?? const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
