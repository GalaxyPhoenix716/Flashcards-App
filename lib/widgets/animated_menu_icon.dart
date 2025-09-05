import 'package:flutter/material.dart';

class AnimatedMenuIcon extends StatefulWidget {
  final bool isOpen;
  final Color color;
  final AnimationController animationController;

  const AnimatedMenuIcon({
    super.key,
    required this.color,
    required this.isOpen,
    required this.animationController,
  });

  @override
  State<AnimatedMenuIcon> createState() => _AnimatedMenuIconState();
}

class _AnimatedMenuIconState extends State<AnimatedMenuIcon> {
  late bool _isOpen;

  @override
  void initState() {
    super.initState();
    _isOpen = widget.isOpen;
  }

  void _iconTapped() {
    if (_isOpen) {
      widget.animationController.reverse();
    } else {
      widget.animationController.forward();
    }
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _iconTapped,
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        color: widget.color,
        progress: widget.animationController,
      ),
    );
  }
}
