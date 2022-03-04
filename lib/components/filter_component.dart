import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const Filter({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          Text(text),
        ],
      ),
    );
  }
}
