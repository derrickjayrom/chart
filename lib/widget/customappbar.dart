import 'package:bankapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

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
            height: AppBarProperties.kNotificationBtnHeight,
            width: AppBarProperties.kNotificationBtnWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppBarProperties.kNotificationBtnRadius,
              ),
              border: Border.all(color: const Color(0xFFF2F2F2), width: 2),
            ),
            child: const Icon(Icons.notifications_none_rounded, size: 20),
          ),
        ),
        if (widget.notificationCount > 0)
          Positioned(
            top: AppBarProperties.kNotificationCountPositiontop,
            right: AppBarProperties.kNotificationCountPositionright,
            child: Container(
              height: AppBarProperties.kNotificationCountHeight,
              width: AppBarProperties.kNotificationCountWidth,
              decoration: BoxDecoration(
                color: AppBarProperties.kNotificationCount,
                borderRadius: BorderRadius.circular(
                  AppBarProperties.kNotificationCountRadius,
                ),
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
