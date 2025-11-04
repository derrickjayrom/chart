import 'package:flutter/material.dart';

class Newstatcard extends StatefulWidget {
  final String title;
  final String value;
  final String? changeText;
  final String? subText;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  final bool shouldApplyBorder;

  const Newstatcard({
    super.key,
    required this.title,
    required this.value,
    this.changeText,
    this.subText,
    this.backgroundColor,
    this.borderColor,
    this.onTap,
    required this.shouldApplyBorder,
  });

  @override
  State<Newstatcard> createState() => _NewstatcardState();
}

class _NewstatcardState extends State<Newstatcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      width: 171,
      height: 90,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        border: widget.shouldApplyBorder == true
            ? Border.all(
                color: widget.borderColor ?? Color(0xFFE3FBD9),
                width: 2,
              )
            : Border.all(width: 0, color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            widget.value,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (widget.changeText != null || widget.subText != null)
            Row(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.changeText != null)
                  Text(
                    widget.changeText!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFFF2C5E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                if (widget.subText != null)
                  Expanded(
                    child: Text(
                      widget.subText!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF8A8A8A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
