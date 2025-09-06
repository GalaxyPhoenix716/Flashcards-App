import 'package:flashcards_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FcAppbar extends StatelessWidget implements PreferredSizeWidget {
  const FcAppbar({
    super.key,
    this.title,
    required this.showBackArrow,
    this.actions,
    this.leadingOnPressed,
    this.onShuffle,  
  });

  final String? title;
  final bool showBackArrow;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final VoidCallback? onShuffle; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8), 
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        centerTitle: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: leadingOnPressed,
                icon: const Icon(Iconsax.arrow_left, color: FcColors.white),
              )
            : const SizedBox(),
        title: Text(
          title ?? '',
          style: const TextStyle(
            color: FcColors.white,
            fontSize: 30,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.add, color: FcColors.white, size: 30),
          ),
          IconButton(
            onPressed: onShuffle, 
            icon: const Icon(Iconsax.shuffle, color: FcColors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.filter, color: FcColors.white),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
