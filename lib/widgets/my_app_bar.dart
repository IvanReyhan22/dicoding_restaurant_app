import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:open_resto/common/styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? option;
  final String? title, prefixIcon;
  final TextAlign? titleAlign;

  const MyAppBar(
      {super.key, this.option, this.title, this.prefixIcon, this.titleAlign});

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
              if (prefixIcon != null) ...[
                InkWell(
                  onTap: () => Get.back(),
                  child:
                      Iconify(prefixIcon!, color: orange400, size: spacing * 4),
                ),
              ],
              Text(
                title ?? "",
                textAlign: titleAlign ?? TextAlign.center,
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
