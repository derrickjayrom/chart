import 'package:bankapp/utils/app_colors.dart';
import 'package:bankapp/widget/revenuesummary.dart';
import 'package:bankapp/widget/simplelinechart.dart';
import 'package:bankapp/widget/statscard.dart';
import 'package:bankapp/widget/summary_card.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kscaffoldBackgroundColor,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        titleSpacing: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Welcome back,\n",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      TextSpan(
                        text: "Mustapha!",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.borderColorLightGrey,
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Center(
                        child: Icon(
                          Icons.notifications_active,
                          color: AppColors.darkColor,
                          size: 16,
                        ),
                      ),
                      Positioned(
                        top: -14,
                        left: 16,
                        child: Container(
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                            color: AppColors.cream,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: AppColors.white,
                            ),
                          ),
                          child: Center(
                            // child: Text(
                            //   userProvider.notificationModel!.totalNotifications
                            //       .toString(),
                            //   style: TextStyle(
                            //     color: Colors.black,
                            //     fontSize: 10,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: HomePageProperties.kPaddingHorizontal,
          vertical: HomePageProperties.kPaddingVertical,
        ),
        child: Column(
          children: [
            RevenueSummary(
              title: "Available to withdraw",
              amount: '\$9,476.00',
              changeValue: '+\$48.2',
              changeLabel: 'this week.',
            ),
            SizedBox(height: 32),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 16 / 11,
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: [
                StatCard(
                  title: 'Orders',
                  value: '314',
                  changeText: '+23',
                  subText: 'this week',
                  shouldApplyBorder: false,
                ),
                StatCard(
                  title: 'Gross profit',
                  value: '\$824.00',
                  changeText: '-\$42.2',
                  subText: 'this week',
                  shouldApplyBorder: false,
                ),
                StatCard(
                  shouldApplyBorder: false,
                  title: 'Orders',
                  value: '\$0.00',
                ),

                StatCard(
                  title: 'Next payout',
                  value: 'July 16',
                  shouldApplyBorder: true,
                  backgroundColor: Color(0xFFF5FFDC),
                ),
              ],
            ),
            SizedBox(height: 32),
            const SimpleLineChart(),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: SummaryCard(
                    value: '50+',
                    label: 'Orders to fulfill',
                    icon: Icons.inventory,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: SummaryCard(
                    value: '4',
                    label: 'High risk orders',
                    icon: Icons.inventory,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: SummaryCard(
                    value: '50+',
                    label: 'Chargebacks',
                    icon: Icons.inventory,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
