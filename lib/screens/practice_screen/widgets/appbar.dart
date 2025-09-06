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
  });

  final String? title;
  final bool showBackArrow;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8),
      child: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        centerTitle: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: leadingOnPressed,
                icon: Icon(Iconsax.arrow_left, color: FcColors.white,),
              )
            : SizedBox(),
        title: Text(
          title ?? '',
          style: TextStyle(
            color: FcColors.white,
            fontSize: 30,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Iconsax.add, color: FcColors.white,size: 30,)),
          IconButton(onPressed: () {}, icon: Icon(Iconsax.shuffle, color: FcColors.white,)),
          IconButton(onPressed: () {}, icon: Icon(Iconsax.filter, color: FcColors.white,)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight);
}