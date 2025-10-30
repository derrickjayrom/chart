import 'package:flutter/material.dart';

class StatCard extends StatefulWidget {
  final String title;
  final String value;
  final String? changeText;
  final String? subText;
  final Color? backgroundColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  final bool shouldApplyBorder;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.changeText,
    this.subText,
    this.backgroundColor,
    this.onTap,
    this.borderColor,
    required this.shouldApplyBorder,
  });

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.white,
        border: widget.shouldApplyBorder == true
            ? Border.all(
                color: widget.borderColor ?? Color(0xFFE3FBD9),
                width: 2,
              )
            : Border.all(width: 0, color: Colors.transparent),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            widget.value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          if (widget.changeText != null || widget.subText != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  if (widget.changeText != null)
                    Text(
                      widget.changeText!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (widget.subText != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
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
            ),
        ],
      ),
    );
  }
}
