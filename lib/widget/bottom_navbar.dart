import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'outline': 'assets/icons/home.svg',
        'active': 'assets/icons/home_active.svg',
        'label': 'Home',
        'type': 'svg',
      },
      {
        'outline': 'assets/icons/wallet.svg',
        'active': 'assets/icons/wallet_active.svg',
        'label': 'Withdrawals',
        'type': 'svg',
      },
      {
        'outline': 'assets/icons/store.svg',
        'active': 'assets/icons/store_active.svg',
        'label': 'Stores',
        'type': 'svg',
      },
      {
        'outline': 'assets/icons/credit_card.svg',
        'active': 'assets/icons/credit_card_active.svg',
        'label': 'Cards',
        'type': 'svg',
      },
      {
        'outline': 'assets/icons/avatar.png',
        'active': 'assets/icons/avatar.png',
        'label': 'Profile',
        'type': 'png',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFF2F2F2))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final isActive = widget.currentIndex == index;
          final item = items[index];

          return GestureDetector(
            onTap: () => widget.onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                item['type'] == 'svg'
                    ? SvgPicture.asset(
                        isActive ? item['active']! : item['outline']!,
                        height: 26,
                        colorFilter: ColorFilter.mode(
                          isActive ? Colors.black : const Color(0xFF8A8A8A),
                          BlendMode.srcIn,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          item['outline']!,
                          height: 28,
                          width: 28,
                          fit: BoxFit.cover,
                        ),
                      ),
                const SizedBox(height: 4),
                Text(
                  item['label']!,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    color: isActive ? Colors.black : const Color(0xFF8A8A8A),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
