import 'package:flutter/material.dart';

class ButtonLoginWith extends StatelessWidget {
  final AssetImage iconImage;
  final VoidCallback onPressed;

  const ButtonLoginWith({
    Key? key,
    required this.iconImage,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      child: ImageIcon(
        iconImage,
        color: const Color(0xFF5D6A85),
      ),
    );
  }
}