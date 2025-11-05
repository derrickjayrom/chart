import 'package:flutter/material.dart';

class RevenueSummary extends StatefulWidget {
  final String title;
  final String amount;
  final String changeValue;
  final String changeLabel;
  final Color changeColor;

  const RevenueSummary({
    super.key,
    required this.title,
    required this.amount,
    required this.changeValue,
    required this.changeLabel,
    this.changeColor = Colors.red,
  });

  @override
  State<RevenueSummary> createState() => _RevenueSummaryState();
}

class _RevenueSummaryState extends State<RevenueSummary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFBFBFB),
      child: Column(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
              letterSpacing: 0.4,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            widget.amount,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.changeValue,
                style: TextStyle(
                  fontSize: 14,
                  color: widget.changeColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                widget.changeLabel,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8A8A8A),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
