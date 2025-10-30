import 'package:flutter/material.dart';

const Color kNotificationCount = Color(0xFFF5FFDC);
const double kNotificationCountPositiontop = -10;
const double kNotificationCountPositionright = -5;
const double kNotificationCountHeight = 22;
const double kNotificationCountWidth = 22;
const double kNotificationCountRadius = 99;

const double kNotificationBtnHeight = 36;
const double kNotificationBtnWidth = 36;
const double kNotificationBtnRadius = 12;

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WelcomeText(userName: 'Mustapha'),
        NotificationIcon(notificationCount: 2),
      ],
    );
  }
}

class WelcomeText extends StatefulWidget {
  final String userName;

  const WelcomeText({super.key, required this.userName});

  @override
  State<WelcomeText> createState() => _WelcomeTextState();
}

class _WelcomeTextState extends State<WelcomeText> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Welcome back\n',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.4,
            ),
          ),
          TextSpan(
            text: '${widget.userName}!',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationIcon extends StatefulWidget {
  final int notificationCount;
  final VoidCallback? onTap;

  const NotificationIcon({
    super.key,
    required this.notificationCount,
    this.onTap,
  });

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            height: kNotificationBtnHeight,
            width: kNotificationBtnWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kNotificationBtnRadius),
              border: Border.all(color: const Color(0xFFF2F2F2), width: 2),
            ),
            child: const Icon(Icons.notifications_none_rounded, size: 20),
          ),
        ),
        if (widget.notificationCount > 0)
          Positioned(
            top: kNotificationCountPositiontop,
            right: kNotificationCountPositionright,
            child: Container(
              height: kNotificationCountHeight,
              width: kNotificationCountWidth,
              decoration: BoxDecoration(
                color: kNotificationCount,
                borderRadius: BorderRadius.circular(kNotificationCountRadius),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: Center(
                child: Text(
                  '${widget.notificationCount}',
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
